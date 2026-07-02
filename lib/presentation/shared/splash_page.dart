// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
// // import 'package:warehouse/presentation/user/user_home_page.dart';
// // import 'login_page.dart';

// // class SplashPage extends StatelessWidget {
// //   const SplashPage({super.key});

// //   static const _primary = Color(0xFF0288D1);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<AuthBloc, AuthState>(
// //       listener: (context, state) {
// //         state.whenOrNull(
// //           unauthenticated: () => Navigator.pushAndRemoveUntil(
// //             context,
// //             MaterialPageRoute(
// //               builder: (_) => BlocProvider.value(
// //                 value: context.read<AuthBloc>(), // ✅ teruskan bloc yang sama
// //                 child: const LoginPage(),
// //               ),
// //             ),
// //             (_) => false,
// //           ),
// // authenticated: (user) => Navigator.pushAndRemoveUntil(
// //             context,
// //             MaterialPageRoute(
// //               builder: (_) => BlocProvider.value(
// //                 value: context.read<AuthBloc>(), // ✅ teruskan bloc yang sama
// //                 child: const UserHomePage(),
// //               ),
// //             ),
// //             (_) => false,
// //           ),
// //         );
// //       },
// //       child: Scaffold(
// //         backgroundColor: _primary,
// //         body: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Container(
// //                 width: 100,
// //                 height: 100,
// //                 decoration: BoxDecoration(
// //                   color: Colors.white.withOpacity(0.15),
// //                   borderRadius: BorderRadius.circular(24),
// //                 ),
// //                 child: const Icon(
// //                   Icons.warehouse_outlined,
// //                   size: 56,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               const SizedBox(height: 24),
// //               const Text(
// //                 'Warehouse',
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 32,
// //                   fontWeight: FontWeight.bold,
// //                   letterSpacing: 1.2,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 'Manajemen Gudang Terpadu',
// //                 style: TextStyle(
// //                   color: Colors.white.withOpacity(0.8),
// //                   fontSize: 14,
// //                 ),
// //               ),
// //               const SizedBox(height: 48),
// //               const CircularProgressIndicator(
// //                 color: Colors.white,
// //                 strokeWidth: 2.5,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart'; // ✅ lowercase 'auth'
// import 'package:warehouse/presentation/user/user_home_page.dart';
// import 'login_page.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});

//   static const _primary = Color(0xFF0288D1);

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.whenOrNull(
//           authenticated: (user) => Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (_) => BlocProvider.value(
//                 value: context.read<AuthBloc>(), // ✅ teruskan bloc yang sama
//                 child: const UserHomePage(),
//               ),
//             ),
//             (_) => false,
//           ),
//           unauthenticated: () => Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (_) => BlocProvider.value(
//                 value: context.read<AuthBloc>(), // ✅ teruskan bloc yang sama
//                 child: const LoginPage(),
//               ),
//             ),
//             (_) => false,
//           ),
//         );
//       },
//       child: Scaffold(
//         backgroundColor: _primary,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: const Icon(
//                   Icons.warehouse_outlined,
//                   size: 56,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 'Warehouse',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Manajemen Gudang Terpadu',
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(0.8),
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 48),
//               const CircularProgressIndicator(
//                 color: Colors.white,
//                 strokeWidth: 2.5,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/admin_home_shell.dart';
import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
import 'package:warehouse/presentation/user/user_main_page.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const _primary = Color(0xFF0288D1);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) {
            final isAdmin = user.role == 'admin' || user.role == 'super_admin';

            // ✅ Ambil AuthBloc sebelum Navigator (context masih valid)
            final authBloc = context.read<AuthBloc>();

            if (isAdmin) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      // ✅ Teruskan AuthBloc yang sama
                      BlocProvider.value(value: authBloc),
                      BlocProvider(create: (_) => AdminDashboardBloc()),
                      BlocProvider(create: (_) => AdminRequestBloc()),
                      BlocProvider(create: (_) => AdminStockBloc()),
                      BlocProvider(create: (_) => AdminWarehouseBloc()),
                      BlocProvider(create: (_) => AdminProductBloc()),
                      BlocProvider(create: (_) => ActivityBloc()),
                    ],
                    child: const AdminHomeShell(),
                  ),
                ),
                (_) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    // ✅ Teruskan AuthBloc yang sama
                    value: authBloc,
                    child: const UserMainPage(),
                  ),
                ),
                (_) => false,
              );
            }
          },
          unauthenticated: () {
            final authBloc = context.read<AuthBloc>();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: authBloc,
                  child: const LoginPage(),
                ),
              ),
              (_) => false,
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: _primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.warehouse_outlined,
                  size: 56,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Warehouse',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manajemen Gudang Terpadu',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
