// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/presentation/bloc/auth/auth_bloc.dart';
// import 'package:warehouse/presentation/user/user_dashboard_page.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameC = TextEditingController();
//   final _emailC = TextEditingController();
//   final _passwordC = TextEditingController();
//   final _confirmPasswordC = TextEditingController();
//   bool _obscurePass = true;
//   bool _obscureConfirm = true;

//   static const _primary = Color(0xFF0288D1);
//   static const _primaryDark = Color(0xFF01579B);
//   static const _bg = Color(0xFFF0F9FF);

//   @override
//   void dispose() {
//     _nameC.dispose();
//     _emailC.dispose();
//     _passwordC.dispose();
//     _confirmPasswordC.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (!_formKey.currentState!.validate()) return;
//     HapticFeedback.lightImpact();
//     context.read<AuthBloc>().add(AuthEvent.register(
//           name: _nameC.text.trim(),
//           email: _emailC.text.trim(),
//           password: _passwordC.text,
//           passwordConfirmation: _confirmPasswordC.text,
//         ));
//   }

//   // ✅ Tidak perlu wrap BlocProvider.value — MultiBlocProvider sudah global
//   void _navigateToHome() {
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (_) => const UserDashboardPage()),
//       (_) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _bg,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: _primary),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             authenticated: (_) => _navigateToHome(),
//             error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(msg),
//                 backgroundColor: Colors.red[700],
//                 behavior: SnackBarBehavior.floating,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//             orElse: () {},
//           );
//         },
//         builder: (context, state) {
//           final isLoading =
//               state.maybeWhen(loading: () => true, orElse: () => false);

