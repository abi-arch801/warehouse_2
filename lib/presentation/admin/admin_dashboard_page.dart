import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/request_response_model.dart';
import 'package:warehouse/presentation/admin/admin_product_list_page.dart';
import 'package:warehouse/presentation/admin/admin_request_list_page.dart';
import 'package:warehouse/presentation/admin/admin_user_page.dart';
import 'package:warehouse/presentation/admin/admin_warehouse_page.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
import '../../../../data/model/response/auth/auth_response_model.dart';

// ── Shell utama dengan navbar ─────────────────────────────────────────────────
class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _index = 0;

  void _go(int i) {
    if (i == _index) return;
    HapticFeedback.selectionClick();
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _DashboardTab(),
      BlocProvider.value(
        value: context.read<AdminRequestBloc>(),
        child: const AdminRequestListPage(),
      ),
      const AdminProductListPage(),
      const AdminWarehousesPage(),
      const AdminUserPageStandalone(),
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, anim) =>
            FadeTransition(opacity: anim, child: child),
        child: KeyedSubtree(
          key: ValueKey(_index),
          child: pages[_index],
        ),
      ),
    );
  }
}

// ── Tab Beranda (konten dashboard utama) ──────────────────────────────────────
class _DashboardTab extends StatefulWidget {
  const _DashboardTab();

  @override
  State<_DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<_DashboardTab> {
  UserModel? _user;
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _loadUser();
      context.read<AdminDashboardBloc>().add(const AdminDashboardEvent.load());
    }
  }

  Future<void> _loadUser() async {
    final u = await AuthLocalDatasource().getUser();
    if (mounted) setState(() => _user = u);
  }

  Future<void> _onRefresh() async {
    HapticFeedback.lightImpact();
    context.read<AdminDashboardBloc>().add(const AdminDashboardEvent.refresh());
    await Future.delayed(const Duration(milliseconds: 700));
  }

  void _push(Widget page) {
    HapticFeedback.selectionClick();
    Navigator.push(context, MaterialPageRoute(builder: (_) => page)).then((_) =>
        context
            .read<AdminDashboardBloc>()
            .add(const AdminDashboardEvent.refresh()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
        builder: (context, state) {
          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: _onRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _HeaderCard(user: _user)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                    child: state.maybeWhen(
                      loaded: (summary) => _StatGrid(
                        pending: summary.pendingRequests,
                        products: summary.totalProducts,
                        warehouses: summary.totalWarehouses,
                        totalRequests: summary.pendingRequests +
                            summary.pendingPO +
                            summary.inTransitTransfers,
                      ),
                      loading: () => const _StatGridSkeleton(),
                      orElse: () => const _StatGridSkeleton(),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 22, 20, 10),
                    child: Text('Aksi Cepat',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text)),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.95,
                    ),
                    delegate: SliverChildListDelegate([
                      _ActionBtn(
                        icon: Icons.assignment_turned_in_rounded,
                        color: AppColors.warning,
                        label: 'Request\nBarang',
                        onTap: () => _push(BlocProvider.value(
                          value: context.read<AdminRequestBloc>(),
                          child: const AdminRequestListPage(),
                        )),
                      ),
                      _ActionBtn(
                        icon: Icons.inventory_2_rounded,
                        color: AppColors.primary,
                        label: 'Produk',
                        onTap: () => _push(const AdminProductListPage()),
                      ),
                      _ActionBtn(
                        icon: Icons.warehouse_rounded,
                        color: AppColors.accent,
                        label: 'Gudang',
                        onTap: () => _push(const AdminWarehousesPage()),
                      ),
                      _ActionBtn(
                        icon: Icons.people_rounded,
                        color: AppColors.info,
                        label: 'User',
                        onTap: () => _push(const AdminUserPageStandalone()),
                      ),
                      _ActionBtn(
                        icon: Icons.bar_chart_rounded,
                        color: AppColors.danger,
                        label: 'Laporan\nStok',
                        onTap: () {},
                      ),
                      _ActionBtn(
                        icon: Icons.notifications_active_rounded,
                        color: AppColors.success,
                        label: 'Notifikasi\nAlur',
                        onTap: () {},
                      ),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text('Notifikasi Alur',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700)),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('Lihat semua')),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: state.maybeWhen(
                      loaded: (summary) => Column(
                        children: [
                          if (summary.pendingRequests > 0)
                            _AlertTile(
                              icon: Icons.assignment_turned_in_rounded,
                              color: AppColors.warning,
                              softColor: AppColors.warningSoft,
                              title:
                                  '${summary.pendingRequests} request menunggu approval',
                              subtitle:
                                  'Tinjau & setujui permintaan stok user.',
                              onTap: () {},
                            ),
                        ],
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text('Request Terbaru',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700)),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('Lihat semua')),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  sliver: SliverToBoxAdapter(
                    child: state.maybeWhen(
                      loaded: (_) => Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                              'Data request terbaru dipindahkan ke halaman Request'),
                        ),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────
class _HeaderCard extends StatelessWidget {
  final UserModel? user;
  const _HeaderCard({this.user});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekdays = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    final months = [
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
    final dateStr =
        '${weekdays[now.weekday - 1]}, ${now.day} ${months[now.month - 1]}';

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Text(
                  user?.name.isNotEmpty == true
                      ? user!.name[0].toUpperCase()
                      : 'A',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, ${user?.name.split(' ').first ?? 'Admin'}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${_roleLabel(user?.role ?? 'admin')} · $dateStr',
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => HapticFeedback.selectionClick(),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.notifications_none_rounded,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Sistem Manajemen Gudang',
              style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          const Text('GudangPro',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5)),
        ],
      ),
    );
  }

  String _roleLabel(String role) {
    switch (role) {
      case 'super_admin':
        return 'Super Admin';
      case 'admin':
        return 'Admin';
      default:
        return 'Staff';
    }
  }
}

