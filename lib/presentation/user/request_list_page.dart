import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/request_response_model.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
import 'package:warehouse/presentation/user/create_request_page.dart';
import 'app_theme.dart';
import 'request_detail_page.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Request List Page — Daftar Permintaan Barang (BLoC-connected)
// ─────────────────────────────────────────────────────────────────────────────

class RequestListPage extends StatefulWidget {
  const RequestListPage({super.key});

  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  final _statusFilters = [
    'all',
    'pending',
    'approved',
    'rejected',
    'completed'
  ];
  String _activeStatus = 'all';

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  void _loadRequests({String? status}) {
    final s = (status == null || status == 'all') ? null : status;
    context.read<RequestBloc>().add(RequestEvent.loadMyRequests(status: s));
  }

  void _switchStatus(String status) {
    if (_activeStatus == status) return;
    HapticFeedback.selectionClick();
    setState(() => _activeStatus = status);
    _loadRequests(status: status);
  }

  void _reload() {
    setState(() => _activeStatus = 'all');
    _loadRequests();
  }

  String _labelFilter(String s) {
    switch (s) {
      case 'all':
        return 'Semua';
      case 'pending':
        return 'Pending';
      case 'approved':
        return 'Disetujui';
      case 'rejected':
        return 'Ditolak';
      case 'completed':
        return 'Selesai';
      default:
        return s;
    }
  }

