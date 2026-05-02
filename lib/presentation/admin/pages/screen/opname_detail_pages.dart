import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class OpnameDetailScreen extends StatefulWidget {
  final String opnameId;
  final AppUser currentUser;
  const OpnameDetailScreen({
    super.key,
    required this.opnameId,
    required this.currentUser,
  });

  @override
  State<OpnameDetailScreen> createState() => _OpnameDetailScreenState();
}

class _OpnameDetailScreenState extends State<OpnameDetailScreen> {
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

  Future<void> _approve(StockOpname op) async {
    if (!await _confirm(
      'Setujui opname?',
      'Stok sistem akan disesuaikan dengan hasil hitung fisik dan tercatat sebagai pergerakan penyesuaian.',
      AppColors.success,
    )) return;
    setState(() => _processing = true);
    await Future.delayed(const Duration(milliseconds: 600));
    final db = MockDB.instance;
    setState(() {
      op.status = DocStatus.completed;
      for (final it in op.items) {
        if (it.diff == 0) continue;
        final stock = db.stockOf(it.productId, op.warehouseId);
        if (stock != null) {
          final before = stock.quantity;
          stock.quantity = it.physicalQty;
          db.movements.add(StockMovement(
            id: 'm${DateTime.now().microsecondsSinceEpoch}',
            productId: it.productId,
            warehouseId: op.warehouseId,
            type: MovementType.adjustment,
            quantity: it.diff.abs(),
            qtyBefore: before,
            qtyAfter: stock.quantity,
            note: 'Penyesuaian opname ${op.code}',
            date: DateTime.now(),
            reference: op.code,
          ));
        }
      }
      _processing = false;
    });
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opname disetujui & stok disesuaikan'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final op = db.opnames.firstWhere((o) => o.id == widget.opnameId);
    final wh = db.warehouseById(op.warehouseId);
    final isSuper = widget.currentUser.role == UserRole.superAdmin;
    final totalDiff = op.items.fold<int>(0, (s, it) => s + it.diff);

    return Scaffold(
      appBar: AppBar(title: Text(op.code)),
      bottomNavigationBar: op.status == DocStatus.pending && isSuper
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  icon: _processing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2.4))
                      : const Icon(Icons.check_circle_rounded),
                  label: Text(_processing
                      ? 'Memproses...'
                      : 'Setujui & Sesuaikan Stok'),
                  onPressed: _processing ? null : () => _approve(op),
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
                      child: Text(
                        op.code,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                    _statusChip(op.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Gudang: ${wh?.name ?? '-'}',
                    style: const TextStyle(color: AppColors.textMuted)),
                Text(
                    'Tanggal: ${DateFormat('d MMMM yyyy').format(op.createdAt)}',
                    style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: totalDiff == 0
                        ? AppColors.successSoft
                        : (totalDiff > 0
                            ? AppColors.successSoft
                            : AppColors.dangerSoft),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        totalDiff == 0
                            ? Icons.check_circle_rounded
                            : Icons.warning_amber_rounded,
                        color: totalDiff < 0
                            ? AppColors.danger
                            : AppColors.success,
                      ),
                      const SizedBox(width: 8),
                      TweenAnimationBuilder<int>(
                        tween: IntTween(begin: 0, end: totalDiff.abs()),
                        duration: const Duration(milliseconds: 600),
                        builder: (_, v, __) => Text(
                          'Total selisih: ${totalDiff < 0 ? '-' : (totalDiff > 0 ? '+' : '')}$v',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: totalDiff < 0
                                ? AppColors.danger
                                : AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Detail Selisih',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ...op.items.asMap().entries.map((e) {
            final i = e.key;
            final it = e.value;
            final p = db.productById(it.productId);
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration:
                  Duration(milliseconds: 220 + (i * 50).clamp(0, 500)),
              curve: Curves.easeOut,
              builder: (_, v, child) => Opacity(
                opacity: v,
                child: Transform.translate(
                  offset: Offset(0, (1 - v) * 12),
                  child: child,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(
                    color: it.diff == 0
                        ? AppColors.border
                        : (it.diff > 0
                            ? AppColors.success
                            : AppColors.danger),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(p?.name ?? '-',
                          style:
                              const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Sistem',
                              style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 11)),
                          Text('${it.systemQty}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Fisik',
                              style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 11)),
                          Text('${it.physicalQty}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Selisih',
                              style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 11)),
                          Text(
                            it.diff > 0
                                ? '+${it.diff}'
                                : it.diff.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: it.diff == 0
                                  ? AppColors.textMuted
                                  : (it.diff > 0
                                      ? AppColors.success
                                      : AppColors.danger),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
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
        label = 'Menunggu';
        break;
      case DocStatus.completed:
        color = AppColors.success;
        label = 'Selesai';
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
