import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/screen/dashboard_pages.dart' hide DashboardScreen;
import 'package:warehouse/presentation/user/pages/dashboard_pages.dart';
import '../../main.dart';
// Admin imports
import '../admin/pages/data/mock_data.dart';
import '../admin/pages/data/models/models.dart';
import '../admin/pages/screen/home_pages.dart';
// User import


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _rememberMe = false;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  static const _primary = Color(0xFF0288D1);
  static const _primaryDark = Color(0xFF0277BD);
  static const _primaryLight = Color(0xFF29B6F6);
  static const _background = Color(0xFFF0F9FF);

  /// Tentukan role berdasarkan email
  AppRole _detectRole(String email) {
    final trimmed = email.trim().toLowerCase();
    if (trimmed == 'super@warehouse.id') return AppRole.superAdmin;
    if (trimmed == 'admin@warehouse.id') return AppRole.admin;
    return AppRole.user;
  }

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    HapticFeedback.lightImpact();
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() => _isLoading = false);

    final role = _detectRole(_emailController.text);

    if (role == AppRole.user) {
      Navigator.of(context).pushAndRemoveUntil(
        _fadeRoute(const DashboardScreen()),
        (route) => false,
      );
    } else {
      final users = MockDB.instance.users;
      AppUser user;
      if (role == AppRole.superAdmin) {
        user = users.firstWhere(
          (u) => u.role == UserRole.superAdmin,
          orElse: () => users.first,
        );
      } else {
        user = users.firstWhere(
          (u) =>
              u.role == UserRole.admin &&
              u.email == _emailController.text.trim(),
          orElse: () =>
              users.firstWhere((u) => u.role == UserRole.admin,
                  orElse: () => users.first),
        );
      }
      Navigator.of(context).pushAndRemoveUntil(
        _fadeRoute(HomeShell(currentUser: user)),
        (route) => false,
      );
    }
  }

  static PageRoute _fadeRoute(Widget page) => PageRouteBuilder(
        pageBuilder: (_, a, __) => FadeTransition(opacity: a, child: page),
        transitionDuration: const Duration(milliseconds: 400),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _background,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.38,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_primaryDark, _primary, _primaryLight],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
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
                  child: Column(
                    children: [
                      const SizedBox(height: 24),

                      _buildHeader(),

                      const SizedBox(height: 28),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: _primary.withOpacity(0.12),
                                blurRadius: 40,
                                offset: const Offset(0, 16),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(28),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Selamat Datang',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF01579B),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Masuk ke akun GudangPro Anda',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 28),

                                _buildInputLabel('Email / Username'),
                                const SizedBox(height: 8),
                                _buildTextField(
                                  controller: _emailController,
                                  hint: 'contoh@email.com',
                                  icon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Email tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),

                                _buildInputLabel('Kata Sandi'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  style: const TextStyle(
                                      fontSize: 15, color: Color(0xFF1A237E)),
                                  decoration: InputDecoration(
                                    hintText: '••••••••',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      letterSpacing: 3,
                                    ),
                                    prefixIcon: Icon(Icons.lock_outline,
                                        color: _primary, size: 20),
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(() =>
                                          _isPasswordVisible =
                                              !_isPasswordVisible),
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off_outlined,
                                        color: Colors.grey.shade400,
                                        size: 20,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: _background,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                        color: _primaryLight.withOpacity(0.2),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                          color: _primary, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFF5252),
                                          width: 1.5),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFF5252), width: 2),
                                    ),
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Kata sandi tidak boleh kosong';
                                    }
                                    if (val.length < 4) {
                                      return 'Minimal 4 karakter';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: Checkbox(
                                            value: _rememberMe,
                                            onChanged: (val) => setState(
                                                () => _rememberMe = val!),
                                            activeColor: _primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 1.5),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Ingat Saya',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        'Lupa Kata Sandi?',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: _primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 28),

                                SizedBox(
                                  width: double.infinity,
                                  height: 54,
                                  child: ElevatedButton(
                                    onPressed:
                                        _isLoading ? null : _handleLogin,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _primary,
                                      foregroundColor: Colors.white,
                                      disabledBackgroundColor:
                                          _primary.withOpacity(0.6),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16),
                                      ),
                                    ).copyWith(
                                      elevation:
                                          WidgetStateProperty.resolveWith(
                                        (states) => states
                                                .contains(WidgetState.pressed)
                                            ? 2
                                            : 8,
                                      ),
                                    ),
                                    child: _isLoading
                                        ? const SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2.5,
                                            ),
                                          )
                                        : const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.login_rounded,
                                                  size: 20),
                                              SizedBox(width: 10),
                                              Text(
                                                'Masuk',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                          color: Colors.grey.shade200,
                                          thickness: 1.5),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Text(
                                        'atau',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                          color: Colors.grey.shade200,
                                          thickness: 1.5),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                Center(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/register',
                                      arguments: AppRole.user,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Belum punya akun? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade500,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'Daftar Sekarang',
                                            style: TextStyle(
                                              color: _primary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Demo credentials hint
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: _primary.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: _primary.withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.info_outline_rounded,
                                              size: 14, color: _primary),
                                          const SizedBox(width: 6),
                                          const Text(
                                            'Akun Demo',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: _primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      _demoHint(Icons.person_rounded,
                                          'User', 'user@warehouse.id'),
                                      _demoHint(Icons.manage_accounts_rounded,
                                          'Admin', 'admin@warehouse.id'),
                                      _demoHint(Icons.shield_rounded,
                                          'Super Admin',
                                          'super@warehouse.id'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _demoHint(IconData icon, String role, String email) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _emailController.text = email;
            _passwordController.text = 'password';
          });
        },
        child: Row(
          children: [
            Icon(icon, size: 12, color: Colors.grey.shade500),
            const SizedBox(width: 6),
            Text(
              '$role: ',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
            const Spacer(),
            Text(
              'Isi otomatis',
              style: TextStyle(
                fontSize: 10,
                color: _primary.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.warehouse_rounded,
            size: 44,
            color: _primary,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'GudangPro',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Sistem Manajemen Gudang Terintegrasi',
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withOpacity(0.85),
          ),
        ),
      ],
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF01579B),
        letterSpacing: 0.3,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 15, color: Color(0xFF1A237E)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        prefixIcon: Icon(icon, color: _primary, size: 20),
        filled: true,
        fillColor: _background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: _primaryLight.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFF5252),
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFF5252),
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      validator: validator,
    );
  }
}
