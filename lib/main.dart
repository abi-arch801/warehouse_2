// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:intl/date_symbol_data_local.dart';
// // import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
// // import 'package:warehouse/data/datasource/auth/auth_remote_datasource.dart';
// // import 'package:warehouse/presentation/admin/admin_home_shell.dart';
// // import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';
// // import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
// // import 'package:warehouse/presentation/bloc/user/notification/notification_bloc.dart';
// // import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
// // import 'package:warehouse/presentation/shared/login_page.dart';
// // import 'package:warehouse/presentation/shared/splash_page.dart';
// // import 'package:warehouse/presentation/user/user_main_page.dart';

// // import 'presentation/bloc/auth/auth_bloc.dart';

// // void main() {
// //   runZonedGuarded(() async {
// //     WidgetsFlutterBinding.ensureInitialized();

// //     FlutterError.onError = (FlutterErrorDetails details) {
// //       FlutterError.presentError(details);
// //       debugPrint('Flutter Error: ${details.exception}');
// //       debugPrintStack(stackTrace: details.stack);
// //     };

// //     await initializeDateFormatting('id_ID', null);

// //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
// //       statusBarColor: Colors.transparent,
// //       statusBarIconBrightness: Brightness.dark,
// //     ));

// //     // ── Buat datasource dulu ──────────────────────────────────────────────
// //     final authRemote = AuthRemoteDatasource();
// //     final authLocal = AuthLocalDatasource();

// //     // ── AuthBloc ──────────────────────────────────────────────────────────
// //     // Sesuaikan dengan constructor di auth_bloc.dart kamu:
// //     //
// //     // Jika positional  → AuthBloc(authRemote, authLocal)
// //     // Jika named       → AuthBloc(remoteDatasource: authRemote, localDatasource: authLocal)
// //     // Jika tanpa param → AuthBloc()
// //     //
// //     // Error "0 expected, but 2 found" artinya constructor bloc TIDAK
// //     // menerima parameter. Kemungkinan datasource-nya di-create di dalam
// //     // bloc itu sendiri. Ganti baris di bawah dengan AuthBloc() jika itu kasusnya.
// //     final authBloc = AuthBloc()..add(const AuthEvent.checkAuth());

// //     runApp(
// //       MultiBlocProvider(
// //         providers: [
// //           BlocProvider.value(value: authBloc),
// //           BlocProvider(create: (_) => NotificationBloc()),
// //           BlocProvider(create: (_) => ChatBloc()),
// //           BlocProvider(create: (_) => RequestBloc()),
// //         ],
// //         child: const WarehouseApp(),
// //       ),
// //     );
// //   }, (error, stack) {
// //     debugPrint('Zone Error: $error');
// //     debugPrintStack(stackTrace: stack);
// //   });
// // }

