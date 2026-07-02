import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
import 'package:warehouse/presentation/bloc/user/notification/notification_bloc.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
import 'package:warehouse/presentation/shared/chat_page.dart';
import 'package:warehouse/presentation/shared/login_page.dart';
import 'package:warehouse/presentation/user/notification_page.dart';
import 'package:warehouse/presentation/user/request_list_page.dart';
import 'user_home_page.dart';
import 'user_profile_page.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  int _currentIndex = 0;

  static const _primary = Color(0xFF0288D1);

  final _pages = const [
    UserHomePage(),
    RequestListPage(),
    ChatPage(),
    NotificationPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                RequestBloc()..add(const RequestEvent.loadMyRequests())),
        BlocProvider(
            create: (_) => ChatBloc()..add(const ChatEvent.loadChats())),
        BlocProvider(
            create: (_) => NotificationBloc()
              ..add(const NotificationEvent.loadNotifications())),
      ],
    
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4))
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: _primary,
              unselectedItemColor: Colors.grey.shade400,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_rounded),
                    label: 'Beranda'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.inventory_2_outlined),
                    activeIcon: Icon(Icons.inventory_2_rounded),
                    label: 'Permintaan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline),
                    activeIcon: Icon(Icons.chat_bubble_rounded),
                    label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_outlined),
                    activeIcon: Icon(Icons.notifications_rounded),
                    label: 'Notifikasi'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person_rounded),
                    label: 'Profil'),
              ],
            ),
          ),
        ),
      );
  }
}



