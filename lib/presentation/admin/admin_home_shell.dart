import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/admin_activity_page.dart';
import 'package:warehouse/presentation/admin/admin_flow_page.dart';
import 'package:warehouse/presentation/admin/admin_budget_request_page.dart'; // ← tambah import
import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
import 'package:warehouse/presentation/admin/admin_dashboard_page.dart';
import 'package:warehouse/presentation/admin/admin_profile_page.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/shared/chat_page.dart';

class AdminHomeShell extends StatefulWidget {
  const AdminHomeShell({super.key});

  @override
  State<AdminHomeShell> createState() => _AdminHomeShellState();
}

class _AdminHomeShellState extends State<AdminHomeShell> {
  int _currentIndex = 0;

  void goToTab(int i) {
    if (_currentIndex == i) return;
    setState(() => _currentIndex = i);
  }

  @override
  void initState() {
    super.initState();
    context.read<AdminRequestBloc>().add(const AdminRequestEvent.load());
    context.read<AdminStockBloc>().add(const AdminStockEvent.load());
  }

  // ⚠️  Urutan pages HARUS sama persis dengan urutan _items di navbar
  // index 0 → Dashboard
  // index 1 → Alur
  // index 2 → RAB
  // index 3 → Chat
  // index 4 → Aktivitas
  // index 5 → Profil
  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const AdminDashboardPage(), // 0 - Dashboard
      const FlowScreen(), // 1 - Alur
      const AdminBudgetRequestPage(), // 2 - RAB
      const ChatPage(), // 3 - Chat
      const ActivityListPage(), // 4 - Aktivitas
      const AdminProfilePage(), // 5 - Profil
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: _AdminNavBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          HapticFeedback.selectionClick();
          goToTab(i);
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _AdminNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _AdminNavBar({required this.currentIndex, required this.onTap});

  // ⚠️  Urutan _items HARUS sama persis dengan urutan pages di atas
  static const _items = [
    _NavMeta(
        Icons.dashboard_outlined, Icons.dashboard_rounded, 'Dashboard'), // 0
    _NavMeta(
        Icons.account_tree_rounded, Icons.account_tree_rounded, 'Alur'), // 1
    _NavMeta(
        Icons.receipt_long_outlined, Icons.receipt_long_rounded, 'RAB'), // 2
    _NavMeta(Icons.chat_bubble_outline, Icons.chat_bubble_rounded, 'Chat'), // 3
    _NavMeta(Icons.history_rounded, Icons.history_rounded, 'Aktivitas'), // 4
    _NavMeta(Icons.person_outline_rounded, Icons.person_rounded, 'Profil'), // 5
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _items.length,
              (i) => _NavItem(
                meta: _items[i],
                isActive: currentIndex == i,
                onTap: () => onTap(i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavMeta {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavMeta(this.icon, this.activeIcon, this.label);
}

class _NavItem extends StatelessWidget {
  final _NavMeta meta;
  final bool isActive;
  final VoidCallback onTap;
  const _NavItem(
      {required this.meta, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const primary = AppColors.primary;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primarySoft : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? meta.activeIcon : meta.icon,
              color: isActive ? primary : AppColors.textMuted,
              size: 22,
            ),
            const SizedBox(height: 2),
            Text(
              meta.label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
                color: isActive ? primary : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