//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 8),
//                 const Text('Buat Akun',
//                     style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: _primaryDark)),
//                 const SizedBox(height: 6),
//                 Text('Daftar sekarang, gratis!',
//                     style: TextStyle(color: Colors.grey.shade500)),
//                 const SizedBox(height: 32),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(24),
//                     boxShadow: [
//                       BoxShadow(
//                           color: _primary.withOpacity(0.1),
//                           blurRadius: 32,
//                           offset: const Offset(0, 12)),
//                     ],
//                   ),
//                   padding: const EdgeInsets.all(24),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         _buildField(
//                           controller: _nameC,
//                           label: 'Nama Lengkap',
//                           icon: Icons.person_outline,
//                           textCapitalization: TextCapitalization.words,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty)
//                               return 'Nama wajib diisi';
//                             if (v.trim().length < 3)
//                               return 'Nama minimal 3 karakter';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 14),
//                         _buildField(
//                           controller: _emailC,
//                           label: 'Email',
//                           icon: Icons.email_outlined,
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty)
//                               return 'Email wajib diisi';
//                             if (!v.contains('@'))
//                               return 'Format email tidak valid';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 14),
//                         _buildField(
//                           controller: _passwordC,
//                           label: 'Password',
//                           icon: Icons.lock_outline,
//                           obscureText: _obscurePass,
//                           suffixIcon: IconButton(
//                             icon: Icon(_obscurePass
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined),
//                             onPressed: () =>
//                                 setState(() => _obscurePass = !_obscurePass),
//                           ),
//                           validator: (v) {
//                             if (v == null || v.isEmpty)
//                               return 'Password wajib diisi';
//                             if (v.length < 8)
//                               return 'Password minimal 8 karakter';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 14),
//                         _buildField(
//                           controller: _confirmPasswordC,
//                           label: 'Konfirmasi Password',
//                           icon: Icons.lock_outline,
//                           obscureText: _obscureConfirm,
//                           suffixIcon: IconButton(
//                             icon: Icon(_obscureConfirm
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined),
//                             onPressed: () => setState(
//                                 () => _obscureConfirm = !_obscureConfirm),
//                           ),
//                           validator: (v) {
//                             if (v == null || v.isEmpty)
//                               return 'Konfirmasi password wajib diisi';
//                             if (v != _passwordC.text)
//                               return 'Password tidak cocok';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 24),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//                           child: ElevatedButton(
//                             onPressed: isLoading ? null : _submit,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: _primary,
//                               foregroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16)),
//                               elevation: 0,
//                             ),
//                             child: isLoading
//                                 ? const SizedBox(
//                                     width: 22,
//                                     height: 22,
//                                     child: CircularProgressIndicator(
//                                         color: Colors.white,
//                                         strokeWidth: 2.5))
//                                 : const Text('Daftar',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w700)),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Sudah punya akun? ',
//                                 style:
//                                     TextStyle(color: Colors.grey.shade500)),
//                             GestureDetector(
//                               onTap: () => Navigator.pop(context),
//                               child: const Text('Masuk',
//                                   style: TextStyle(
//                                       color: _primary,
//                                       fontWeight: FontWeight.w700)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     TextCapitalization textCapitalization = TextCapitalization.none,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       textCapitalization: textCapitalization,
//       obscureText: obscureText,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: _primary),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: BorderSide(color: Colors.grey.shade300)),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: BorderSide(color: Colors.grey.shade300)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: const BorderSide(color: _primary, width: 1.5)),
//         filled: true,
//         fillColor: Colors.grey.shade50,
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/Auth/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey  = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl= TextEditingController();
  final _passCtrl = TextEditingController();
  final _confCtrl = TextEditingController();
  bool _obscureP  = true;
  bool _obscureC  = true;

  @override
  void dispose() {
    _nameCtrl.dispose(); _emailCtrl.dispose();
    _passCtrl.dispose(); _confCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(AuthEvent.register(
      name: _nameCtrl.text.trim(), email: _emailCtrl.text.trim(),
      password: _passCtrl.text, passwordConfirmation: _confCtrl.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent, elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (ctx, state) => state.maybeWhen(
          error: (msg) => ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: AppColors.danger,
              behavior: SnackBarBehavior.floating)),
          orElse: () {},
        ),
        builder: (ctx, state) {
          final loading = state.maybeWhen(loading: () => true, orElse: () => false);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Buat Akun', style: TextStyle(fontSize: 26,
                fontWeight: FontWeight.w800, color: AppColors.text)),
              const SizedBox(height: 4),
              Text('Daftar dan mulai kelola gudang',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              const SizedBox(height: 28),

              Container(
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(.1),
                    blurRadius: 28, offset: const Offset(0, 10))]),
                padding: const EdgeInsets.all(22),
                child: Form(key: _formKey, child: Column(children: [
                  _field(_nameCtrl, 'Nama Lengkap', Icons.person_outline,
                    capitalize: TextCapitalization.words,
                    validator: (v) => v!.trim().length < 3 ? 'Minimal 3 karakter' : null),
                  const SizedBox(height: 12),
                  _field(_emailCtrl, 'Email', Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => !v!.contains('@') ? 'Email tidak valid' : null),
                  const SizedBox(height: 12),
                  _passField(_passCtrl, 'Password', _obscureP, () =>
                    setState(() => _obscureP = !_obscureP),
                    validator: (v) => v!.length < 8 ? 'Minimal 8 karakter' : null),
                  const SizedBox(height: 12),
                  _passField(_confCtrl, 'Konfirmasi Password', _obscureC, () =>
                    setState(() => _obscureC = !_obscureC),
                    validator: (v) => v != _passCtrl.text ? 'Password tidak cocok' : null),
                  const SizedBox(height: 22),
                  SizedBox(width: double.infinity, height: 50,
                    child: ElevatedButton(
                      onPressed: loading ? null : _submit,
                      child: loading
                          ? const SizedBox(width: 22, height: 22,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                          : const Text('Daftar', style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w700)))),
                  const SizedBox(height: 14),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Sudah punya akun? ', style: TextStyle(color: Colors.grey.shade500)),
                    GestureDetector(onTap: () => Navigator.pop(context),
                      child: const Text('Masuk', style: TextStyle(color: AppColors.primary,
                        fontWeight: FontWeight.w700))),
                  ]),
                ])),
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, IconData icon,
      {TextInputType keyboardType = TextInputType.text,
       TextCapitalization capitalize = TextCapitalization.none,
       String? Function(String?)? validator}) {
    return TextFormField(
      controller: ctrl, keyboardType: keyboardType,
      textCapitalization: capitalize, validator: validator,
      decoration: InputDecoration(labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20)));
  }

  Widget _passField(TextEditingController ctrl, String label, bool obscure,
      VoidCallback toggle, {String? Function(String?)? validator}) {
    return TextFormField(
      controller: ctrl, obscureText: obscure, validator: validator,
      decoration: InputDecoration(labelText: label,
        prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary, size: 20),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            size: 20, color: Colors.grey.shade400),
          onPressed: toggle)));
  }
}