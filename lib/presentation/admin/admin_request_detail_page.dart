import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';

class AdminRequestDetailPage extends StatefulWidget {
  final int requestId;
  const AdminRequestDetailPage({super.key, required this.requestId});

  @override
  State<AdminRequestDetailPage> createState() =>
      _AdminRequestDetailPageState();
}

class _AdminRequestDetailPageState extends State<AdminRequestDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<AdminRequestBloc>()
        .add(AdminRequestEvent.loadDetail(widget.requestId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Detail Request'),
        backgroundColor: AppColors.surface,
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
              // reload detail after action
              context
                  .read<AdminRequestBloc>()
                  .add(AdminRequestEvent.loadDetail(widget.requestId));
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(msg),
                  backgroundColor: AppColors.danger,
                  behavior: SnackBarBehavior.floating),
            ),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            detailLoading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Memuat detail...'),
                ],
              ),
            ),
            loaded: (_, __, ___, ____) => const SizedBox.shrink(),
            detailLoaded: (requestMap) => _DetailBody(request: requestMap),
            actionLoading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Memproses...'),
                ],
              ),
            ),
            actionSuccess: (_) =>
                const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 48, color: AppColors.danger),
                  const SizedBox(height: 12),
                  Text(msg),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context
                        .read<AdminRequestBloc>()
                        .add(AdminRequestEvent.loadDetail(widget.requestId)),
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Detail Body ───────────────────────────────────────────────────────────
class _DetailBody extends StatelessWidget {
  final Map<String, dynamic> request;
  const _DetailBody({required this.request});

