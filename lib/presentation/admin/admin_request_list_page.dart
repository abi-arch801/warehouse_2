import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/admin_request_detail_page.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';

class AdminRequestListPage extends StatefulWidget {
  const AdminRequestListPage({super.key});

  @override
  State<AdminRequestListPage> createState() => _AdminRequestListPageState();
}

class _AdminRequestListPageState extends State<AdminRequestListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  // Tab Admin: fokus ke pending (perlu verifikasi) & pending_superadmin
  // (sudah diverifikasi, tinggal menunggu Super Admin — read-only info)
  final _statusFilters = <String?>[
    null,
    'pending',
    'pending_superadmin',
    'approved',
    'rejected',
    'completed',
  ];
  final _tabLabels = [
    'Semua',
    'Pending',
    'Menunggu Final',
    'Disetujui',
    'Ditolak',
    'Selesai'
  ];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: _statusFilters.length, vsync: this);
    _tabCtrl.addListener(() {
      if (!_tabCtrl.indexIsChanging) {
        context.read<AdminRequestBloc>().add(
            AdminRequestEvent.filterStatus(_statusFilters[_tabCtrl.index]));
      }
    });
    context.read<AdminRequestBloc>().add(const AdminRequestEvent.load());
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Request Barang'),
        backgroundColor: AppColors.surface,
        bottom: TabBar(
          controller: _tabCtrl,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          tabAlignment: TabAlignment.start,
          tabs: _tabLabels.map((l) => Tab(text: l)).toList(),
        ),
      ),
      body: BlocConsumer<AdminRequestBloc, AdminRequestState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(msg),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ));
              context.read<AdminRequestBloc>().add(
                  AdminRequestEvent.filterStatus(
                      _statusFilters[_tabCtrl.index]));
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
              backgroundColor: AppColors.danger,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items, totalItems, hasMore, filterStatus) {
              if (items.isEmpty) return const _EmptyState();
              return RefreshIndicator(
                onRefresh: () async => context.read<AdminRequestBloc>().add(
                    AdminRequestEvent.filterStatus(
                        _statusFilters[_tabCtrl.index])),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    final req = items[i] as Map<String, dynamic>;
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 250 + i * 60),
                      curve: Curves.easeOut,
                      builder: (_, v, child) => Opacity(
                        opacity: v,
                        child: Transform.translate(
                            offset: Offset(0, (1 - v) * 12), child: child),
                      ),
                      child: _RequestCard(request: req),
                    );
                  },
                ),
              );
            },
            detailLoading: () =>
                const Center(child: CircularProgressIndicator()),
            detailLoaded: (_) => const SizedBox.shrink(),
            actionLoading: () =>
                const Center(child: CircularProgressIndicator()),
            actionSuccess: (_) =>
                const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: AppColors.danger),
                    const SizedBox(height: 12),
                    Text(msg, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<AdminRequestBloc>()
                          .add(const AdminRequestEvent.load()),
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Request Card ─────────────────────────────────────────────────────────
class _RequestCard extends StatelessWidget {
  final Map<String, dynamic> request;
  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final status = request['status'] as String? ?? 'pending';
    final id = request['id'] as int? ?? 0;
    final user = request['user'] as Map<String, dynamic>?;
    final userName = user?['name']?.toString() ?? 'User #${request['user_id']}';
    final items = request['items'] as List? ?? [];
    final notes = request['notes'] as String?;
    final createdAt = request['created_at'] as String? ?? '';
    final meta = _statusMeta(status);

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<AdminRequestBloc>(),
              child: AdminRequestDetailPage(requestId: id),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header row ────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Request #$id',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text)),
                      const SizedBox(height: 2),
                      Text(userName,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                      color: meta.bg, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(meta.icon, color: meta.color, size: 11),
                      const SizedBox(width: 3),
                      Text(meta.label,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: meta.color)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey.shade100),
            const SizedBox(height: 10),

            // ── Detail row ────────────────────────────────────────
            Row(
              children: [
                Expanded(
                    child: _DetailItem(
                        icon: Icons.inventory_2_outlined,
                        label: 'Jumlah Item',
                        value: '${items.length} item')),
                Expanded(
                    child: _DetailItem(
                        icon: Icons.calendar_today_outlined,
                        label: 'Tanggal',
                        value: _formatDate(createdAt))),
              ],
            ),
            if (notes != null && notes.isNotEmpty) ...[
              const SizedBox(height: 8),
              _DetailItem(
                  icon: Icons.notes_rounded,
                  label: 'Catatan',
                  value: notes,
                  truncate: true),
            ],

            // ── Progress bar ──────────────────────────────────────
            if (status == 'pending' ||
                status == 'pending_superadmin' ||
                status == 'approved') ...[
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: status == 'pending'
                      ? 0.2
                      : status == 'pending_superadmin'
                          ? 0.5
                          : 0.8,
                  minHeight: 5,
                  backgroundColor: meta.color.withOpacity(0.12),
                  valueColor: AlwaysStoppedAnimation<Color>(meta.color),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                  status == 'pending'
                      ? 'Menunggu verifikasi Anda...'
                      : status == 'pending_superadmin'
                          ? 'Menunggu approval final Super Admin...'
                          : 'Sedang diproses...',
                  style: TextStyle(
                      fontSize: 10,
                      color: meta.color,
                      fontWeight: FontWeight.w500)),
            ],

            // ── CTA hanya untuk status pending (butuh aksi Admin) ──
            if (status == 'pending') ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _ActionChip(
                      label: 'Verifikasi',
                      icon: Icons.fact_check_rounded,
                      color: AppColors.success,
                      onTap: () => _showApproveSheet(context, request),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ActionChip(
                      label: 'Tolak',
                      icon: Icons.close_rounded,
                      color: AppColors.danger,
                      onTap: () => _showRejectDialog(context, request),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ── Bottom sheet verifikasi — TANPA field gudang ─────────────────────
  void _showApproveSheet(BuildContext ctx, Map<String, dynamic> req) {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: ctx.read<AdminRequestBloc>(),
        child: _ApproveBottomSheet(request: req),
      ),
    );
  }

  void _showRejectDialog(BuildContext ctx, Map<String, dynamic> req) {
    HapticFeedback.lightImpact();
    final reasonCtrl = TextEditingController();
    showDialog(
      context: ctx,
      builder: (dialogCtx) => BlocProvider.value(
        value: ctx.read<AdminRequestBloc>(),
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Tolak Request',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: AppColors.text)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Request #${req['id']} dari '
                  '${(req['user'] as Map?)?['name'] ?? '-'}',
                  style: const TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 14),
              TextField(
                controller: reasonCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Alasan Penolakan',
                  hintText: 'Tuliskan alasan penolakan...',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (reasonCtrl.text.trim().isEmpty) return;
                Navigator.pop(dialogCtx);
                ctx.read<AdminRequestBloc>().add(AdminRequestEvent.reject(
                      requestId: req['id'] as int,
                      rejectReason: reasonCtrl.text.trim(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.danger,
                  foregroundColor: Colors.white),
              child: const Text('Tolak'),
            ),
          ],
        ),
      ),
    );
  }

  _StatusMeta _statusMeta(String s) {
    switch (s) {
      case 'pending':
        return _StatusMeta(Icons.hourglass_top_rounded, AppColors.warning,
            AppColors.warningSoft, 'Pending');
      case 'pending_superadmin':
        return _StatusMeta(Icons.hourglass_bottom_rounded, AppColors.info,
            AppColors.infoSoft, 'Menunggu Final');
      case 'approved':
        return _StatusMeta(Icons.check_circle_outline, AppColors.success,
            AppColors.successSoft, 'Disetujui');
      case 'rejected':
        return _StatusMeta(Icons.cancel_outlined, AppColors.danger,
            AppColors.dangerSoft, 'Ditolak');
      case 'completed':
        return _StatusMeta(
            Icons.done_all, AppColors.info, AppColors.infoSoft, 'Selesai');
      default:
        return _StatusMeta(
            Icons.info_outline, AppColors.textMuted, AppColors.bg, s);
    }
  }

  String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      return '${dt.day}/${dt.month}/${dt.year}';
    } catch (_) {
      return raw;
    }
  }
}

