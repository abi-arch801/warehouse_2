import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/request_response_model.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
import 'app_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Request Detail Page — Detail Permintaan Barang (BLoC-connected)
// Diselaraskan dengan AppTheme: gradient header, card style, warna status
// ─────────────────────────────────────────────────────────────────────────────

class RequestDetailPage extends StatefulWidget {
  final int requestId;
  const RequestDetailPage({super.key, required this.requestId});

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<RequestBloc>()
        .add(RequestEvent.loadDetail(widget.requestId));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightOverlay,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: BlocBuilder<RequestBloc, RequestState>(
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: SizedBox.shrink()),
              loading: () => CustomScrollView(
                slivers: [
                  _buildHeader(null),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: AppTheme.primary),
                    ),
                  ),
                ],
              ),
              listLoaded: (_) => const SizedBox.shrink(),
              detailLoaded: (result) {
                final req = result.data;
                if (req == null) {
                  return CustomScrollView(
                    slivers: [
                      _buildHeader(null),
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: Text('Data tidak ditemukan')),
                      ),
                    ],
                  );
                }
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    _buildHeader(req),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                        child: _DetailBody(
                          request: req,
                          requestId: widget.requestId,
                        ),
                      ),
                    ),
                  ],
                );
              },
              actionSuccess: (msg, data) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context
                      .read<RequestBloc>()
                      .add(RequestEvent.loadDetail(widget.requestId));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(msg),
                    backgroundColor: AppTheme.statusApproved,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ));
                });
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppTheme.primary));
              },
              error: (msg) => CustomScrollView(
                slivers: [
                  _buildHeader(null),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _buildError(msg),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ── Header (collapsible, warna sesuai status jika tersedia) ───────────────
  Widget _buildHeader(StockRequestModel? req) {
    final statusColor =
        req != null ? _statusColor(req.status) : AppTheme.primary;

    return SliverAppBar(
      expandedHeight: 140,
      pinned: true,
      elevation: 0,
      backgroundColor: AppTheme.primaryDark,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryDark,
                req != null
                    ? Color.lerp(AppTheme.primary, statusColor, 0.5)!
                    : AppTheme.primary,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.06),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 14, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Detail Permintaan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        req != null
                            ? 'ID #${req.id} · ${_statusLabel(req.status)}'
                            : 'Memuat data...',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (req != null) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(_statusIcon(req.status),
                                  color: Colors.white, size: 13),
                              const SizedBox(width: 5),
                              Text(
                                _statusLabel(req.status),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildError(String msg) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.statusRejected.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.error_outline_rounded,
                  size: 36, color: AppTheme.statusRejected),
            ),
            const SizedBox(height: 16),
            const Text(
              'Terjadi Kesalahan',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 6),
            Text(msg,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 12, color: Colors.grey.shade500)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context
                  .read<RequestBloc>()
                  .add(RequestEvent.loadDetail(widget.requestId)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Coba Lagi',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  Color _statusColor(String s) {
    switch (s) {
      case 'pending':   return AppTheme.statusPending;
      case 'approved':  return AppTheme.statusApproved;
      case 'rejected':  return AppTheme.statusRejected;
      case 'completed': return AppTheme.statusCompleted;
      default:          return Colors.grey;
    }
  }

  IconData _statusIcon(String s) {
    switch (s) {
      case 'pending':   return Icons.hourglass_empty_rounded;
      case 'approved':  return Icons.check_circle_rounded;
      case 'rejected':  return Icons.cancel_rounded;
      case 'completed': return Icons.task_alt_rounded;
      default:          return Icons.info_outline_rounded;
    }
  }

  String _statusLabel(String s) {
    switch (s) {
      case 'pending':   return 'Menunggu Persetujuan';
      case 'approved':  return 'Disetujui';
      case 'rejected':  return 'Ditolak';
      case 'completed': return 'Selesai';
      case 'draft':     return 'Draft';
      default:          return s;
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body konten detail
// ─────────────────────────────────────────────────────────────────────────────
class _DetailBody extends StatelessWidget {
  final StockRequestModel request;
  final int requestId;
  const _DetailBody({required this.request, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final meta = _statusMeta(request.status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Banner status ────────────────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: meta.bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: meta.color.withOpacity(0.25),
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: meta.color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(meta.icon, color: meta.color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meta.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: meta.color,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Permintaan #${request.id} · ${_formatDate(request.createdAt)}',
                      style: TextStyle(
                        fontSize: 11,
                        color: meta.color.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (request.status == 'rejected' &&
                        request.rejectReason != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        'Alasan: ${request.rejectReason}',
                        style: TextStyle(
                          fontSize: 11,
                          color: meta.color,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ── Catatan ──────────────────────────────────────────────────────────
        if (request.notes != null && request.notes!.isNotEmpty) ...[
          _sectionCard(
            title: 'Catatan',
            icon: Icons.notes_rounded,
            child: Text(
              request.notes!,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textPrimary,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],

        // ── Daftar Barang ────────────────────────────────────────────────────
        _sectionCard(
          title: 'Daftar Barang',
          icon: Icons.inventory_2_outlined,
          trailing: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${request.items.length} item',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: AppTheme.primary,
              ),
            ),
          ),
          child: Column(
            children: request.items
                .asMap()
                .entries
                .map((e) => _ItemTile(
                      index: e.key,
                      item: e.value,
                      isLast: e.key == request.items.length - 1,
                    ))
                .toList(),
          ),
        ),

        const SizedBox(height: 20),

        // ── Tombol Batalkan (hanya pending) ──────────────────────────────────
        if (request.status == 'pending')
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _confirmCancel(context, request.id),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.statusRejected,
                side: BorderSide(
                  color: AppTheme.statusRejected.withOpacity(0.5),
                  width: 1.5,
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              icon: const Icon(Icons.cancel_outlined, size: 18),
              label: const Text(
                'Batalkan Permintaan',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ── Section card helper ───────────────────────────────────────────────────
  Widget _sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 15, color: AppTheme.primary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 10),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  void _confirmCancel(BuildContext context, int id) {
    HapticFeedback.lightImpact();
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.statusRejected.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.cancel_outlined,
                    color: AppTheme.statusRejected, size: 32),
              ),
              const SizedBox(height: 16),
              const Text(
                'Batalkan Permintaan?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Permintaan yang dibatalkan tidak dapat dikembalikan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.5),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade300),
                        padding:
                            const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Tidak',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context
                            .read<RequestBloc>()
                            .add(RequestEvent.deleteRequest(id));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.statusRejected,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding:
                            const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Ya, Batalkan',
                          style: TextStyle(fontWeight: FontWeight.w700)),
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

  _StatusMeta _statusMeta(String status) {
    switch (status) {
      case 'pending':
        return _StatusMeta(label: 'Menunggu Persetujuan',
            color: AppTheme.statusPending, bg: AppTheme.bgPending,
            icon: Icons.hourglass_empty_rounded);
      case 'approved':
        return _StatusMeta(label: 'Disetujui',
            color: AppTheme.statusApproved, bg: AppTheme.bgApproved,
            icon: Icons.check_circle_rounded);
      case 'rejected':
        return _StatusMeta(label: 'Ditolak',
            color: AppTheme.statusRejected, bg: AppTheme.bgRejected,
            icon: Icons.cancel_rounded);
      case 'completed':
        return _StatusMeta(label: 'Selesai',
            color: AppTheme.statusCompleted, bg: AppTheme.bgCompleted,
            icon: Icons.task_alt_rounded);
      default:
        return _StatusMeta(label: status,
            color: Colors.grey, bg: Colors.grey.shade100,
            icon: Icons.info_outline_rounded);
    }
  }

  String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      final months = [
        'Jan','Feb','Mar','Apr','Mei','Jun',
        'Jul','Agu','Sep','Okt','Nov','Des'
      ];
      return '${dt.day.toString().padLeft(2,'0')} ${months[dt.month-1]} ${dt.year}';
    } catch (_) {
      return raw;
    }
  }
}

// ── Item tile dalam daftar barang ─────────────────────────────────────────────
class _ItemTile extends StatelessWidget {
  final int index;
  final RequestItemModel item;
  final bool isLast;
  const _ItemTile(
      {required this.index, required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final productName =
        item.product?['name']?.toString() ?? 'Produk #${item.productId}';
    final sku = item.product?['sku']?.toString();

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nomor urut
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                    height: 1.3,
                  ),
                ),
                if (sku != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'SKU: $sku',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade400,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  children: [
                    _QtyBadge(
                      label: 'Diminta',
                      qty: item.requestedQuantity,
                      color: AppTheme.primary,
                    ),
                    if (item.approvedQuantity != null) ...[
                      const SizedBox(width: 6),
                      _QtyBadge(
                        label: 'Disetujui',
                        qty: item.approvedQuantity!,
                        color: AppTheme.statusApproved,
                      ),
                    ],
                  ],
                ),
                if (item.note != null && item.note!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.notes_rounded,
                            size: 11, color: AppTheme.primary),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            item.note!,
                            style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.grey.shade700,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyBadge extends StatelessWidget {
  final String label;
  final int qty;
  final Color color;
  const _QtyBadge(
      {required this.label, required this.qty, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$label: $qty',
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatusMeta {
  final String label;
  final Color color;
  final Color bg;
  final IconData icon;
  const _StatusMeta(
      {required this.label,
      required this.color,
      required this.bg,
      required this.icon});
}




