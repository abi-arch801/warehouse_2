import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/PO_create_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/PO_detail_pages.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class POListScreen extends StatefulWidget {
  final AppUser currentUser;
  const POListScreen({super.key, required this.currentUser});

  @override
  State<POListScreen> createState() => _POListScreenState();
}

class _POListScreenState extends State<POListScreen> {
  DocStatus? _filter;

  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final filtered = _filter == null
        ? db.purchaseOrders
        : db.purchaseOrders.where((po) => po.status == _filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Order')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () async {
          HapticFeedback.selectionClick();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => POCreateScreen(currentUser: widget.currentUser),
            ),
          );
          if (mounted) setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text('PO Baru'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _chip(null, 'Semua'),
                _chip(DocStatus.pending, 'Menunggu'),
                _chip(DocStatus.approved, 'Disetujui'),
                _chip(DocStatus.received, 'Diterima'),
                _chip(DocStatus.rejected, 'Ditolak'),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.primary,
              onRefresh: _refresh,
              child: filtered.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 80),
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.receipt_long_rounded,
                                  size: 56, color: AppColors.textMuted),
                              SizedBox(height: 14),
                              Text('Belum ada PO',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 6),
                              Text('Tarik ke bawah untuk refresh',
                                  style: TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 12.5)),
                            ],
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 90),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (_, i) {
                        final po = filtered[i];
                        final supplier = db.supplierById(po.supplierId);
                        final wh = db.warehouseById(po.warehouseId);
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
                              onTap: () async {
                                HapticFeedback.selectionClick();
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PODetailScreen(
                                      poId: po.id,
                                      currentUser: widget.currentUser,
                                    ),
                                  ),
                                );
                                if (mounted) setState(() {});
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.border),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.primarySoft,
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                          Icons.receipt_long_rounded,
                                          color: AppColors.primary),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(po.code,
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700)),
                                          const SizedBox(height: 2),
                                          Text(
                                              '${supplier?.name ?? '-'} → ${wh?.name ?? '-'}',
                                              style: const TextStyle(
                                                  color: AppColors.textMuted,
                                                  fontSize: 12)),
                                          const SizedBox(height: 4),
                                          Text(
                                              '${po.items.length} item · ${po.totalQty} unit · ${DateFormat('d MMM yyyy').format(po.createdAt)}',
                                              style: const TextStyle(
                                                  fontSize: 11.5)),
                                        ],
                                      ),
                                    ),
                                    _statusChip(po.status),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(DocStatus? status, String label) {
    final selected = _filter == status;
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          HapticFeedback.selectionClick();
          setState(() => _filter = status);
        },
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.text,
          fontWeight: FontWeight.w600,
          fontSize: 12.5,
        ),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
      ),
    );
  }

  Widget _statusChip(DocStatus status) {
    Color color;
    String label;
    switch (status) {
      case DocStatus.draft:
        color = AppColors.textMuted;
        label = 'Draft';
        break;
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
      case DocStatus.inTransit:
        color = AppColors.accent;
        label = 'Dikirim';
        break;
      case DocStatus.received:
        color = AppColors.success;
        label = 'Diterima';
        break;
      case DocStatus.completed:
        color = AppColors.success;
        label = 'Selesai';
        break;
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
