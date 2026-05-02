import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/transfer_create_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/transfer_detail_pages.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class TransferListScreen extends StatefulWidget {
  final AppUser currentUser;
  const TransferListScreen({super.key, required this.currentUser});

  @override
  State<TransferListScreen> createState() => _TransferListScreenState();
}

class _TransferListScreenState extends State<TransferListScreen> {
  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer Antar Gudang')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () async {
          HapticFeedback.selectionClick();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  TransferCreateScreen(currentUser: widget.currentUser),
            ),
          );
          if (mounted) setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text('Transfer Baru'),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: db.transfers.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.swap_horiz_rounded,
                            size: 56, color: AppColors.textMuted),
                        SizedBox(height: 14),
                        Text('Belum ada transfer',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              )
            : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
                itemCount: db.transfers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final t = db.transfers[i];
                  final from = db.warehouseById(t.fromWarehouseId);
                  final to = db.warehouseById(t.toWarehouseId);
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration:
                        Duration(milliseconds: 250 + (i * 60).clamp(0, 600)),
                    curve: Curves.easeOut,
                    builder: (_, v, child) => Opacity(
                      opacity: v,
                      child: Transform.translate(
                        offset: Offset(0, (1 - v) * 16),
                        child: child,
                      ),
                    ),
                    child: Material(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () async {
                          HapticFeedback.selectionClick();
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TransferDetailScreen(
                                transferId: t.id,
                                currentUser: widget.currentUser,
                              ),
                            ),
                          );
                          if (mounted) setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.infoSoft,
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                        Icons.swap_horiz_rounded,
                                        color: AppColors.info),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(t.code,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  _statusChip(t.status),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.bg,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Dari',
                                              style: TextStyle(
                                                  color: AppColors.textMuted,
                                                  fontSize: 10.5)),
                                          Text(from?.name ?? '-',
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700,
                                                  fontSize: 12.5)),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_rounded,
                                        size: 16,
                                        color: AppColors.textMuted),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text('Ke',
                                              style: TextStyle(
                                                  color: AppColors.textMuted,
                                                  fontSize: 10.5)),
                                          Text(to?.name ?? '-',
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700,
                                                  fontSize: 12.5)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                  '${t.items.length} item · ${DateFormat('d MMM yyyy').format(t.createdAt)}',
                                  style: const TextStyle(
                                      fontSize: 11.5,
                                      color: AppColors.textMuted)),
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

  Widget _statusChip(DocStatus status) {
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
      case DocStatus.inTransit:
        color = AppColors.accent;
        label = 'Dikirim';
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