// // class WarehouseApp extends StatelessWidget {
// //   const WarehouseApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Warehouse App',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(
// //           seedColor: const Color(0xFF0288D1),
// //           brightness: Brightness.light,
// //         ),
// //         useMaterial3: true,
// //         fontFamily: 'Poppins',
// //         appBarTheme: const AppBarTheme(
// //           centerTitle: true,
// //           elevation: 0,
// //           backgroundColor: Color(0xFF0288D1),
// //           foregroundColor: Colors.white,
// //           titleTextStyle: TextStyle(
// //             color: Colors.white,
// //             fontSize: 18,
// //             fontWeight: FontWeight.bold,
// //             fontFamily: 'Poppins',
// //           ),
// //         ),
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: const Color(0xFF0288D1),
// //             foregroundColor: Colors.white,
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
// //           ),
// //         ),
// //         outlinedButtonTheme: OutlinedButtonThemeData(
// //           style: OutlinedButton.styleFrom(
// //             side: const BorderSide(color: Color(0xFF0288D1)),
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
// //           ),
// //         ),
// //         inputDecorationTheme: InputDecorationTheme(
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// //           contentPadding:
// //               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //         ),
// //         cardTheme: CardThemeData(
// //           elevation: 0,
// //           shape:
// //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //           color: Colors.white,
// //         ),
// //       ),
// //       locale: const Locale('id', 'ID'),
// //       supportedLocales: const [
// //         Locale('id', 'ID'),
// //         Locale('en', 'US'),
// //       ],
// //       localizationsDelegates: const [
// //         GlobalMaterialLocalizations.delegate,
// //         GlobalWidgetsLocalizations.delegate,
// //         GlobalCupertinoLocalizations.delegate,
// //       ],
// //       home: BlocBuilder<AuthBloc, AuthState>(
// //         builder: (context, state) {
// //           return state.when(
// //             initial: () => const SplashPage(),
// //             loading: () => const SplashPage(),
// //             authenticated: (user) {
// //               final isAdmin =
// //                   user.role == 'admin' || user.role == 'super_admin';
// //               if (isAdmin) {
// //                 return MultiBlocProvider(
// //                   providers: [
// //                     BlocProvider(create: (_) => AdminDashboardBloc()),
// //                     // BlocProvider(create: (_) => AdminalurBloc()),
// //                     BlocProvider(create: (_) => ChatBloc()),
// //                     BlocProvider(create: (_) => ActivityBloc()),
// //                     // BlocProvider(create: (_) => profile()),
// //                     BlocProvider(create: (_) => AdminRequestBloc()),
// //                     BlocProvider(create: (_) => AdminStockBloc()),
// //                     BlocProvider(create: (_) => AdminWarehouseBloc()),
// //                     BlocProvider(create: (_) => TransferBloc()),
// //                   ],
// //                   child: const AdminHomeShell(),
// //                 );
// //               }
// //               return const UserMainPage();
// //             },
// //             unauthenticated: () => const LoginPage(),
// //             error: (_) => const LoginPage(),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
// import 'package:warehouse/data/datasource/auth/auth_remote_datasource.dart';
// import 'package:warehouse/presentation/admin/admin_home_shell.dart';
// import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart'; // ← tambah import
// import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
// import 'package:warehouse/presentation/bloc/user/notification/notification_bloc.dart';
// import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
// import 'package:warehouse/presentation/shared/login_page.dart';
// import 'package:warehouse/presentation/shared/splash_page.dart';
// import 'package:warehouse/presentation/user/user_main_page.dart';

// import 'presentation/bloc/auth/auth_bloc.dart';

// void main() {
//   runZonedGuarded(() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     FlutterError.onError = (FlutterErrorDetails details) {
//       FlutterError.presentError(details);
//       debugPrint('Flutter Error: ${details.exception}');
//       debugPrintStack(stackTrace: details.stack);
//     };

//     await initializeDateFormatting('id_ID', null);

//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//     ));

//     final authBloc = AuthBloc()..add(const AuthEvent.checkAuth());

//     runApp(
//       MultiBlocProvider(
//         providers: [
//           BlocProvider.value(value: authBloc),
//           BlocProvider(create: (_) => NotificationBloc()),
//           BlocProvider(create: (_) => ChatBloc()),
//           BlocProvider(create: (_) => RequestBloc()),
//           BlocProvider(create: (_) => AuthBloc()),

//         ],
//         child: const WarehouseApp(),
//       ),
//     );
//   }, (error, stack) {
//     debugPrint('Zone Error: $error');
//     debugPrintStack(stackTrace: stack);
//   });
// }