  @override
  Widget build(BuildContext context) {
    final status = request['status'] as String? ?? '';
    final id = request['id'] as int? ?? 0;
    final user = request['user'] as Map<String, dynamic>?;
    final userName =
        user?['name']?.toString() ?? 'User #${request['user_id']}';
    final items = request['items'] as List? ?? [];
    final notes = request['notes'] as String?;
    final createdAt = request['created_at'] as String? ?? '';
    final rejectReason = request['reject_reason'] as String?;
    final meta = _statusMeta(status);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Status banner ────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [meta.color, meta.color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(meta.icon, color: Colors.white, size: 26),
                    const SizedBox(width: 10),
                    Text(meta.label,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                if (status == 'rejected' && rejectReason != null) ...[
                  const SizedBox(height: 6),
                  Text('Alasan: $rejectReason',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13)),
                ],
                const SizedBox(height: 8),
                Text(
                  'Request #$id oleh $userName · ${_formatDate(createdAt)}',
                  style:
                      TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Catatan ──────────────────────────────────────────────
          if (notes != null && notes.isNotEmpty) ...[
            _SectionCard(
              title: 'Catatan',
              child: Text(notes, style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 14),
          ],

          // ── Items ────────────────────────────────────────────────
          _SectionCard(
            title: 'Daftar Item (${items.length})',
            child: Column(
              children: items
                  .map((item) => _ItemRow(
                      item: item as Map<String, dynamic>, status: status))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),

          // ── Action buttons ───────────────────────────────────────
          // Status 'pending' = tahap Admin verifikasi (bukan approve final)
          if (status == 'pending') ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _showApproveSheet(context, request),
                    icon: const Icon(Icons.fact_check_rounded),
                    label: const Text('Verifikasi'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showRejectDialog(context, request),
                    icon: const Icon(Icons.close_rounded,
                        color: AppColors.danger),
                    label: const Text('Tolak',
                        style: TextStyle(color: AppColors.danger)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.danger),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ],
          // Status 'pending_superadmin' = menunggu approval final Super Admin (web)
          if (status == 'pending_superadmin') ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.infoSoft,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.hourglass_bottom_rounded,
                      color: AppColors.info, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Sudah diverifikasi. Menunggu approval final dari Super Admin.',
                      style: TextStyle(fontSize: 12.5, color: AppColors.info),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (status == 'approved') ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _confirmComplete(context, id),
                icon: const Icon(Icons.done_all),
                label: const Text('Tandai Selesai'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.info,
                    foregroundColor: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ── Bottom sheet verifikasi Admin — TANPA field gudang ──────────────
  void _showApproveSheet(BuildContext context, Map<String, dynamic> req) {
    HapticFeedback.lightImpact();
    final rawItems = req['items'] as List? ?? [];
    final qtyControllers = rawItems.map((i) {
      final item = i as Map<String, dynamic>;
      return TextEditingController(
          text: '${item['requested_quantity'] ?? 1}');
    }).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AdminRequestBloc>(),
        child: _ApproveSheet(
          request: req,
          qtyControllers: qtyControllers,
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context, Map<String, dynamic> req) {
    HapticFeedback.lightImpact();
    final reasonCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogCtx) => BlocProvider.value(
        value: context.read<AdminRequestBloc>(),
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Tolak Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Request #${req['id']}',
                  style: const TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 14),
              TextField(
                controller: reasonCtrl,
                maxLines: 3,
                decoration:
                    const InputDecoration(labelText: 'Alasan Penolakan'),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogCtx),
                child: const Text('Batal')),
            ElevatedButton(
              onPressed: () {
                if (reasonCtrl.text.trim().isEmpty) return;
                Navigator.pop(dialogCtx);
                context.read<AdminRequestBloc>().add(AdminRequestEvent.reject(
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

  void _confirmComplete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Selesaikan Request?'),
        content: const Text('Tandai request ini sebagai selesai.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              context
                  .read<AdminRequestBloc>()
                  .add(AdminRequestEvent.complete(id));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info,
                foregroundColor: Colors.white),
            child: const Text('Ya, Selesai'),
          ),
        ],
      ),
    );
  }

  _StatusMeta _statusMeta(String s) {
    switch (s) {
      case 'pending':
        return _StatusMeta(Icons.hourglass_top_rounded, AppColors.warning,
            AppColors.warningSoft, 'Menunggu Verifikasi Admin');
      case 'pending_superadmin':
        return _StatusMeta(Icons.hourglass_bottom_rounded, AppColors.info,
            AppColors.infoSoft, 'Menunggu Approval Final');
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

// ── Approve/Verifikasi Sheet — TANPA input gudang ───────────────────────
class _ApproveSheet extends StatelessWidget {
  final Map<String, dynamic> request;
  final List<TextEditingController> qtyControllers;

  const _ApproveSheet({
    required this.request,
    required this.qtyControllers,
  });

  @override
  Widget build(BuildContext context) {
    final items = request['items'] as List? ?? [];
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, ctrl) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                    child: Text('Verifikasi Request #${request['id']}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.text)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
            Expanded(
              child: ListView(
                controller: ctrl,
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
                    final name = product?['name']?.toString() ??
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
                                Text(name,
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
                              controller: qtyControllers[e.key],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration:
                                  const InputDecoration(isDense: true),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      final approveItems = items.asMap().entries.map((e) {
                        final item = e.value as Map<String, dynamic>;
                        final qty =
                            int.tryParse(qtyControllers[e.key].text.trim()) ??
                                (item['requested_quantity'] as int? ?? 1);
                        return <String, dynamic>{
                          'request_item_id': item['id'],
                          'approved_quantity': qty,
                        };
                      }).toList();
                      Navigator.pop(context);
                      context.read<AdminRequestBloc>().add(
                          AdminRequestEvent.approve(
                            requestId: request['id'] as int,
                            items: approveItems,
                          ));
                    },
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

// ── Item Row ─────────────────────────────────────────────────────────────
class _ItemRow extends StatelessWidget {
  final Map<String, dynamic> item;
  final String status;
  const _ItemRow({required this.item, required this.status});

  @override
  Widget build(BuildContext context) {
    final product = item['product'] as Map<String, dynamic>?;
    final name =
        product?['name']?.toString() ?? 'Produk #${item['product_id']}';
    final sku = product?['sku']?.toString();
    final requestedQty = item['requested_quantity'] as int? ?? 0;
    final approvedQty = item['approved_quantity'] as int?;
    final note = item['note'] as String?;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.inventory_2_outlined,
                color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13.5)),
                if (sku != null)
                  Text('SKU: $sku',
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.textMuted)),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: [
                    _QtyChip(
                        label: 'Diminta',
                        qty: requestedQty,
                        color: AppColors.info),
                    if (approvedQty != null)
                      _QtyChip(
                          label: 'Direkomendasikan',
                          qty: approvedQty,
                          color: AppColors.success),
                  ],
                ),
                if (note != null && note.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text('Catatan: $note',
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textMuted)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyChip extends StatelessWidget {
  final String label;
  final int qty;
  final Color color;
  const _QtyChip(
      {required this.label, required this.qty, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('$label: $qty',
          style: TextStyle(
              fontSize: 11, color: color, fontWeight: FontWeight.w600)),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark)),
          Divider(height: 16, color: Colors.grey.shade100),
          child,
        ],
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