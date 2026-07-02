import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';

class UserHomePage extends StatelessWidget {
  /// Callback untuk pindah tab dari parent (UserMainPage)
  final void Function(int index)? onNavigateToTab;

  const UserHomePage({super.key, this.onNavigateToTab});

  static const _primary = Color(0xFF0288D1);
  static const _primaryDark = Color(0xFF01579B);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final userName = state.maybeWhen(
          authenticated: (user) => user.name,
          orElse: () => 'User',
        );

        return Scaffold(
          backgroundColor: const Color(0xFFF0F9FF),
          body: CustomScrollView(
            slivers: [
              // ── App Bar ──────────────────────────────────────────────────
              SliverAppBar(
                expandedHeight: 160,
                floating: false,
                pinned: true,
                backgroundColor: _primary,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [_primaryDark, _primary],
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 80, 24, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Halo, $userName 👋',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Selamat datang di GudangPro',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                    onPressed: () => onNavigateToTab?.call(2),
                  ),
                ],
              ),

              // ── Content ──────────────────────────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Quick Actions
                    const Text(
                      'Aksi Cepat',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01579B)),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _QuickActionCard(
                          icon: Icons.add_box_outlined,
                          label: 'Buat\nPermintaan',
                          color: const Color(0xFF0288D1),
                          onTap: () => onNavigateToTab?.call(1),
                        ),
                        const SizedBox(width: 12),
                        _QuickActionCard(
                          icon: Icons.list_alt_outlined,
                          label: 'Lihat\nStatus',
                          color: const Color(0xFF00897B),
                          onTap: () => onNavigateToTab?.call(1),
                        ),
                        const SizedBox(width: 12),
                        _QuickActionCard(
                          icon: Icons.chat_outlined,
                          label: 'Hubungi\nAdmin',
                          color: const Color(0xFF7B1FA2),
                          onTap: () => onNavigateToTab?.call(2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Ringkasan Permintaan
                    const Text(
                      'Ringkasan Permintaan',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01579B)),
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<RequestBloc, RequestState>(
                      builder: (context, reqState) {
                        int pending = 0, approved = 0, rejected = 0;
                        reqState.maybeWhen(
                          listLoaded: (result) {
                            pending = result.data
                                .where((r) => r.status == 'pending')
                                .length;
                            approved = result.data
                                .where((r) => r.status == 'approved')
                                .length;
                            rejected = result.data
                                .where((r) => r.status == 'rejected')
                                .length;
                          },
                          orElse: () {},
                        );
                        return Row(
                          children: [
                            _StatusCard(
                              label: 'Pending',
                              count: pending > 0 ? '$pending' : '—',
                              color: Colors.orange.shade600,
                            ),
                            const SizedBox(width: 10),
                            _StatusCard(
                              label: 'Disetujui',
                              count: approved > 0 ? '$approved' : '—',
                              color: Colors.green.shade600,
                            ),
                            const SizedBox(width: 10),
                            _StatusCard(
                              label: 'Ditolak',
                              count: rejected > 0 ? '$rejected' : '—',
                              color: Colors.red.shade600,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Info banner
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0288D1), Color(0xFF29B6F6)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline,
                              color: Colors.white, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tips',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Buat permintaan barang dan pantau status persetujuannya secara real-time.',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11, height: 1.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const _StatusCard(
      {required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 3))
          ],
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}