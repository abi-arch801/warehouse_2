import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/submission_create_pages.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class SubmissionListScreen extends StatefulWidget {
  final AppUser currentUser;
  const SubmissionListScreen({super.key, required this.currentUser});

  @override
  State<SubmissionListScreen> createState() => _SubmissionListScreenState();
}

class _SubmissionListScreenState extends State<SubmissionListScreen> {
  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final isSuper = widget.currentUser.role == UserRole.superAdmin;

    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Produk')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () async {
          HapticFeedback.selectionClick();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  SubmissionCreateScreen(currentUser: widget.currentUser),
            ),
          );
          if (mounted) setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajukan'),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: db.submissions.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.inventory_rounded,
                            size: 56, color: AppColors.textMuted),
                        SizedBox(height: 14),
                        Text('Belum ada pengajuan',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Ajukan produk baru untuk diaktifkan ke dalam sistem.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 12.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
                itemCount: db.submissions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final s = db.submissions[i];
                  final wh = db.warehouseById(s.warehouseId);
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(
                        milliseconds: 220 + (i * 60).clamp(0, 600)),
                    curve: Curves.easeOut,
                    builder: (_, v, child) => Opacity(
                      opacity: v,
                      child: Transform.translate(
                        offset: Offset(0, (1 - v) * 14),
                        child: child,
                      ),
                    ),
                    child: Material(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          HapticFeedback.selectionClick();
                          if (s.status == DocStatus.pending && isSuper) {
                            _showApproval(s);
                          } else {
                            _showDetail(s);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.successSoft,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.add_box_rounded,
                                    color: AppColors.success),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(s.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 2),
                                    Text('${s.code} · ${wh?.name ?? '-'}',
                                        style: const TextStyle(
                                            color: AppColors.textMuted,
                                            fontSize: 12)),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Stok awal: ${s.initialStock} ${s.unit} · ${DateFormat('d MMM').format(s.createdAt)}',
                                      style: const TextStyle(fontSize: 11.5),
                                    ),
                                  ],
                                ),
                              ),
                              _statusChip(s.status),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showDetail(ProductSubmission s) {
    final db = MockDB.instance;
    final wh = db.warehouseById(s.warehouseId);
    final cat = db.categoryById(s.categoryId);
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
              Row(
                children: [
                  Expanded(
                    child: Text(s.code,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  _statusChip(s.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(s.name,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(height: 14),
              _row('SKU', s.sku),
              _row('Kategori', cat?.name ?? '-'),
              _row('Satuan', s.unit),
              _row('Gudang', wh?.name ?? '-'),
              _row('Stok Awal', '${s.initialStock} ${s.unit}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(k,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12.5)),
            ),
            Expanded(
              child: Text(v,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );

  void _showApproval(ProductSubmission s) {
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
              Text(s.code,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(s.name,
                  style: const TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 8),
              Text(
                'Akan dibuat produk baru "${s.name}" dengan stok awal ${s.initialStock} ${s.unit}.',
                style: const TextStyle(
                    color: AppColors.textMuted, fontSize: 12.5),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.danger,
                        side: const BorderSide(color: AppColors.danger),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        setState(() => s.status = DocStatus.rejected);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Pengajuan ${s.code} ditolak'),
                            backgroundColor: AppColors.danger,
                          ),
                        );
                      },
                      child: const Text('Tolak'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final db = MockDB.instance;
                        setState(() {
                          s.status = DocStatus.approved;
                          final newProduct = Product(
                            id: 'p${DateTime.now().millisecondsSinceEpoch}',
                            sku: s.sku,
                            barcode: 'AUTO-${s.sku}',
                            name: s.name,
                            unit: s.unit,
                            categoryId: s.categoryId,
                            minStock: 5,
                          );
                          db.products.add(newProduct);
                          db.stocks.add(Stock(
                            productId: newProduct.id,
                            warehouseId: s.warehouseId,
                            quantity: s.initialStock,
                          ));
                          db.movements.add(StockMovement(
                            id: 'm${DateTime.now().microsecondsSinceEpoch}',
                            productId: newProduct.id,
                            warehouseId: s.warehouseId,
                            type: MovementType.inbound,
                            quantity: s.initialStock,
                            qtyBefore: 0,
                            qtyAfter: s.initialStock,
                            note: 'Stok awal pengajuan ${s.code}',
                            date: DateTime.now(),
                            reference: s.code,
                          ));
                        });
                        HapticFeedback.heavyImpact();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Produk "${s.name}" berhasil diaktifkan'),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                      child: const Text('Setujui'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