  Color _accentOf(String s) {
    switch (s) {
      case 'pending':
        return AppTheme.statusPending;
      case 'approved':
        return AppTheme.statusApproved;
      case 'rejected':
        return AppTheme.statusRejected;
      case 'completed':
        return AppTheme.statusCompleted;
      default:
        return AppTheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightOverlay,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildHeader(),
            SliverToBoxAdapter(child: _buildFilterChips()),
            BlocBuilder<RequestBloc, RequestState>(
              builder: (context, state) => state.when(
                initial: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(color: AppTheme.primary),
                  ),
                ),
                listLoaded: (result) {
                  if (result.data.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildEmpty(),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                    sliver: SliverList.separated(
                      itemCount: result.data.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, i) =>
                          _RequestCard(request: result.data[i]),
                    ),
                  );
                },
                detailLoaded: (_) =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                actionSuccess: (msg, _) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _loadRequests(status: _activeStatus);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(msg),
                      backgroundColor: AppTheme.statusApproved,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ));
                  });
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                        child:
                            CircularProgressIndicator(color: AppTheme.primary)),
                  );
                },
                error: (msg) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: _buildError(msg),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: _buildFab(context),
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return SliverAppBar(
      expandedHeight: 120,
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
          decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.06),
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
                        'Permintaan Barang',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pantau & kelola semua permintaan Anda',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

  // ── Filter Chips ───────────────────────────────────────────────────────────
  Widget _buildFilterChips() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        itemCount: _statusFilters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final s = _statusFilters[i];
          final selected = _activeStatus == s;
          final accent = _accentOf(s);
          return GestureDetector(
            onTap: () => _switchStatus(s),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: selected ? accent : Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: selected ? accent : Colors.grey.shade200,
                  width: 1.5,
                ),
              ),
              child: Text(
                _labelFilter(s),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppTheme.textPrimary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── FAB ────────────────────────────────────────────────────────────────────
  Widget _buildFab(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        HapticFeedback.selectionClick();
        final created = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<RequestBloc>(),
              child: const CreateRequestPage(),
            ),
          ),
        );
        if (created == true && mounted) {
          _loadRequests(status: _activeStatus);
        }
      },
      backgroundColor: AppTheme.primary,
      elevation: 4,
      icon: const Icon(Icons.add_rounded, color: Colors.white),
      label: const Text(
        'Buat Permintaan',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }

  // ── Empty State ────────────────────────────────────────────────────────────
  Widget _buildEmpty() {
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
                color: AppTheme.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inventory_2_outlined,
                  size: 36, color: AppTheme.primary),
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum ada permintaan',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 6),
            Text(
              'Tekan tombol + untuk membuat permintaan baru.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  // ── Error State ────────────────────────────────────────────────────────────
  // Menampilkan pesan yang lebih jelas + saran tindakan sesuai jenis error
  Widget _buildError(String msg) {
    // Deteksi jenis error dari pesan
    final is403 = msg.contains('403') ||
        msg.contains('Forbidden') ||
        msg.contains('tidak memiliki akses');
    final is401 = msg.contains('401') ||
        msg.contains('Unauthenticated') ||
        msg.contains('Unauthorized');
    final isNetwork = msg.contains('SocketException') ||
        msg.contains('Connection') ||
        msg.contains('timeout');

    final IconData errorIcon;
    final Color errorColor;
    final String errorTitle;
    final String errorDesc;
    final String buttonLabel;
    final VoidCallback onButtonTap;

    if (is403) {
      errorIcon = Icons.lock_outline_rounded;
      errorColor = AppTheme.statusPending;
      errorTitle = 'Akses Ditolak';
      errorDesc =
          'Akun Anda tidak memiliki izin untuk melihat halaman ini.\n\nSilakan hubungi administrator atau coba login ulang.';
      buttonLabel = 'Muat Ulang';
      onButtonTap = _reload;
    } else if (is401) {
      errorIcon = Icons.no_accounts_rounded;
      errorColor = AppTheme.statusRejected;
      errorTitle = 'Sesi Berakhir';
      errorDesc = 'Sesi login Anda telah habis. Silakan login kembali.';
      buttonLabel = 'Login Ulang';
      onButtonTap = () =>
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (r) => false);
    } else if (isNetwork) {
      errorIcon = Icons.wifi_off_rounded;
      errorColor = Colors.grey;
      errorTitle = 'Tidak Ada Koneksi';
      errorDesc = 'Periksa koneksi internet Anda lalu coba lagi.';
      buttonLabel = 'Coba Lagi';
      onButtonTap = _reload;
    } else {
      errorIcon = Icons.error_outline_rounded;
      errorColor = AppTheme.statusRejected;
      errorTitle = 'Terjadi Kesalahan';
      errorDesc = msg;
      buttonLabel = 'Coba Lagi';
      onButtonTap = _reload;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: errorColor.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(errorIcon, size: 36, color: errorColor),
            ),
            const SizedBox(height: 16),
            Text(
              errorTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, color: Colors.grey.shade500, height: 1.55),
            ),

            // ── Detail teknis — bisa di-expand ────────────────────────────
            if (!is403 && !is401 && !isNetwork) ...[
              const SizedBox(height: 12),
              _TechnicalDetail(message: msg),
            ],

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onButtonTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(buttonLabel,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Widget detail teknis yang bisa di-expand ─────────────────────────────────
class _TechnicalDetail extends StatefulWidget {
  final String message;
  const _TechnicalDetail({required this.message});

  @override
  State<_TechnicalDetail> createState() => _TechnicalDetailState();
}

class _TechnicalDetailState extends State<_TechnicalDetail> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.code_rounded, size: 13, color: Colors.grey.shade500),
                const SizedBox(width: 6),
                Text('Detail teknis',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500)),
                const Spacer(),
                Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            if (_expanded) ...[
              const SizedBox(height: 6),
              Text(
                widget.message,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                    fontFamily: 'monospace',
                    height: 1.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Request Card
// ─────────────────────────────────────────────────────────────────────────────
class _RequestCard extends StatelessWidget {
  final StockRequestModel request;
  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final meta = _statusMeta(request.status);

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<RequestBloc>(),
              child: RequestDetailPage(requestId: request.id),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Baris atas ─────────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: meta.bg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(meta.icon, color: meta.color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${request.items.length} jenis barang',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'ID #${request.id}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Badge status
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: meta.bg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    meta.label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: meta.color,
                    ),
                  ),
                ),
              ],
            ),

            // ── Catatan ────────────────────────────────────────────────────
            if (request.notes != null && request.notes!.isNotEmpty) ...[
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.notes_rounded,
                        size: 13, color: AppTheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        request.notes!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
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

            // ── Alasan ditolak ─────────────────────────────────────────────
            if (request.status == 'rejected' &&
                request.rejectReason != null) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.bgRejected,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded,
                        size: 13, color: AppTheme.statusRejected),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Ditolak: ${request.rejectReason}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppTheme.statusRejected,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey.shade100),
            const SizedBox(height: 10),

            // ── Footer ─────────────────────────────────────────────────────
            Row(
              children: [
                Icon(Icons.access_time_rounded,
                    size: 12, color: Colors.grey.shade400),
                const SizedBox(width: 4),
                Text(
                  _formatDate(request.createdAt),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Lihat Detail',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.chevron_right_rounded,
                    size: 16, color: AppTheme.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'Mei',
        'Jun',
        'Jul',
        'Agu',
        'Sep',
        'Okt',
        'Nov',
        'Des'
      ];
      return '${dt.day.toString().padLeft(2, '0')} ${months[dt.month - 1]} '
          '${dt.year}  ${dt.hour.toString().padLeft(2, '0')}:'
          '${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return raw;
    }
  }

  _StatusMeta _statusMeta(String status) {
    switch (status) {
      case 'pending':
        return _StatusMeta(
            label: 'Pending',
            color: AppTheme.statusPending,
            bg: AppTheme.bgPending,
            icon: Icons.hourglass_empty_rounded);
      case 'approved':
        return _StatusMeta(
            label: 'Disetujui',
            color: AppTheme.statusApproved,
            bg: AppTheme.bgApproved,
            icon: Icons.check_circle_rounded);
      case 'rejected':
        return _StatusMeta(
            label: 'Ditolak',
            color: AppTheme.statusRejected,
            bg: AppTheme.bgRejected,
            icon: Icons.cancel_rounded);
      case 'completed':
        return _StatusMeta(
            label: 'Selesai',
            color: AppTheme.statusCompleted,
            bg: AppTheme.bgCompleted,
            icon: Icons.task_alt_rounded);
      default:
        return _StatusMeta(
            label: status,
            color: Colors.grey,
            bg: Colors.grey.shade100,
            icon: Icons.circle_outlined);
    }
  }
}

class _StatusMeta {
  final String label;
  final Color color;
  final Color bg;
  final IconData icon;
  const _StatusMeta({
    required this.label,
    required this.color,
    required this.bg,
    required this.icon,
  });
}
