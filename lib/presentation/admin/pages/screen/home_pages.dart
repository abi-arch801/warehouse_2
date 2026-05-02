import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/screen/dashboard_pages.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/activity_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/chat_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/flow_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/profile_pages.dart';
import '../theme/app_theme.dart';

class HomeShell extends StatefulWidget {
  final AppUser currentUser;
  const HomeShell({super.key, required this.currentUser});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  void _go(int i) {
    if (i == _index) return;
    HapticFeedback.selectionClick();
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardScreen(currentUser: widget.currentUser),
      FlowScreen(currentUser: widget.currentUser),
      ChatScreen(currentUser: widget.currentUser),
      ActivityScreen(currentUser: widget.currentUser),
      ProfileScreen(currentUser: widget.currentUser),
    ];
    final items = <_NavItem>[
      _NavItem(Icons.dashboard_rounded, 'Beranda'),
      _NavItem(Icons.account_tree_rounded, 'Alur'),
      _NavItem(Icons.chat_bubble_rounded, 'Chat'),
      _NavItem(Icons.history_rounded, 'Aktivitas'),
      _NavItem(Icons.person_rounded, 'Profil'),
    ];

    final unreadChats = MockDB.instance.totalUnreadChats();

    return Scaffold(
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
      bottomNavigationBar: _NavBar(
        items: items,
        index: _index,
        unreadChats: unreadChats,
        onTap: _go,
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final List<_NavItem> items;
  final int index;
  final int unreadChats;
  final ValueChanged<int> onTap;

  const _NavBar({
    required this.items,
    required this.index,
    required this.unreadChats,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              final tileW = constraints.maxWidth / items.length;
              return SizedBox(
                height: 52,
                child: Stack(
                  children: [
                    // Indikator pill yang meluncur halus
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 320),
                      curve: Curves.easeOutCubic,
                      left: tileW * index + 6,
                      top: 4,
                      bottom: 4,
                      width: tileW - 12,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    // Tab tombol
                    Row(
                      children: List.generate(items.length, (i) {
                        final isChat = items[i].label == 'Chat';
                        final showBadge = isChat && unreadChats > 0;
                        return Expanded(
                          child: _NavTile(
                            item: items[i],
                            active: index == i,
                            onTap: () => onTap(i),
                            badgeCount: showBadge ? unreadChats : 0,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final _NavItem item;
  final bool active;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavTile({
    required this.item,
    required this.active,
    required this.onTap,
    required this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: active ? 1 : 0),
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOut,
                  builder: (_, t, __) {
                    final color = Color.lerp(
                        AppColors.textMuted, AppColors.primary, t)!;
                    return Icon(
                      item.icon,
                      size: 22,
                      color: color,
                    );
                  },
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.danger,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.surface,
                          width: 1.5,
                        ),
                      ),
                      constraints: const BoxConstraints(minWidth: 16),
                      child: Text(
                        badgeCount > 9 ? '9+' : '$badgeCount',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 10.5,
                color: active ? AppColors.primary : AppColors.textMuted,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}