// ── Stat Grid ─────────────────────────────────────────────────────────────────
class _StatGrid extends StatelessWidget {
  final int pending;
  final int products;
  final int warehouses;
  final int totalRequests;

  const _StatGrid({
    required this.pending,
    required this.products,
    required this.warehouses,
    required this.totalRequests,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: [
        _StatCard(
          icon: Icons.inventory_2_rounded,
          color: AppColors.primary,
          label: 'Total Produk',
          value: '$products',
          hint: '$warehouses gudang aktif',
        ),
        _StatCard(
          icon: Icons.hourglass_top_rounded,
          color: AppColors.warning,
          label: 'Request Pending',
          value: '$pending',
          hint: 'Perlu diproses',
        ),
        _StatCard(
          icon: Icons.receipt_long_rounded,
          color: AppColors.info,
          label: 'Total Request',
          value: '$totalRequests',
          hint: 'Semua status',
        ),
        _StatCard(
          icon: Icons.warehouse_rounded,
          color: AppColors.accent,
          label: 'Gudang Aktif',
          value: '$warehouses',
          hint: 'Terdaftar di sistem',
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;
  final String hint;

  const _StatCard({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: double.tryParse(value) ?? 0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                builder: (_, v, __) => Text(
                  '${v.toInt()}',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: color,
                      height: 1),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text)),
              const SizedBox(height: 2),
              Text(hint,
                  style: const TextStyle(
                      fontSize: 10.5, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatGridSkeleton extends StatelessWidget {
  const _StatGridSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: List.generate(
        4,
        (_) => Container(
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

// ── Action Button ─────────────────────────────────────────────────────────────
class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _ActionBtn({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 3))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 8),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: AppColors.text)),
          ],
        ),
      ),
    );
  }
}

// ── Alert Tile ────────────────────────────────────────────────────────────────
class _AlertTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color softColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _AlertTile({
    required this.icon,
    required this.color,
    required this.softColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: softColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: color)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 11.5, color: color.withOpacity(0.7))),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: color.withOpacity(0.5), size: 18),
          ],
        ),
      ),
    );
  }
}

// ── Recent Request ────────────────────────────────────────────────────────────
class _RecentRequestList extends StatelessWidget {
  final List<StockRequestModel> requests;
  const _RecentRequestList({required this.requests});

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text('Belum ada request',
              style: TextStyle(color: AppColors.textMuted)),
        ),
      );
    }
    return Column(
      children: requests.asMap().entries.map((e) {
        final i = e.key;
        final req = e.value;
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: 300 + i * 80),
          curve: Curves.easeOut,
          builder: (_, v, child) => Opacity(
            opacity: v,
            child: Transform.translate(
                offset: Offset(0, (1 - v) * 12), child: child),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _RecentRequestTile(request: req),
          ),
        );
      }).toList(),
    );
  }
}

class _RecentRequestTile extends StatelessWidget {
  final StockRequestModel request;
  const _RecentRequestTile({required this.request});

  @override
  Widget build(BuildContext context) {
    final meta = _statusMeta(request.status);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: meta.bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(meta.icon, color: meta.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Request #${request.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13.5)),
                Text(
                  '${request.items.length} item • ${_formatDate(request.createdAt)}',
                  style: const TextStyle(
                      fontSize: 11.5, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: meta.bg,
              borderRadius: BorderRadius.circular(8),
            ),
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
    );
  }

  _StatusMeta _statusMeta(String s) {
    switch (s) {
      case 'pending':
        return _StatusMeta(Icons.hourglass_top_rounded, AppColors.warning,
            AppColors.warningSoft, 'Pending');
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

class _StatusMeta {
  final IconData icon;
  final Color color;
  final Color bg;
  final String label;
  const _StatusMeta(this.icon, this.color, this.bg, this.label);
}

// ── Placeholder standalone ────────────────────────────────────────────────────
class AdminUserPageStandalone extends StatelessWidget {
  const AdminUserPageStandalone({super.key});

  @override
  Widget build(BuildContext context) => const AdminUserPage();
}
