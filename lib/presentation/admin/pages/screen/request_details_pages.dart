import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class RequestDetailScreen extends StatefulWidget {
  final String requestId;
  final AppUser currentUser;
  const RequestDetailScreen({
    super.key,
    required this.requestId,
    required this.currentUser,
  });

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  bool _processing = false;

  Future<bool> _confirm(String title, String msg, Color color) async {
    final v = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

  Future<void> _approve(StockRequest r) async {
    if (!await _confirm('Setujui request?',
        'Stok akan dikurangi dari gudang dan tercatat sebagai pengeluaran.',
        AppColors.success)) {
      return;
    }
    setState(() => _processing = true);
    await Future.delayed(const Duration(milliseconds: 600));
    final db = MockDB.instance;
    setState(() {
      r.status = DocStatus.approved;
      for (final it in r.items) {
        final stock = db.stockOf(it.productId, r.warehouseId);
        if (stock != null) {
          final before = stock.quantity;
          final qty = it.quantity.clamp(0, stock.quantity);
          stock.quantity -= qty;
          db.movements.add(StockMovement(
            id: 'm${DateTime.now().microsecondsSinceEpoch}',
            productId: it.productId,
            warehouseId: r.warehouseId,
            type: MovementType.outbound,
            quantity: qty,
            qtyBefore: before,
            qtyAfter: stock.quantity,
            note: 'Pengeluaran request ${r.code}',
            date: DateTime.now(),
            reference: r.code,
          ));
        }
      }
      _processing = false;
    });
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Request disetujui & stok dikeluarkan'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  Future<void> _reject(StockRequest r) async {
    if (!await _confirm('Tolak request?',
        'Request ${r.code} tidak akan diproses.', AppColors.danger)) {
      return;
    }
    setState(() => r.status = DocStatus.rejected);
    HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final r = db.requests.firstWhere((x) => x.id == widget.requestId);
    final user = db.userById(r.requesterId);
    final wh = db.warehouseById(r.warehouseId);
    final isAdmin = widget.currentUser.role == UserRole.superAdmin;

    return Scaffold(
      appBar: AppBar(title: Text(r.code)),
      bottomNavigationBar: r.status == DocStatus.pending && isAdmin
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.danger,
                          side: const BorderSide(color: AppColors.danger),
                        ),
                        onPressed: _processing ? null : () => _reject(r),
                        child: const Text('Tolak'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _processing ? null : () => _approve(r),
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
                ),
              ),
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(r.code,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700)),
                    ),
                    _statusChip(r.status),
                  ],
                ),
                const SizedBox(height: 14),
                _row('Diminta oleh', user?.name ?? '-'),
                _row('Gudang', wh?.name ?? '-'),
                _row('Tanggal',
                    DateFormat('d MMMM yyyy').format(r.createdAt)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(r.purpose),
                ),
                if (r.filePath != null) ...[
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Membuka ${r.filePath}'),
                          backgroundColor: AppColors.info,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.infoSoft,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.info.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_file_rounded,
                              color: AppColors.info, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              r.filePath!,
                              style: const TextStyle(
                                color: AppColors.info,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                          const Icon(Icons.open_in_new_rounded,
                              color: AppColors.info, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Daftar Barang',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ...r.items.map((it) {
            final p = db.productById(it.productId);
            final stock =
                db.stockOf(it.productId, r.warehouseId)?.quantity ?? 0;
            final insufficient = it.quantity > stock;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(
                  color: insufficient
                      ? AppColors.danger
                      : AppColors.border,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p?.name ?? '-',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text('Tersedia: $stock ${p?.unit ?? ''}',
                            style: TextStyle(
                                color: insufficient
                                    ? AppColors.danger
                                    : AppColors.textMuted,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  Text('${it.quantity} ${p?.unit ?? ''}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.warning,
                          fontSize: 16)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            SizedBox(
                width: 110,
                child: Text(label,
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 12.5))),
            Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );

  Widget _statusChip(DocStatus status) {
    Color color;
    String label;
    switch (status) {
      case DocStatus.pending:
        color = AppColors.warning;
        label = 'Menunggu';
        break;
      case DocStatus.approved:
        color = AppColors.success;
        label = 'Disetujui';
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w700, fontSize: 11)),
    );
  }
}
