import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/shared/splash_page.dart';
import 'presentation/shared/login_page.dart';
import 'presentation/shared/register_page.dart';
import 'presentation/admin/pages/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const GudangProApp());
}

class GudangProApp extends StatelessWidget {
  const GudangProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GudangPro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _fadeRoute(const SplashPage());
          case '/login':
            return _slideRoute(const LoginPage());
          case '/register':
            final role = settings.arguments as AppRole? ?? AppRole.user;
            return _slideRoute(RegisterPage(role: role));
          default:
            return _fadeRoute(const SplashPage());
        }
      },
    );
  }

  static PageRoute _fadeRoute(Widget page) => PageRouteBuilder(
        pageBuilder: (_, a, __) => FadeTransition(opacity: a, child: page),
        transitionDuration: const Duration(milliseconds: 400),
      );

  static PageRoute _slideRoute(Widget page) => PageRouteBuilder(
        pageBuilder: (_, a, __) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
          child: page,
        ),
        transitionDuration: const Duration(milliseconds: 350),
      );
}

enum AppRole { user, admin, superAdmin }

extension AppRoleX on AppRole {
  String get label {
    switch (this) {
      case AppRole.user:        return 'User';
      case AppRole.admin:       return 'Admin';
      case AppRole.superAdmin:  return 'Super Admin';
    }
  }

  String get description {
    switch (this) {
      case AppRole.user:        return 'Akses permintaan & riwayat barang';
      case AppRole.admin:       return 'Kelola stok, transfer, dan laporan';
      case AppRole.superAdmin:  return 'Akses penuh semua fitur sistem';
    }
  }

  IconData get icon {
    switch (this) {
      case AppRole.user:        return Icons.person_rounded;
      case AppRole.admin:       return Icons.manage_accounts_rounded;
      case AppRole.superAdmin:  return Icons.shield_rounded;
    }
  }
}