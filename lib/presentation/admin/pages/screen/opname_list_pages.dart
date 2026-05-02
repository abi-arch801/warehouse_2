import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/opname_create_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/opname_detail_pages.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class OpnameListScreen extends StatefulWidget {
  final AppUser currentUser;
  const OpnameListScreen({super.key, required this.currentUser});

  @override
  State<OpnameListScreen> createState() => _OpnameListScreenState();
}

class _OpnameListScreenState extends State<OpnameListScreen> {
  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Opname')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () async {
          HapticFeedback.selectionClick();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  OpnameCreateScreen(currentUser: widget.currentUser),
            ),
          );
          if (mounted) setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text('Opname Baru'),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: db.opnames.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.fact_check_rounded,
                            size: 56, color: AppColors.textMuted),
                        SizedBox(height: 14),
                        Text('Belum ada opname',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Lakukan stock opname untuk menyamakan stok fisik dengan sistem.',
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
                itemCount: db.opnames.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final op = db.opnames[i];
                  final wh = db.warehouseById(op.warehouseId);
                  final diff =
                      op.items.fold<int>(0, (s, it) => s + it.diff);
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(
                        milliseconds: 250 + (i * 60).clamp(0, 600)),
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
                              builder: (_) => OpnameDetailScreen(
                                opnameId: op.id,
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
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.successSoft,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                    Icons.fact_check_rounded,
                                    color: AppColors.success),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(op.code,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 2),
                                    Text(
                                        '${wh?.name ?? '-'} · ${op.items.length} produk',
                                        style: const TextStyle(
                                            color: AppColors.textMuted,
                                            fontSize: 12)),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Selisih: ${diff > 0 ? '+' : ''}$diff · ${DateFormat('d MMM yyyy').format(op.createdAt)}',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        color: diff == 0
                                            ? AppColors.textMuted
                                            : (diff > 0
                                                ? AppColors.success
                                                : AppColors.danger),
                                        fontWeight: diff == 0
                                            ? FontWeight.w500
                                            : FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _statusChip(op.status),
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