// class WarehouseApp extends StatelessWidget {
//   const WarehouseApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Warehouse App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF0288D1),
//           brightness: Brightness.light,
//         ),
//         useMaterial3: true,
//         fontFamily: 'Poppins',
//         appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Color(0xFF0288D1),
//           foregroundColor: Colors.white,
//           titleTextStyle: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF0288D1),
//             foregroundColor: Colors.white,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//           ),
//         ),
//         outlinedButtonTheme: OutlinedButtonThemeData(
//           style: OutlinedButton.styleFrom(
//             side: const BorderSide(color: Color(0xFF0288D1)),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//           ),
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         ),
//         cardTheme: CardThemeData(
//           elevation: 0,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           color: Colors.white,
//         ),
//       ),
//       locale: const Locale('id', 'ID'),
//       supportedLocales: const [
//         Locale('id', 'ID'),
//         Locale('en', 'US'),
//       ],
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => const SplashPage(),
//             loading: () => const SplashPage(),
//             authenticated: (user) {
//               final isAdmin =
//                   user.role == 'admin' || user.role == 'super_admin';
//               if (isAdmin) {
//                 return MultiBlocProvider(
//                   providers: [
//                     BlocProvider(create: (_) => AdminDashboardBloc()),
//                     BlocProvider(create: (_) => ChatBloc()),
//                     BlocProvider(create: (_) => ActivityBloc()),
//                     BlocProvider(create: (_) => AdminRequestBloc()),
//                     BlocProvider(create: (_) => AdminStockBloc()),
//                     BlocProvider(create: (_) => AdminWarehouseBloc()),
//                     BlocProvider(
//                       // ← TAMBAH INI: TransferBloc tersedia di seluruh admin shell
//                       create: (_) =>
//                           TransferBloc()..add(const TransferEvent.load()),
//                     ),
//                   ],
//                   child: const AdminHomeShell(),
//                 );
//               }
//               return const UserMainPage();
//             },
//             unauthenticated: () => const LoginPage(),
//             error: (_) => const LoginPage(),
//           );
//         },
//       ),
//     );
//   }
// }

// main.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:warehouse/presentation/admin/admin_home_shell.dart';
import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';
import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
import 'package:warehouse/presentation/bloc/chat/chat_bloc.dart';
import 'package:warehouse/presentation/bloc/user/notification/notification_bloc.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
import 'package:warehouse/presentation/shared/login_page.dart';
import 'package:warehouse/presentation/shared/splash_page.dart';
import 'package:warehouse/presentation/user/user_main_page.dart';

// ✅ Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      debugPrint('Flutter Error: ${details.exception}');
    };

    await initializeDateFormatting('id_ID', null);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final authBloc = AuthBloc()..add(const AuthEvent.checkAuth());

    // ✅ Listen state AuthBloc → navigasi via navigatorKey
    authBloc.stream.listen((state) {
      state.maybeWhen(
        authenticated: (user) {
          final isAdmin = user.role == 'admin' || user.role == 'super_admin';
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: authBloc),
                  if (isAdmin) ...[
                    BlocProvider(create: (_) => AdminDashboardBloc()),
                    BlocProvider(create: (_) => ChatBloc()),
                    BlocProvider(create: (_) => ActivityBloc()),
                    BlocProvider(create: (_) => AdminRequestBloc()),
                    BlocProvider(create: (_) => AdminStockBloc()),
                    BlocProvider(create: (_) => AdminWarehouseBloc()),
                    BlocProvider(create: (_) => TransferBloc()),
                    BlocProvider(create: (_) => NotificationBloc()),

                    
                  ] else ...[
                    BlocProvider(create: (_) => NotificationBloc()),
                    BlocProvider(create: (_) => RequestBloc()),
                  ],
                ],
                child: isAdmin
                    ? const AdminHomeShell()
                    : const UserMainPage(),
              ),
            ),
            (_) => false,
          );
        },
        unauthenticated: () {
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (_) => false,
          );
        },
        error: (_) {
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (_) => false,
          );
        },
        orElse: () {},
      );
    });

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: authBloc),
          BlocProvider(create: (_) => NotificationBloc()),
          BlocProvider(create: (_) => ChatBloc()),
          BlocProvider(create: (_) => RequestBloc()),
        ],
        child: WarehouseApp(authBloc: authBloc),
      ),
    );
  }, (error, stack) {
    debugPrint('Zone Error: $error');
    debugPrintStack(stackTrace: stack);
  });
}

class WarehouseApp extends StatelessWidget {
  final AuthBloc authBloc;
  const WarehouseApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // ✅ pasang global key
      debugShowCheckedModeBanner: false,
      title: 'Warehouse App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0288D1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF0288D1),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0288D1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF0288D1)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          color: Colors.white,
        ),
      ),
      locale: const Locale('id', 'ID'),
      supportedLocales: const [
        Locale('id', 'ID'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ✅ home tetap SplashPage, navigasi dikontrol stream listener di atas
      home: const SplashPage(),
    );
  }
}











