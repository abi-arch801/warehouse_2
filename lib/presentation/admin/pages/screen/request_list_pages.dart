import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/request_details_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/request_pages.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class RequestListScreen extends StatefulWidget {
  final AppUser currentUser;
  const RequestListScreen({super.key, required this.currentUser});

  @override
  State<RequestListScreen> createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
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
        ? db.requests
        : db.requests.where((r) => r.status == _filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Request Barang')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () async {
          HapticFeedback.selectionClick();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  RequestCreateScreen(currentUser: widget.currentUser),
            ),
          );
          if (mounted) setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text('Request Baru'),
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
                              Icon(Icons.assignment_turned_in_rounded,
                                  size: 56, color: AppColors.textMuted),
                              SizedBox(height: 14),
                              Text('Belum ada request',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700)),
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
                        final r = filtered[i];
                        final user = db.userById(r.requesterId);
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
                                    builder: (_) => RequestDetailScreen(
                                      requestId: r.id,
                                      currentUser: widget.currentUser,
                                    ),
                                  ),
                                );
                                if (mounted) setState(() {});
                              },
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
                                        color: AppColors.warningSoft,
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                          Icons.assignment_turned_in_rounded,
                                          color: AppColors.warning),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(r.code,
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700)),
                                          const SizedBox(height: 2),
                                          Text(
                                              '${user?.name ?? '-'} · ${r.purpose}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: AppColors.textMuted,
                                                  fontSize: 12)),
                                          const SizedBox(height: 4),
                                          Text(
                                              '${r.items.length} item · ${DateFormat('d MMM yyyy').format(r.createdAt)}',
                                              style: const TextStyle(
                                                  fontSize: 11.5)),
                                        ],
                                      ),
                                    ),
                                    _statusChip(r.status),
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
