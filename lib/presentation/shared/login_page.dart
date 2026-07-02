// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:warehouse/presentation/admin/admin_dashboard_page.dart';
// // // import 'package:warehouse/presentation/admin/admin_home_shell.dart';
// // // import 'package:warehouse/presentation/bloc/admin/admin_dashboard/admin_dashboard_bloc.dart';
// // // import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
// // // import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';
// // // import 'package:warehouse/presentation/bloc/admin/admin_stock/admin_stock_bloc.dart';
// // // import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// // // import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
// // // import 'package:warehouse/presentation/user/user_dashboard_page.dart';
// // // import 'package:warehouse/presentation/user/user_main_page.dart';
// // // import 'register_page.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage>
// // //     with SingleTickerProviderStateMixin {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _emailC = TextEditingController();
// // //   final _passwordC = TextEditingController();
// // //   bool _obscurePass = true;
// // //   bool _hasNavigated = false; // guard double-navigate

// // //   late AnimationController _animCtrl;
// // //   late Animation<double> _fadeAnim;
// // //   late Animation<Offset> _slideAnim;

// // //   static const _primary = Color(0xFF0288D1);
// // //   static const _primaryDark = Color(0xFF01579B);
// // //   static const _primaryLight = Color(0xFF29B6F6);
// // //   static const _bg = Color(0xFFF0F9FF);

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _animCtrl = AnimationController(
// // //         vsync: this, duration: const Duration(milliseconds: 900));
// // //     _fadeAnim = Tween<double>(begin: 0, end: 1)
// // //         .animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
// // //     _slideAnim = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
// // //         .animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
// // //     _animCtrl.forward();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _animCtrl.dispose();
// // //     _emailC.dispose();
// // //     _passwordC.dispose();
// // //     super.dispose();
// // //   }

// // //   // void _submit() {
// // //   //   if (!_formKey.currentState!.validate()) return;
// // //   //   _hasNavigated = false; // reset setiap kali submit
// // //   //   HapticFeedback.lightImpact();
// // //   //   context.read<AuthBloc>().add(AuthEvent.login(
// // //   //         email: _emailC.text.trim(),
// // //   //         password: _passwordC.text,
// // //   //       ));
// // //   // }

// // // void _submit() {
// // //   if (!_formKey.currentState!.validate()) return;
// // //   _hasNavigated = false;
// // //   HapticFeedback.lightImpact();
// // //   context.read<AuthBloc>().add(AuthEvent.login(
// // //     email: _emailC.text.trim(),
// // //     password: _passwordC.text,
// // //   ));
// // // }

// // // void _navigateByRole(String role) {
// // //     if (_hasNavigated) return;
// // //     _hasNavigated = true;

// // //     final isAdmin = role == 'admin' || role == 'super_admin';

// // //     // ✅ Ambil sebelum Navigator
// // //     final authBloc = context.read<AuthBloc>();

// // //     Navigator.of(context).pushAndRemoveUntil(
// // //       MaterialPageRoute(
// // //         builder: (_) => isAdmin
// // //             ? MultiBlocProvider(
// // //                 providers: [
// // //                   BlocProvider.value(value: authBloc), // ✅ teruskan
// // //                   BlocProvider(create: (_) => AdminDashboardBloc()),
// // //                   BlocProvider(create: (_) => AdminRequestBloc()),
// // //                   BlocProvider(create: (_) => AdminStockBloc()),
// // //                   BlocProvider(create: (_) => AdminWarehouseBloc()),
// // //                   BlocProvider(create: (_) => AdminProductBloc()),
// // //                 ],
// // //                 child: const AdminHomeShell(),
// // //               )
// // //             : BlocProvider.value(
// // //                 value: authBloc, // ✅ teruskan
// // //                 child: const UserMainPage(),
// // //               ),
// // //       ),
// // //       (_) => false,
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final size = MediaQuery.of(context).size;

// // //     return Scaffold(
// // //       backgroundColor: _bg,
// // //       body: BlocConsumer<AuthBloc, AuthState>(
// // //         listener: (context, state) {
// // //           state.maybeWhen(
// // //             authenticated: (user) {
// // //               debugPrint('>>> AUTHENTICATED user.role = "${user.role}"');
// // //               _navigateByRole(user.role);
// // //             },
// // //             error: (msg) {
// // //               _hasNavigated = false;
// // //               ScaffoldMessenger.of(context).showSnackBar(
// // //                 SnackBar(
// // //                   content: Text(msg),
// // //                   backgroundColor: Colors.red[700],
// // //                   behavior: SnackBarBehavior.floating,
// // //                   shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(10)),
// // //                 ),
// // //               );
// // //             },
// // //             orElse: () {},
// // //           );
// // //         },
// // //         builder: (context, state) {
// // //           final isLoading =
// // //               state.maybeWhen(loading: () => true, orElse: () => false);

// // //           return Stack(
// // //             children: [
// // //               Container(
// // //                 height: size.height * 0.38,
// // //                 decoration: const BoxDecoration(
// // //                   gradient: LinearGradient(
// // //                     begin: Alignment.topLeft,
// // //                     end: Alignment.bottomRight,
// // //                     colors: [_primaryDark, _primary, _primaryLight],
// // //                   ),
// // //                   borderRadius: BorderRadius.only(
// // //                     bottomLeft: Radius.circular(40),
// // //                     bottomRight: Radius.circular(40),
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 top: -50,
// // //                 right: -50,
// // //                 child: Container(
// // //                   width: 200,
// // //                   height: 200,
// // //                   decoration: BoxDecoration(
// // //                     shape: BoxShape.circle,
// // //                     color: Colors.white.withOpacity(0.07),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SafeArea(
// // //                 child: FadeTransition(
// // //                   opacity: _fadeAnim,
// // //                   child: SlideTransition(
// // //                     position: _slideAnim,
// // //                     child: SingleChildScrollView(
// // //                       padding: const EdgeInsets.only(bottom: 32),
// // //                       child: Column(
// // //                         children: [
// // //                           const SizedBox(height: 32),
// // //                           Column(
// // //                             children: [
// // //                               Container(
// // //                                 width: 80,
// // //                                 height: 80,
// // //                                 decoration: BoxDecoration(
// // //                                   color: Colors.white,
// // //                                   shape: BoxShape.circle,
// // //                                   boxShadow: [
// // //                                     BoxShadow(
// // //                                       color: Colors.black.withOpacity(0.15),
// // //                                       blurRadius: 20,
// // //                                       offset: const Offset(0, 8),
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                                 child: const Icon(Icons.warehouse_rounded,
// // //                                     size: 44, color: _primary),
// // //                               ),
// // //                               const SizedBox(height: 14),
// // //                               const Text(
// // //                                 'GudangPro',
// // //                                 style: TextStyle(
// // //                                   fontSize: 28,
// // //                                   fontWeight: FontWeight.w800,
// // //                                   color: Colors.white,
// // //                                   letterSpacing: 1.2,
// // //                                 ),
// // //                               ),
// // //                               const SizedBox(height: 4),
// // //                               Text(
// // //                                 'Sistem Manajemen Gudang',
// // //                                 style: TextStyle(
// // //                                   fontSize: 12,
// // //                                   color: Colors.white.withOpacity(0.8),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           const SizedBox(height: 36),
// // //                           Padding(
// // //                             padding: const EdgeInsets.symmetric(horizontal: 24),
// // //                             child: Container(
// // //                               decoration: BoxDecoration(
// // //                                 color: Colors.white,
// // //                                 borderRadius: BorderRadius.circular(28),
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color: _primary.withOpacity(0.12),
// // //                                     blurRadius: 40,
// // //                                     offset: const Offset(0, 16),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               padding: const EdgeInsets.all(28),
// // //                               child: Form(
// // //                                 key: _formKey,
// // //                                 child: Column(
// // //                                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                                   children: [
// // //                                     const Text('Selamat Datang',
// // //                                         style: TextStyle(
// // //                                           fontSize: 22,
// // //                                           fontWeight: FontWeight.w800,
// // //                                           color: _primaryDark,
// // //                                         )),
// // //                                     const SizedBox(height: 4),
// // //                                     Text('Masuk ke akun GudangPro Anda',
// // //                                         style: TextStyle(
// // //                                             fontSize: 13,
// // //                                             color: Colors.grey.shade500)),
// // //                                     const SizedBox(height: 28),
// // //                                     _buildTextField(
// // //                                       controller: _emailC,
// // //                                       label: 'Email',
// // //                                       icon: Icons.email_outlined,
// // //                                       keyboardType: TextInputType.emailAddress,
// // //                                       validator: (v) {
// // //                                         if (v == null || v.trim().isEmpty)
// // //                                           return 'Email wajib diisi';
// // //                                         if (!v.contains('@'))
// // //                                           return 'Format email tidak valid';
// // //                                         return null;
// // //                                       },
// // //                                     ),
// // //                                     const SizedBox(height: 16),
// // //                                     _buildTextField(
// // //                                       controller: _passwordC,
// // //                                       label: 'Password',
// // //                                       icon: Icons.lock_outline,
// // //                                       obscureText: _obscurePass,
// // //                                       suffixIcon: IconButton(
// // //                                         icon: Icon(_obscurePass
// // //                                             ? Icons.visibility_off_outlined
// // //                                             : Icons.visibility_outlined),
// // //                                         onPressed: () => setState(
// // //                                             () => _obscurePass = !_obscurePass),
// // //                                       ),
// // //                                       validator: (v) {
// // //                                         if (v == null || v.isEmpty)
// // //                                           return 'Password wajib diisi';
// // //                                         return null;
// // //                                       },
// // //                                     ),
// // //                                     const SizedBox(height: 28),
// // //                                     SizedBox(
// // //                                       width: double.infinity,
// // //                                       height: 52,
// // //                                       child: ElevatedButton(
// // //                                         onPressed: isLoading ? null : _submit,
// // //                                         style: ElevatedButton.styleFrom(
// // //                                           backgroundColor: _primary,
// // //                                           foregroundColor: Colors.white,
// // //                                           shape: RoundedRectangleBorder(
// // //                                               borderRadius:
// // //                                                   BorderRadius.circular(16)),
// // //                                           elevation: 0,
// // //                                         ),
// // //                                         child: isLoading
// // //                                             ? const SizedBox(
// // //                                                 width: 22,
// // //                                                 height: 22,
// // //                                                 child:
// // //                                                     CircularProgressIndicator(
// // //                                                         color: Colors.white,
// // //                                                         strokeWidth: 2.5))
// // //                                             : const Text('Masuk',
// // //                                                 style: TextStyle(
// // //                                                     fontSize: 16,
// // //                                                     fontWeight:
// // //                                                         FontWeight.w700)),
// // //                                       ),
// // //                                     ),
// // //                                     const SizedBox(height: 20),
// // //                                     Row(
// // //                                       mainAxisAlignment:
// // //                                           MainAxisAlignment.center,
// // //                                       children: [
// // //                                         Text('Belum punya akun? ',
// // //                                             style: TextStyle(
// // //                                                 color: Colors.grey.shade500)),
// // //                                         GestureDetector(
// // //                                           onTap: () => Navigator.push(
// // //                                             context,
// // //                                             MaterialPageRoute(
// // //                                                 builder: (_) =>
// // //                                                     const RegisterPage()),
// // //                                           ),
// // //                                           child: const Text('Daftar',
// // //                                               style: TextStyle(
// // //                                                   color: _primary,
// // //                                                   fontWeight: FontWeight.w700)),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTextField({
// // //     required TextEditingController controller,
// // //     required String label,
// // //     required IconData icon,
// // //     TextInputType keyboardType = TextInputType.text,
// // //     bool obscureText = false,
// // //     Widget? suffixIcon,
// // //     String? Function(String?)? validator,
// // //   }) {
// // //     return TextFormField(
// // //       controller: controller,
// // //       keyboardType: keyboardType,
// // //       obscureText: obscureText,
// // //       validator: validator,
// // //       decoration: InputDecoration(
// // //         labelText: label,
// // //         prefixIcon: Icon(icon, color: const Color(0xFF0288D1)),
// // //         suffixIcon: suffixIcon,
// // //         border: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(14),
// // //           borderSide: BorderSide(color: Colors.grey.shade300),
// // //         ),
// // //         enabledBorder: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(14),
// // //           borderSide: BorderSide(color: Colors.grey.shade300),
// // //         ),
// // //         focusedBorder: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(14),
// // //           borderSide: const BorderSide(color: Color(0xFF0288D1), width: 1.5),
// // //         ),
// // //         errorBorder: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(14),
// // //           borderSide: const BorderSide(color: Colors.red),
// // //         ),
// // //         filled: true,
// // //         fillColor: Colors.grey.shade50,
// // //         contentPadding:
// // //             const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:warehouse/presentation/admin/app_theme.dart';
// // import 'package:warehouse/presentation/bloc/Auth/auth_bloc.dart';
// // import 'register_page.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});
// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
// //   final _formKey     = GlobalKey<FormState>();
// //   final _emailCtrl   = TextEditingController();
// //   final _passCtrl    = TextEditingController();
// //   bool  _obscure     = true;
// //   bool  _remember    = false;
// //   late AnimationController _animCtrl;
// //   late Animation<double>   _fadeAnim;
// //   late Animation<Offset>   _slideAnim;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
// //     _fadeAnim  = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
// //         .drive(Tween(begin: 0.0, end: 1.0));
// //     _slideAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
// //         .drive(Tween(begin: const Offset(0, .18), end: Offset.zero));
// //     _animCtrl.forward();
// //   }

// //   @override
// //   void dispose() { _animCtrl.dispose(); _emailCtrl.dispose(); _passCtrl.dispose(); super.dispose(); }

// //   void _submit() {
// //     if (!_formKey.currentState!.validate()) return;
// //     HapticFeedback.lightImpact();
// //     context.read<AuthBloc>().add(AuthEvent.login(
// //       email: _emailCtrl.text.trim(), password: _passCtrl.text));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       backgroundColor: AppColors.bg,
// //       body: BlocConsumer<AuthBloc, AuthState>(
// //         listener: (ctx, state) => state.maybeWhen(
// //           error: (msg) => ScaffoldMessenger.of(ctx).showSnackBar(
// //             SnackBar(content: Text(msg), backgroundColor: AppColors.danger,
// //               behavior: SnackBarBehavior.floating,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
// //           orElse: () {},
// //         ),
// //         builder: (ctx, state) {
// //           final loading = state.maybeWhen(loading: () => true, orElse: () => false);
// //           return Stack(children: [
// //             // Gradient header
// //             Container(
// //               height: size.height * .38,
// //               decoration: const BoxDecoration(
// //                 gradient: AppTheme.primaryGradient,
// //                 borderRadius: BorderRadius.only(
// //                   bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
// //               ),
// //             ),
// //             Positioned(top: -60, right: -40,
// //               child: Container(width: 200, height: 200,
// //                 decoration: BoxDecoration(shape: BoxShape.circle,
// //                   color: Colors.white.withOpacity(.06)))),
// //             Positioned(top: 80, left: -30,
// //               child: Container(width: 130, height: 130,
// //                 decoration: BoxDecoration(shape: BoxShape.circle,
// //                   color: Colors.white.withOpacity(.04)))),
// //             SafeArea(
// //               child: FadeTransition(opacity: _fadeAnim,
// //                 child: SlideTransition(position: _slideAnim,
// //                   child: SingleChildScrollView(
// //                     padding: const EdgeInsets.only(bottom: 32),
// //                     child: Column(children: [
// //                       const SizedBox(height: 28),
// //                       // ── Logo ────────────────────────────────────
// //                       Column(children: [
// //                         Container(
// //                           width: 76, height: 76,
// //                           decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
// //                             boxShadow: [BoxShadow(color: Colors.black.withOpacity(.14),
// //                               blurRadius: 18, offset: const Offset(0, 8))]),
// //                           child: const Icon(Icons.warehouse_rounded, size: 42, color: AppColors.primary)),
// //                         const SizedBox(height: 12),
// //                         const Text('GudangPro', style: TextStyle(fontSize: 27,
// //                           fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 1.1)),
// //                         const SizedBox(height: 3),
// //                         Text('Sistem Manajemen Gudang', style: TextStyle(
// //                           fontSize: 12, color: Colors.white.withOpacity(.8))),
// //                       ]),
// //                       const SizedBox(height: 30),

// //                       // ── Form card ────────────────────────────────
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 22),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             color: Colors.white, borderRadius: BorderRadius.circular(24),
// //                             boxShadow: [
// //                               BoxShadow(color: AppColors.primary.withOpacity(.12),
// //                                 blurRadius: 36, offset: const Offset(0, 14)),
// //                               BoxShadow(color: Colors.black.withOpacity(.04),
// //                                 blurRadius: 16, offset: const Offset(0, 4)),
// //                             ]),
// //                           padding: const EdgeInsets.all(24),
// //                           child: Form(key: _formKey, child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               const Text('Selamat Datang', style: TextStyle(
// //                                 fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.text)),
// //                               const SizedBox(height: 2),
// //                               Text('Masuk ke akun GudangPro Anda',
// //                                 style: TextStyle(fontSize: 12.5, color: Colors.grey.shade500)),
// //                               const SizedBox(height: 22),

// //                               // Email
// //                               _buildField(ctrl: _emailCtrl, label: 'Email',
// //                                 icon: Icons.email_outlined,
// //                                 keyboardType: TextInputType.emailAddress,
// //                                 validator: (v) {
// //                                   if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
// //                                   if (!v.contains('@')) return 'Format email tidak valid';
// //                                   return null;
// //                                 }),
// //                               const SizedBox(height: 14),

// //                               // Password
// //                               _buildField(ctrl: _passCtrl, label: 'Kata Sandi',
// //                                 icon: Icons.lock_outline, obscure: _obscure,
// //                                 suffix: IconButton(
// //                                   icon: Icon(_obscure ? Icons.visibility_off_outlined
// //                                       : Icons.visibility_outlined, size: 20,
// //                                       color: Colors.grey.shade400),
// //                                   onPressed: () => setState(() => _obscure = !_obscure)),
// //                                 validator: (v) {
// //                                   if (v == null || v.isEmpty) return 'Kata sandi wajib diisi';
// //                                   return null;
// //                                 }),
// //                               const SizedBox(height: 10),

// //                               // Remember me
// //                               Row(children: [
// //                                 SizedBox(width: 20, height: 20,
// //                                   child: Checkbox(value: _remember, activeColor: AppColors.primary,
// //                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
// //                                     onChanged: (v) => setState(() => _remember = v!))),
// //                                 const SizedBox(width: 8),
// //                                 Text('Ingat Saya', style: TextStyle(
// //                                   fontSize: 12.5, color: Colors.grey.shade600)),
// //                                 const Spacer(),
// //                                 GestureDetector(onTap: () {},
// //                                   child: const Text('Lupa Kata Sandi?', style: TextStyle(
// //                                     fontSize: 12.5, color: AppColors.primary,
// //                                     fontWeight: FontWeight.w600))),
// //                               ]),
// //                               const SizedBox(height: 22),

// //                               // Submit
// //                               SizedBox(width: double.infinity, height: 50,
// //                                 child: ElevatedButton(
// //                                   onPressed: loading ? null : _submit,
// //                                   child: loading
// //                                       ? const SizedBox(width: 22, height: 22,
// //                                           child: CircularProgressIndicator(
// //                                             color: Colors.white, strokeWidth: 2.5))
// //                                       : const Text('Masuk', style: TextStyle(
// //                                           fontSize: 16, fontWeight: FontWeight.w700)))),
// //                               const SizedBox(height: 16),

// //                               // Register link
// //                               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
// //                                 Text('Belum punya akun? ',
// //                                   style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
// //                                 GestureDetector(
// //                                   onTap: () => Navigator.push(context,
// //                                     MaterialPageRoute(builder: (_) => const RegisterPage())),
// //                                   child: const Text('Daftar', style: TextStyle(
// //                                     color: AppColors.primary, fontWeight: FontWeight.w700,
// //                                     fontSize: 13))),
// //                               ]),
// //                             ],
// //                           )),
// //                         ),
// //                       ),
// //                     ]),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ]);
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildField({
// //     required TextEditingController ctrl,
// //     required String label,
// //     required IconData icon,
// //     TextInputType keyboardType = TextInputType.text,
// //     bool obscure = false,
// //     Widget? suffix,
// //     String? Function(String?)? validator,
// //   }) {
// //     return TextFormField(
// //       controller: ctrl,
// //       keyboardType: keyboardType,
// //       obscureText: obscure,
// //       validator: validator,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
// //         suffixIcon: suffix,
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
// import 'register_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   bool _obscure = true;
//   bool _remember = false;
//   bool _loading = false;

//   late AnimationController _animCtrl;
//   late Animation<double> _fadeAnim;
//   late Animation<Offset> _slideAnim;

//   @override
//   void initState() {
//     super.initState();
//     _animCtrl = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 800));
//     _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
//         .drive(Tween(begin: 0.0, end: 1.0));
//     _slideAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
//         .drive(Tween(begin: const Offset(0, .18), end: Offset.zero));
//     _animCtrl.forward();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (!mounted) return;
//       context.read<AuthBloc>().stream.listen((state) {
//         if (!mounted) return;
//         state.maybeWhen(
//           loading: () => setState(() => _loading = true),
//           error: (msg) {
//             setState(() => _loading = false);
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(msg),
//               backgroundColor: AppColors.danger,
//               behavior: SnackBarBehavior.floating,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//             ));
//           },
//           orElse: () => setState(() => _loading = false),
//         );
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _animCtrl.dispose();
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (!_formKey.currentState!.validate()) return;
//     HapticFeedback.lightImpact();
//     context.read<AuthBloc>().add(AuthEvent.login(
//           email: _emailCtrl.text.trim(),
//           password: _passCtrl.text,
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.bg,
//       body: Stack(children: [
//         Container(
//           height: size.height * .38,
//           decoration: const BoxDecoration(
//             gradient: AppTheme.primaryGradient,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(40),
//               bottomRight: Radius.circular(40),
//             ),
//           ),
//         ),
//         Positioned(
//           top: -60,
//           right: -40,
//           child: Container(
//             width: 200,
//             height: 200,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white.withOpacity(.06),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 80,
//           left: -30,
//           child: Container(
//             width: 130,
//             height: 130,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white.withOpacity(.04),
//             ),
//           ),
//         ),
//         SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnim,
//             child: SlideTransition(
//               position: _slideAnim,
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.only(bottom: 32),
//                 child: Column(children: [
//                   const SizedBox(height: 28),
//                   Column(children: [
//                     Container(
//                       width: 76,
//                       height: 76,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(.14),
//                             blurRadius: 18,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//                       child: const Icon(Icons.warehouse_rounded,
//                           size: 42, color: AppColors.primary),
//                     ),
//                     const SizedBox(height: 12),
//                     const Text('GudangPro',
//                         style: TextStyle(
//                             fontSize: 27,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white,
//                             letterSpacing: 1.1)),
//                     const SizedBox(height: 3),
//                     Text('Sistem Manajemen Gudang',
//                         style: TextStyle(
//                             fontSize: 12, color: Colors.white.withOpacity(.8))),
//                   ]),
//                   const SizedBox(height: 30),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 22),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(24),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.primary.withOpacity(.12),
//                             blurRadius: 36,
//                             offset: const Offset(0, 14),
//                           ),
//                           BoxShadow(
//                             color: Colors.black.withOpacity(.04),
//                             blurRadius: 16,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       padding: const EdgeInsets.all(24),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('Selamat Datang',
//                                 style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w800,
//                                     color: AppColors.text)),
//                             const SizedBox(height: 2),
//                             Text('Masuk ke akun GudangPro Anda',
//                                 style: TextStyle(
//                                     fontSize: 12.5,
//                                     color: Colors.grey.shade500)),
//                             const SizedBox(height: 22),
//                             _buildField(
//                               ctrl: _emailCtrl,
//                               label: 'Email',
//                               icon: Icons.email_outlined,
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (v) {
//                                 if (v == null || v.trim().isEmpty)
//                                   return 'Email wajib diisi';
//                                 if (!v.contains('@'))
//                                   return 'Format email tidak valid';
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 14),
//                             _buildField(
//                               ctrl: _passCtrl,
//                               label: 'Kata Sandi',
//                               icon: Icons.lock_outline,
//                               obscure: _obscure,
//                               suffix: IconButton(
//                                 icon: Icon(
//                                   _obscure
//                                       ? Icons.visibility_off_outlined
//                                       : Icons.visibility_outlined,
//                                   size: 20,
//                                   color: Colors.grey.shade400,
//                                 ),
//                                 onPressed: () =>
//                                     setState(() => _obscure = !_obscure),
//                               ),
//                               validator: (v) {
//                                 if (v == null || v.isEmpty)
//                                   return 'Kata sandi wajib diisi';
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 10),
//                             Row(children: [
//                               SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: Checkbox(
//                                   value: _remember,
//                                   activeColor: AppColors.primary,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(4)),
//                                   onChanged: (v) =>
//                                       setState(() => _remember = v!),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Text('Ingat Saya',
//                                   style: TextStyle(
//                                       fontSize: 12.5,
//                                       color: Colors.grey.shade600)),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: const Text('Lupa Kata Sandi?',
//                                     style: TextStyle(
//                                         fontSize: 12.5,
//                                         color: AppColors.primary,
//                                         fontWeight: FontWeight.w600)),
//                               ),
//                             ]),
//                             const SizedBox(height: 22),
//                             SizedBox(
//                               width: double.infinity,
//                               height: 50,
//                               child: ElevatedButton(
//                                 onPressed: _loading ? null : _submit,
//                                 child: _loading
//                                     ? const SizedBox(
//                                         width: 22,
//                                         height: 22,
//                                         child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                             strokeWidth: 2.5))
//                                     : const Text('Masuk',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w700)),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('Belum punya akun? ',
//                                     style: TextStyle(
//                                         color: Colors.grey.shade500,
//                                         fontSize: 13)),
//                                 GestureDetector(
//                                   onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => const RegisterPage()),
//                                   ),
//                                   child: const Text('Daftar',
//                                       style: TextStyle(
//                                           color: AppColors.primary,
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 13)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget _buildField({
//     required TextEditingController ctrl,
//     required String label,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     bool obscure = false,
//     Widget? suffix,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: ctrl,
//       keyboardType: keyboardType,
//       obscureText: obscure,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
//         suffixIcon: suffix,
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _remember = false;

  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
        .drive(Tween(begin: 0.0, end: 1.0));
    _slideAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut)
        .drive(Tween(begin: const Offset(0, .18), end: Offset.zero));
    _animCtrl.forward();
    // ✅ Tidak ada stream.listen manual — cukup BlocConsumer di build()
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    HapticFeedback.lightImpact();
    context.read<AuthBloc>().add(AuthEvent.login(
          email: _emailCtrl.text.trim(),
          password: _passCtrl.text,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bg,
      // ✅ BlocConsumer: listener untuk navigasi, builder untuk UI
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(msg),
                backgroundColor: AppColors.danger,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ));
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          // ✅ Loading dari BlocBuilder, bukan state lokal
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Stack(children: [
            Container(
              height: size.height * .38,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Positioned(
              top: -60,
              right: -40,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.06),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: -30,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.04),
                ),
              ),
            ),
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(children: [
                      const SizedBox(height: 28),
                      // Logo
                      Column(children: [
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.14),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.warehouse_rounded,
                              size: 42, color: AppColors.primary),
                        ),
                        const SizedBox(height: 12),
                        const Text('GudangPro',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 1.1)),
                        const SizedBox(height: 3),
                        Text('Sistem Manajemen Gudang',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(.8))),
                      ]),
                      const SizedBox(height: 30),

                      // Form card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(.12),
                                blurRadius: 36,
                                offset: const Offset(0, 14),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(.04),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Selamat Datang',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.text)),
                                const SizedBox(height: 2),
                                Text('Masuk ke akun GudangPro Anda',
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        color: Colors.grey.shade500)),
                                const SizedBox(height: 22),

                                // Email
                                _buildField(
                                  ctrl: _emailCtrl,
                                  label: 'Email',
                                  icon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty)
                                      return 'Email wajib diisi';
                                    if (!v.contains('@'))
                                      return 'Format email tidak valid';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 14),

                                // Password
                                _buildField(
                                  ctrl: _passCtrl,
                                  label: 'Kata Sandi',
                                  icon: Icons.lock_outline,
                                  obscure: _obscure,
                                  suffix: IconButton(
                                    icon: Icon(
                                      _obscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: 20,
                                      color: Colors.grey.shade400,
                                    ),
                                    onPressed: () =>
                                        setState(() => _obscure = !_obscure),
                                  ),
                                  validator: (v) {
                                    if (v == null || v.isEmpty)
                                      return 'Kata sandi wajib diisi';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),

                                // Remember me
                                Row(children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                      value: _remember,
                                      activeColor: AppColors.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      onChanged: (v) =>
                                          setState(() => _remember = v!),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('Ingat Saya',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          color: Colors.grey.shade600)),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text('Lupa Kata Sandi?',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ]),
                                const SizedBox(height: 22),

                                // Submit button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: isLoading ? null : _submit,
                                    child: isLoading
                                        ? const SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2.5))
                                        : const Text('Masuk',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Register link
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Belum punya akun? ',
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 13)),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const RegisterPage()),
                                      ),
                                      child: const Text('Daftar',
                                          style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  Widget _buildField({
    required TextEditingController ctrl,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
        suffixIcon: suffix,
      ),
    );
  }
}
