import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class ProductsScreen extends StatefulWidget {
  /// Pengguna saat ini. Dipakai untuk mencatat siapa yang mengubah harga
  /// dan untuk membatasi siapa yang bisa edit (admin & super admin).
  final AppUser? currentUser;

  const ProductsScreen({super.key, this.currentUser});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String _search = '';
  String? _selectedCategoryId; // null = semua kategori
  final _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  bool get _canEditPrice {
    final u = widget.currentUser;
    if (u == null) return true; // fallback: izinkan kalau user tidak diset
    return u.role == UserRole.admin || u.role == UserRole.superAdmin;
  }

  void _add() {
    final name = TextEditingController();
    final sku = TextEditingController();
    final unit = TextEditingController(text: 'pcs');
    final minStock = TextEditingController(text: '5');
    final hpp = TextEditingController(text: '0');
    String? categoryId;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSt) {
          final mq = MediaQuery.of(ctx);
          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 16,
              bottom: 24 + mq.viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const Text('Tambah Produk',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  TextField(
                    controller: name,
                    decoration:
                        const InputDecoration(labelText: 'Nama Produk'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: sku,
                    decoration: const InputDecoration(labelText: 'SKU'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: unit,
                          decoration:
                              const InputDecoration(labelText: 'Satuan'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: minStock,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'Min Stok'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: hpp,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Harga Pokok (HPP)',
                      prefixText: 'Rp ',
                      helperText:
                          'Dibutuhkan untuk kalkulasi nilai jurnal keuangan',
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    initialValue: categoryId,
                    items: MockDB.instance.categories
                        .map((c) => DropdownMenuItem(
                            value: c.id, child: Text(c.name)))
                        .toList(),
                    onChanged: (v) => setSt(() => categoryId = v),
                    decoration:
                        const InputDecoration(labelText: 'Kategori'),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {
                      if (name.text.isEmpty || categoryId == null) return;
                      setState(() {
                        MockDB.instance.products.add(Product(
                          id: 'p${DateTime.now().millisecondsSinceEpoch}',
                          sku: sku.text,
                          barcode:
                              '8900${DateTime.now().millisecondsSinceEpoch.toString().substring(5, 12)}',
                          name: name.text,
                          unit: unit.text,
                          categoryId: categoryId!,
                          minStock: int.tryParse(minStock.text) ?? 5,
                          hargaPokok:
                              double.tryParse(hpp.text) ?? 0,
                          status: DocStatus.pending,
                        ));
                      });
                      Navigator.pop(ctx);
                      HapticFeedback.lightImpact();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Produk ditambahkan, menunggu approval')),
                      );
                    },
                    child: const Text('Simpan Produk'),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  /// Buka editor harga untuk produk [p]. Hanya admin & super admin.
  void _editPrice(Product p) {
    if (!_canEditPrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hanya admin & super admin yang bisa mengubah harga'),
          backgroundColor: AppColors.danger,
        ),
      );
      return;
    }
    final ctrl = TextEditingController(
      text: p.hargaPokok > 0
          ? p.hargaPokok.toStringAsFixed(0)
          : '',
    );
    final reasonCtrl = TextEditingController();
    final formatter = _rupiah;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSt) {
          final mq = MediaQuery.of(ctx);
          final newVal = double.tryParse(ctrl.text) ?? 0;
          final diff = newVal - p.hargaPokok;
          final hasChange = diff != 0 && newVal > 0;
          final pctChange = p.hargaPokok > 0
              ? (diff / p.hargaPokok) * 100
              : 0.0;

          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 16,
              bottom: 24 + mq.viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.payments_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ubah Harga Produk',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 2),
                            Text(
                              '${p.name} · ${p.sku}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.history_rounded,
                            size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        const Text('HPP saat ini',
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textMuted)),
                        const Spacer(),
                        Text(
                          p.hargaPokok > 0
                              ? formatter.format(p.hargaPokok)
                              : 'Belum diset',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: ctrl,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (_) => setSt(() {}),
                    decoration: const InputDecoration(
                      labelText: 'HPP Baru',
                      prefixText: 'Rp ',
                      helperText:
                          'Nilai ini dipakai sebagai dasar perhitungan jurnal',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    children: [
                      _quickAdjust('-10%', () {
                        final v = (newVal == 0 ? p.hargaPokok : newVal) * 0.9;
                        ctrl.text = v.round().toString();
                        setSt(() {});
                      }),
                      _quickAdjust('-5%', () {
                        final v = (newVal == 0 ? p.hargaPokok : newVal) * 0.95;
                        ctrl.text = v.round().toString();
                        setSt(() {});
                      }),
                      _quickAdjust('+5%', () {
                        final v = (newVal == 0 ? p.hargaPokok : newVal) * 1.05;
                        ctrl.text = v.round().toString();
                        setSt(() {});
                      }),
                      _quickAdjust('+10%', () {
                        final v = (newVal == 0 ? p.hargaPokok : newVal) * 1.10;
                        ctrl.text = v.round().toString();
                        setSt(() {});
                      }),
                      _quickAdjust('Reset', () {
                        ctrl.text = p.hargaPokok > 0
                            ? p.hargaPokok.toStringAsFixed(0)
                            : '';
                        setSt(() {});
                      }, danger: true),
                    ],
                  ),
                  const SizedBox(height: 14),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    child: hasChange
                        ? Container(
                            key: ValueKey('${diff}_$newVal'),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: diff > 0
                                  ? AppColors.warningSoft
                                  : AppColors.successSoft,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: diff > 0
                                    ? AppColors.warning
                                        .withValues(alpha: 0.4)
                                    : AppColors.success
                                        .withValues(alpha: 0.4),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  diff > 0
                                      ? Icons.trending_up_rounded
                                      : Icons.trending_down_rounded,
                                  color: diff > 0
                                      ? AppColors.warning
                                      : AppColors.success,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        diff > 0
                                            ? 'Harga naik'
                                            : 'Harga turun',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: diff > 0
                                              ? AppColors.warning
                                              : AppColors.success,
                                        ),
                                      ),
                                      Text(
                                        '${diff > 0 ? '+' : ''}${formatter.format(diff)}'
                                        '${p.hargaPokok > 0 ? '  (${pctChange.toStringAsFixed(1)}%)' : ''}',
                                        style: const TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: reasonCtrl,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Alasan perubahan (opsional)',
                      hintText:
                          'Contoh: kenaikan harga supplier, promo, koreksi nota...',
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Batal'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: hasChange
                              ? () {
                                  final old = p.hargaPokok;
                                  setState(() {
                                    p.hargaPokok = newVal;
                                  });
                                  Navigator.pop(ctx);
                                  HapticFeedback.mediumImpact();
                                  final reason = reasonCtrl.text.trim();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.success,
                                      content: Text(
                                        'HPP ${p.name} diperbarui '
                                        '${formatter.format(old)} → '
                                        '${formatter.format(newVal)}'
                                        '${reason.isEmpty ? '' : '\nAlasan: $reason'}',
                                      ),
                                      duration:
                                          const Duration(seconds: 4),
                                    ),
                                  );
                                }
                              : null,
                          icon: const Icon(Icons.save_rounded, size: 18),
                          label: const Text('Simpan Harga'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      'Diubah oleh ${widget.currentUser?.name ?? 'pengguna'} · ${widget.currentUser?.role.label ?? '-'}',
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _quickAdjust(String label, VoidCallback onTap,
      {bool danger = false}) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: danger ? AppColors.danger : AppColors.primaryDark,
        ),
      ),
      backgroundColor:
          danger ? AppColors.dangerSoft : AppColors.primarySoft,
      side: BorderSide.none,
      onPressed: () {
        HapticFeedback.selectionClick();
        onTap();
      },
    );
  }

  /// Chip filter kategori. Aktif → warna primary penuh, non-aktif → outlined.
  Widget _categoryChip({
    required String label,
    required int count,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        selected: selected,
        onSelected: (_) {
          HapticFeedback.selectionClick();
          onTap();
        },
        showCheckmark: false,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.text,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: selected
                    ? Colors.white.withValues(alpha: 0.22)
                    : AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final q = _search.toLowerCase();

    // Filter berdasarkan search + kategori terpilih
    final products = db.products.where((p) {
      final matchSearch = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.sku.toLowerCase().contains(q);
      final matchCat = _selectedCategoryId == null ||
          p.categoryId == _selectedCategoryId;
      return matchSearch && matchCat;
    }).toList();

    final activeCat = _selectedCategoryId == null
        ? null
        : db.categoryById(_selectedCategoryId!);

    return Scaffold(
      appBar: AppBar(title: const Text('Produk')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _add,
        icon: const Icon(Icons.add),
        label: const Text('Produk Baru'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari produk atau SKU...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _search.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => setState(() => _search = ''),
                      ),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          // Filter kategori (horizontal scroll)
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              children: [
                _categoryChip(
                  label: 'Semua',
                  count: db.products.length,
                  selected: _selectedCategoryId == null,
                  onTap: () => setState(() => _selectedCategoryId = null),
                ),
                ...db.categories.map((c) {
                  final count =
                      db.products.where((p) => p.categoryId == c.id).length;
                  return _categoryChip(
                    label: c.name,
                    count: count,
                    selected: _selectedCategoryId == c.id,
                    onTap: () =>
                        setState(() => _selectedCategoryId = c.id),
                  );
                }),
              ],
            ),
          ),
          // Indikator kecil yang menunjukkan filter aktif & jumlah hasil
          if (activeCat != null || _search.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Row(
                children: [
                  const Icon(Icons.filter_list_rounded,
                      size: 14, color: AppColors.textMuted),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      [
                        if (activeCat != null) 'Kategori: ${activeCat.name}',
                        if (_search.isNotEmpty) 'Cari: "$_search"',
                      ].join(' · '),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${products.length} produk',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      _selectedCategoryId = null;
                      _search = '';
                    }),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      minimumSize: const Size(0, 28),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Reset',
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.search_off_rounded,
                              size: 48, color: AppColors.textMuted),
                          const SizedBox(height: 12),
                          Text(
                            activeCat != null
                                ? 'Tidak ada produk pada kategori "${activeCat.name}"'
                                : 'Produk tidak ditemukan',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 90),
                    itemCount: products.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final p = products[i];
                      final cat = db.categoryById(p.categoryId);
                      final total = db.totalStockOf(p.id);
                      final low = total <= p.minStock + 5;
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration:
                            Duration(milliseconds: 200 + (i * 50).clamp(0, 500)),
                        curve: Curves.easeOut,
                        builder: (_, v, child) => Opacity(
                          opacity: v,
                          child: Transform.translate(
                            offset: Offset(0, (1 - v) * 12),
                            child: child,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.primarySoft,
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                        Icons.inventory_2_rounded,
                                        color: AppColors.primary),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(p.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        const SizedBox(height: 2),
                                        Text(
                                            '${p.sku} · ${cat?.name ?? '-'} · ${p.unit}',
                                            style: const TextStyle(
                                                color: AppColors.textMuted,
                                                fontSize: 12)),
                                        const SizedBox(height: 4),
                                        Text(
                                            'Total: $total ${p.unit} (min ${p.minStock})',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: low
                                          ? AppColors.dangerSoft
                                          : AppColors.successSoft,
                                      borderRadius:
                                          BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      low ? 'Menipis' : 'Aman',
                                      style: TextStyle(
                                        color: low
                                            ? AppColors.danger
                                            : AppColors.success,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: _canEditPrice
                                    ? () => _editPrice(p)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.bg,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.payments_rounded,
                                          size: 16,
                                          color: AppColors.textMuted),
                                      const SizedBox(width: 6),
                                      const Text('HPP',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textMuted)),
                                      const Spacer(),
                                      Text(
                                        p.hargaPokok > 0
                                            ? _rupiah.format(p.hargaPokok)
                                            : 'Belum diset',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: p.hargaPokok > 0
                                              ? AppColors.text
                                              : AppColors.danger,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      _statusChip(p.status),
                                    ],
                                  ),
                                ),
                              ),
                              if (_canEditPrice) ...[
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: AppColors.primary,
                                          side: const BorderSide(
                                              color: AppColors.primary),
                                          minimumSize:
                                              const Size.fromHeight(38),
                                        ),
                                        onPressed: () => _editPrice(p),
                                        icon: const Icon(
                                            Icons.edit_rounded,
                                            size: 16),
                                        label: const Text(
                                          'Ubah Harga',
                                          style: TextStyle(fontSize: 12.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(DocStatus status) {
    Color color;
    String label;
    switch (status) {
      case DocStatus.pending:
        color = AppColors.warning;
        label = 'Pending';
        break;
      case DocStatus.approved:
        color = AppColors.success;
        label = 'Aktif';
        break;
      case DocStatus.rejected:
        color = AppColors.danger;
        label = 'Ditolak';
        break;
      default:
        color = AppColors.textMuted;
        label = status.name;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w700, fontSize: 11)),
    );
  }
}
