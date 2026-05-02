import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class PODetailScreen extends StatefulWidget {
  final String poId;
  final AppUser currentUser;
  const PODetailScreen({
    super.key,
    required this.poId,
    required this.currentUser,
  });

  @override
  State<PODetailScreen> createState() => _PODetailScreenState();
}

class _PODetailScreenState extends State<PODetailScreen> {
  bool _processing = false;
  final _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  Future<bool> _confirm(String title, String msg, Color color) async {
    final v = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Konfirmasi'),
          ),
        ],
      ),
    );
    return v ?? false;
  }

  Future<void> _approve(PurchaseOrder po) async {
    if (!await _confirm('Setujui PO?',
        'PO ${po.code} akan diteruskan ke gudang untuk diterima.',
        AppColors.primary)) {
      return;
    }
    setState(() {
      _processing = true;
      po.status = DocStatus.approved;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) setState(() => _processing = false);
    HapticFeedback.heavyImpact();
  }

  Future<void> _reject(PurchaseOrder po) async {
    if (!await _confirm('Tolak PO?', 'PO ${po.code} tidak akan diproses.',
        AppColors.danger)) {
      return;
    }
    setState(() => po.status = DocStatus.rejected);
    HapticFeedback.heavyImpact();
  }

  Future<void> _receive(PurchaseOrder po) async {
    if (!await _confirm('Tandai diterima?',
        'Stok akan otomatis bertambah di gudang dan tercatat di pergerakan.',
        AppColors.success)) {
      return;
    }
    setState(() => _processing = true);
    await Future.delayed(const Duration(milliseconds: 600));
    final db = MockDB.instance;
    setState(() {
      po.status = DocStatus.received;
      for (final it in po.items) {
        final stock = db.stockOf(it.productId, po.warehouseId);
        final before = stock?.quantity ?? 0;
        if (stock != null) {
          stock.quantity += it.quantity;
        } else {
          db.stocks.add(Stock(
            productId: it.productId,
            warehouseId: po.warehouseId,
            quantity: it.quantity,
          ));
        }
        db.movements.add(StockMovement(
          id: 'm${DateTime.now().microsecondsSinceEpoch}',
          productId: it.productId,
          warehouseId: po.warehouseId,
          type: MovementType.inbound,
          quantity: it.quantity,
          qtyBefore: before,
          qtyAfter: before + it.quantity,
          note: 'Penerimaan ${po.code}',
          date: DateTime.now(),
          reference: po.code,
        ));
      }
      _processing = false;
    });
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Stok berhasil ditambahkan'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final po = db.purchaseOrders.firstWhere((p) => p.id == widget.poId);
    final supplier = db.supplierById(po.supplierId);
    final wh = db.warehouseById(po.warehouseId);
    final isSuper = widget.currentUser.role == UserRole.superAdmin;

    // Hitung total biaya PO berdasarkan HPP × qty tiap item
    double grandTotal = 0;
    int totalQty = 0;
    for (final it in po.items) {
      final p = db.productById(it.productId);
      grandTotal += (p?.hargaPokok ?? 0) * it.quantity;
      totalQty += it.quantity;
    }

    return Scaffold(
      appBar: AppBar(title: Text(po.code)),
      bottomNavigationBar: _bottomActions(po, isSuper),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(po.code,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700)),
                    ),
                    _statusChip(po.status, onWhite: true),
                  ],
                ),
                const SizedBox(height: 14),
                Text('${supplier?.name ?? '-'} → ${wh?.name ?? '-'}',
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 4),
                Text(DateFormat('d MMMM yyyy').format(po.createdAt),
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12.5)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Text('Item',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(
                '${po.items.length} produk · $totalQty unit',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...po.items.map((it) {
            final p = db.productById(it.productId);
            final cat = p == null ? null : db.categoryById(p.categoryId);
            final unitPrice = p?.hargaPokok ?? 0;
            final subtotal = unitPrice * it.quantity;
            final hasPrice = unitPrice > 0;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: nama produk + qty
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.inventory_2_rounded,
                            color: AppColors.primary, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p?.name ?? '-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.5)),
                            const SizedBox(height: 2),
                            Text('SKU: ${p?.sku ?? '-'}',
                                style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${it.quantity} ${p?.unit ?? ''}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Spesifikasi: kategori, barcode, satuan, min stok
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _specRow(Icons.category_rounded, 'Kategori',
                            cat?.name ?? '-'),
                        const SizedBox(height: 6),
                        _specRow(Icons.qr_code_rounded, 'Barcode',
                            p?.barcode ?? '-'),
                        const SizedBox(height: 6),
                        _specRow(Icons.straighten_rounded, 'Satuan',
                            p?.unit ?? '-'),
                        const SizedBox(height: 6),
                        _specRow(Icons.warning_amber_rounded, 'Min stok',
                            p == null ? '-' : '${p.minStock} ${p.unit}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Harga satuan + subtotal
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: hasPrice
                          ? AppColors.successSoft
                          : AppColors.dangerSoft,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: (hasPrice
                                ? AppColors.success
                                : AppColors.danger)
                            .withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payments_rounded,
                                size: 14,
                                color: hasPrice
                                    ? AppColors.success
                                    : AppColors.danger),
                            const SizedBox(width: 6),
                            const Text('Harga satuan',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted)),
                            const Spacer(),
                            Text(
                              hasPrice
                                  ? _rupiah.format(unitPrice)
                                  : 'HPP belum diset',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: hasPrice
                                    ? AppColors.text
                                    : AppColors.danger,
                              ),
                            ),
                          ],
                        ),
                        if (hasPrice) ...[
                          const Divider(height: 14),
                          Row(
                            children: [
                              const Icon(Icons.calculate_rounded,
                                  size: 14, color: AppColors.success),
                              const SizedBox(width: 6),
                              Text(
                                'Subtotal (${it.quantity} × ${_rupiah.format(unitPrice)})',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted),
                              ),
                              const Spacer(),
                              Text(
                                _rupiah.format(subtotal),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColors.success,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          // Ringkasan total PO
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_long_rounded,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    const Text('Total Biaya PO',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    const Spacer(),
                    Text(
                      _rupiah.format(grandTotal),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$totalQty unit dari ${po.items.length} produk',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    if (totalQty > 0)
                      Text(
                        'Rata-rata ${_rupiah.format(grandTotal / totalQty)}/unit',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _timeline(po.status),
        ],
      ),
    );
  }

  Widget _specRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textMuted),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(
                fontSize: 12, color: AppColors.textMuted)),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget? _bottomActions(PurchaseOrder po, bool isSuper) {
    if (po.status == DocStatus.received || po.status == DocStatus.rejected) {
      return null;
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: () {
          if (po.status == DocStatus.pending && isSuper) {
            return Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.danger,
                      side: const BorderSide(color: AppColors.danger),
                    ),
                    onPressed: _processing ? null : () => _reject(po),
                    child: const Text('Tolak'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _processing ? null : () => _approve(po),
                    child: _processing
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2.4))
                        : const Text('Setujui'),
                  ),
                ),
              ],
            );
          }
          if (po.status == DocStatus.approved) {
            return ElevatedButton.icon(
              icon: _processing
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.4))
                  : const Icon(Icons.inventory_rounded),
              label: Text(_processing ? 'Memproses...' : 'Tandai Diterima'),
              onPressed: _processing ? null : () => _receive(po),
            );
          }
          return const OutlinedButton(
            onPressed: null,
            child: Text('Menunggu approval super admin'),
          );
        }(),
      ),
    );
  }

  Widget _timeline(DocStatus status) {
    final order = [DocStatus.pending, DocStatus.approved, DocStatus.received];
    final labels = ['Dibuat Admin', 'Disetujui Super Admin', 'Diterima Gudang'];
    final activeIdx = order.indexOf(status);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Riwayat alur',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          for (int i = 0; i < labels.length; i++) ...[
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: i <= activeIdx
                        ? AppColors.primary
                        : AppColors.border,
                    shape: BoxShape.circle,
                  ),
                  child: i <= activeIdx
                      ? const Icon(Icons.check,
                          size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 10),
                Text(labels[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: i <= activeIdx
                          ? AppColors.text
                          : AppColors.textMuted,
                    )),
              ],
            ),
            if (i != labels.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Container(
                  width: 2,
                  height: 22,
                  color: i < activeIdx
                      ? AppColors.primary
                      : AppColors.border,
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _statusChip(DocStatus status, {bool onWhite = false}) {
    Color color;
    String label;
    switch (status) {
      case DocStatus.pending:
        color = AppColors.warning;
        label = 'Menunggu';
        break;
      case DocStatus.approved:
        color = AppColors.info;
        label = 'Disetujui';
        break;
      case DocStatus.rejected:
        color = AppColors.danger;
        label = 'Ditolak';
        break;
      case DocStatus.received:
        color = AppColors.success;
        label = 'Diterima';
        break;
      default:
        color = AppColors.textMuted;
        label = status.name;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: onWhite ? Colors.white : color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w700, fontSize: 11)),
    );
  }
}
