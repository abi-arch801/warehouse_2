import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class RequestCreateScreen extends StatefulWidget {
  final AppUser currentUser;
  const RequestCreateScreen({super.key, required this.currentUser});

  @override
  State<RequestCreateScreen> createState() => _RequestCreateScreenState();
}

class _RequestCreateScreenState extends State<RequestCreateScreen> {
  String? _warehouseId;
  final _purposeCtrl = TextEditingController();
  final List<_Draft> _items = [];
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _purposeCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _purposeCtrl.dispose();
    super.dispose();
  }

  bool get _canSubmit =>
      _warehouseId != null &&
      _purposeCtrl.text.trim().isNotEmpty &&
      _items.isNotEmpty &&
      _items.every((i) => i.productId != null && i.quantity > 0);

  void _pickFile() {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Text('Pilih Sumber Lampiran',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 14),
              _src(Icons.description_rounded, 'SPK Marketing.pdf',
                  'Surat Perintah Kerja'),
              _src(Icons.assignment_rounded, 'Surat Tugas.pdf',
                  'Surat tugas internal'),
              _src(Icons.receipt_long_rounded, 'Memo Direksi.pdf',
                  'Memo persetujuan direksi'),
              _src(Icons.inventory_rounded, 'BAST Internal.pdf',
                  'Berita acara serah terima'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _src(IconData icon, String name, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HapticFeedback.lightImpact();
            setState(() => _filePath = name);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$name terlampir'),
                backgroundColor: AppColors.success,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.infoSoft,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColors.info, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style:
                              const TextStyle(fontWeight: FontWeight.w700)),
                      Text(subtitle,
                          style: const TextStyle(
                              color: AppColors.textMuted, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right,
                    color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final db = MockDB.instance;
    final code =
        'REQ/2026/${(db.requests.length + 1).toString().padLeft(4, '0')}';
    db.requests.add(StockRequest(
      id: 'r${DateTime.now().millisecondsSinceEpoch}',
      code: code,
      requesterId: widget.currentUser.id,
      warehouseId: _warehouseId!,
      purpose: _purposeCtrl.text.trim(),
      items: _items
          .map((i) => StockRequestItem(
              productId: i.productId!, quantity: i.quantity))
          .toList(),
      status: DocStatus.pending,
      createdAt: DateTime.now(),
      filePath: _filePath,
    ));
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request $code terkirim, menunggu approval'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Request')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _canSubmit ? 1 : 0.5,
            child: ElevatedButton(
              onPressed: _canSubmit ? _submit : null,
              child: const Text('Kirim Request'),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        children: [
          _label('Gudang Asal'),
          DropdownButtonFormField<String>(
            initialValue: _warehouseId,
            items: db.warehouses
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) {
              HapticFeedback.selectionClick();
              setState(() => _warehouseId = v);
            },
            decoration: const InputDecoration(hintText: 'Pilih gudang'),
          ),
          _label('Keperluan'),
          TextField(
            controller: _purposeCtrl,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText:
                  'Contoh: Distribusi marketing, kebutuhan kantor...',
            ),
          ),
          _label('Lampiran SPK / Surat Tugas'),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: _filePath == null
                ? OutlinedButton.icon(
                    key: const ValueKey('empty'),
                    onPressed: _pickFile,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.border,
                        style: BorderStyle.solid,
                      ),
                      foregroundColor: AppColors.info,
                      minimumSize: const Size.fromHeight(56),
                    ),
                    icon: const Icon(Icons.attach_file_rounded),
                    label:
                        const Text('Lampirkan dokumen (opsional)'),
                  )
                : Container(
                    key: ValueKey(_filePath),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.infoSoft,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.info.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.description_rounded,
                            color: AppColors.info),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _filePath!,
                            style: const TextStyle(
                              color: AppColors.info,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded,
                              size: 18),
                          color: AppColors.danger,
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            setState(() => _filePath = null);
                          },
                        ),
                      ],
                    ),
                  ),
          ),
          _label('Daftar Barang'),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: Column(
              children: _items.asMap().entries.map((e) {
                final idx = e.key;
                final item = e.value;
                final p = item.productId == null
                    ? null
                    : db.productById(item.productId!);
                final available = (p != null && _warehouseId != null)
                    ? (db.stockOf(p.id, _warehouseId!)?.quantity ?? 0)
                    : 0;
                final overStock = item.quantity > available;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(
                      color: overStock
                          ? AppColors.danger
                          : AppColors.border,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.warningSoft,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Item ${idx + 1}',
                                style: const TextStyle(
                                    color: AppColors.warning,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () =>
                                setState(() => _items.removeAt(idx)),
                            icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: AppColors.danger,
                                size: 20),
                          ),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        initialValue: item.productId,
                        items: db.products
                            .map((p) => DropdownMenuItem(
                                  value: p.id,
                                  child: Text('${p.name} (${p.unit})'),
                                ))
                            .toList(),
                        onChanged: (v) =>
                            setState(() => item.productId = v),
                        decoration: const InputDecoration(
                            hintText: 'Pilih produk'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _qtyBtn(Icons.remove_rounded, () {
                            setState(() {
                              if (item.quantity > 0) item.quantity--;
                            });
                          }),
                          Expanded(
                            child: Center(
                              child: Column(
                                children: [
                                  Text('${item.quantity} ${p?.unit ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                  if (p != null && _warehouseId != null)
                                    Text(
                                      'Tersedia: $available ${p.unit}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: overStock
                                            ? AppColors.danger
                                            : AppColors.textMuted,
                                        fontWeight: overStock
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          _qtyBtn(Icons.add_rounded, () {
                            setState(() => item.quantity++);
                          }),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              HapticFeedback.lightImpact();
              setState(() => _items.add(_Draft()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Item'),
          ),
        ],
      ),
    );
  }

  Widget _label(String s) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 16, 0, 6),
        child:
            Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
      );

  Widget _qtyBtn(IconData icon, VoidCallback onTap) => Material(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Icon(icon, color: AppColors.warning),
          ),
        ),
      );
}

class _Draft {
  String? productId;
  int quantity = 0;
}