// ── Approve/Verifikasi Bottom Sheet — TANPA input gudang ─────────────────
class _ApproveBottomSheet extends StatefulWidget {
  final Map<String, dynamic> request;

  const _ApproveBottomSheet({required this.request});

  @override
  State<_ApproveBottomSheet> createState() => _ApproveBottomSheetState();
}

class _ApproveBottomSheetState extends State<_ApproveBottomSheet> {
  late List<TextEditingController> _qtyControllers;

  @override
  void initState() {
    super.initState();
    final items = widget.request['items'] as List? ?? [];
    _qtyControllers = items.map((item) {
      final m = item as Map<String, dynamic>;
      return TextEditingController(text: '${m['requested_quantity'] ?? 1}');
    }).toList();
  }

  @override
  void dispose() {
    for (final c in _qtyControllers) c.dispose();
    super.dispose();
  }

  void _submit() {
    final rawItems = widget.request['items'] as List? ?? [];
    final items = rawItems.asMap().entries.map((e) {
      final item = e.value as Map<String, dynamic>;
      final qty = int.tryParse(_qtyControllers[e.key].text.trim()) ??
          (item['requested_quantity'] as int? ?? 1);
      return <String, dynamic>{
        'request_item_id': item['id'],
        'approved_quantity': qty,
      };
    }).toList();

    Navigator.pop(context);
    context.read<AdminRequestBloc>().add(AdminRequestEvent.approve(
          requestId: widget.request['id'] as int,
          items: items,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.request['items'] as List? ?? [];
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.successSoft,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.fact_check_rounded,
                        color: AppColors.success, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Verifikasi Request #${widget.request['id']}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.text)),
                        Text('${items.length} item',
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Info banner: stok belum dipotong di tahap ini
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.infoSoft,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline_rounded,
                        size: 16, color: AppColors.info),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Verifikasi ini belum memotong stok. Stok baru dipotong saat Super Admin approve final.',
                        style: TextStyle(fontSize: 11, color: AppColors.info),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
                height: 20,
                color: Colors.grey.shade100,
                indent: 20,
                endIndent: 20),
            // Content
            Expanded(
              child: ListView(
                controller: scrollCtrl,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                children: [
                  const Text('Jumlah Direkomendasikan per Item',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted)),
                  const SizedBox(height: 8),
                  ...items.asMap().entries.map((e) {
                    final item = e.value as Map<String, dynamic>;
                    final product = item['product'] as Map<String, dynamic>?;
                    final productName = product?['name']?.toString() ??
                        'Produk #${item['product_id']}';
                    final reqQty = item['requested_quantity'] ?? 1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13)),
                                Text('Diminta: $reqQty',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.textMuted)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: _qtyControllers[e.key],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.check_rounded),
                    label: const Text('Konfirmasi Verifikasi'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Shared small widgets ──────────────────────────────────────────────────
class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool truncate;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.truncate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 13, color: AppColors.primary),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text),
                  maxLines: truncate ? 1 : null,
                  overflow: truncate ? TextOverflow.ellipsis : null),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionChip({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 6),
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _StatusMeta {
  final IconData icon;
  final Color color;
  final Color bg;
  final String label;
  const _StatusMeta(this.icon, this.color, this.bg, this.label);
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: AppColors.bg, shape: BoxShape.circle),
            child: const Icon(Icons.assignment_outlined,
                color: AppColors.primary, size: 32),
          ),
          const SizedBox(height: 14),
          const Text('Tidak ada request di kategori ini',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
        ],
      ),
    );
  }
}
