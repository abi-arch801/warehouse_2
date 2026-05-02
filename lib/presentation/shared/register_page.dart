import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';

class RegisterPage extends StatefulWidget {
  final AppRole role;
  const RegisterPage({super.key, required this.role});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _agreeToTerms = false;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  String? _selectedRole;
  final List<Map<String, String>> _roles = [
    {'value': 'user', 'label': 'User'},
    {'value': 'admin', 'label': 'Admin'},
    {'value': 'super_admin', 'label': 'Super Admin'},
  ];

  static const _primary = Color(0xFF0288D1);
  static const _primaryDark = Color(0xFF0277BD);
  static const _primaryLight = Color(0xFF29B6F6);
  static const _background = Color(0xFFF0F9FF);

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.role == AppRole.superAdmin
        ? 'super_admin'
        : widget.role == AppRole.admin
            ? 'admin'
            : 'user';

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
    _namaController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Harap setujui syarat dan ketentuan'),
          backgroundColor: const Color(0xFFFF5252),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      HapticFeedback.lightImpact();
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Text('Akun berhasil dibuat!',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            backgroundColor: _primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(16),
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _background,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.26,
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
            top: -60,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
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
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      // Back button row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.selectionClick();
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildHeader(),

                      const SizedBox(height: 24),

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
                                  'Buat Akun Baru',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF01579B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Isi data berikut untuk mendaftar',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                _buildInputLabel('Nama Lengkap'),
                                const SizedBox(height: 8),
                                _buildTextField(
                                  controller: _namaController,
                                  hint: 'Masukkan nama lengkap',
                                  icon: Icons.person_outline_rounded,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Nama tidak boleh kosong';
                                    }
                                    if (val.length < 3) {
                                      return 'Nama minimal 3 karakter';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 18),

                                _buildInputLabel('Alamat Email'),
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
                                    if (!val.contains('@') ||
                                        !val.contains('.')) {
                                      return 'Format email tidak valid';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 18),

                                _buildInputLabel('Username'),
                                const SizedBox(height: 8),
                                _buildTextField(
                                  controller: _usernameController,
                                  hint: 'Buat username unik',
                                  icon: Icons.alternate_email_rounded,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Username tidak boleh kosong';
                                    }
                                    if (val.length < 4) {
                                      return 'Username minimal 4 karakter';
                                    }
                                    if (val.contains(' ')) {
                                      return 'Username tidak boleh mengandung spasi';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 18),

                                _buildInputLabel('Peran / Role'),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: _selectedRole,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: _primary,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.badge_outlined,
                                      color: _primary,
                                      size: 20,
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
                                          color: Color(0xFFFF5252), width: 1.5),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                  ),
                                  items: _roles.map((r) {
                                    return DropdownMenuItem(
                                      value: r['value'],
                                      child: Text(
                                        r['label']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF1A237E),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) =>
                                      setState(() => _selectedRole = val),
                                  validator: (val) {
                                    if (val == null) {
                                      return 'Harap pilih peran';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 18),

                                _buildInputLabel('Kata Sandi'),
                                const SizedBox(height: 8),
                                _buildPasswordField(
                                  controller: _passwordController,
                                  hint: '••••••••',
                                  isVisible: _isPasswordVisible,
                                  onToggle: () => setState(() =>
                                      _isPasswordVisible = !_isPasswordVisible),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Kata sandi tidak boleh kosong';
                                    }
                                    if (val.length < 8) {
                                      return 'Minimal 8 karakter';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 8),
                                _buildPasswordStrength(
                                    _passwordController.text),
                                const SizedBox(height: 18),

                                _buildInputLabel('Konfirmasi Kata Sandi'),
                                const SizedBox(height: 8),
                                _buildPasswordField(
                                  controller: _confirmPasswordController,
                                  hint: '••••••••',
                                  isVisible: _isConfirmPasswordVisible,
                                  onToggle: () => setState(() =>
                                      _isConfirmPasswordVisible =
                                          !_isConfirmPasswordVisible),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Harap konfirmasi kata sandi';
                                    }
                                    if (val != _passwordController.text) {
                                      return 'Kata sandi tidak cocok';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: Checkbox(
                                        value: _agreeToTerms,
                                        onChanged: (val) => setState(
                                            () => _agreeToTerms = val!),
                                        activeColor: _primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        side: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Saya menyetujui ',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade500,
                                          ),
                                          children: const [
                                            TextSpan(
                                              text: 'Syarat & Ketentuan',
                                              style: TextStyle(
                                                color: _primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: ' dan '),
                                            TextSpan(
                                              text: 'Kebijakan Privasi',
                                              style: TextStyle(
                                                color: _primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: ' GudangPro'),
                                          ],
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
                                        _isLoading ? null : _handleRegister,
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
                                              Icon(Icons.person_add_rounded,
                                                  size: 20),
                                              SizedBox(width: 10),
                                              Text(
                                                'Daftar Sekarang',
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

                                Center(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Sudah punya akun? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade500,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'Masuk Sekarang',
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

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.person_add_rounded, size: 36, color: _primary),
        ),
        const SizedBox(height: 12),
        const Text(
          'Buat Akun',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Bergabung dengan GudangPro',
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withOpacity(0.8),
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
        color: Color(0xFF0277BD),
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
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        prefixIcon: Icon(icon, color: _primary, size: 20),
        filled: true,
        fillColor: _background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              BorderSide(color: _primaryLight.withOpacity(0.2), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      style: const TextStyle(fontSize: 15, color: Color(0xFF1A237E)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Colors.grey.shade400, fontSize: 14, letterSpacing: 3),
        prefixIcon:
            const Icon(Icons.lock_outline, color: _primary, size: 20),
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off_outlined,
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
          borderSide:
              BorderSide(color: _primaryLight.withOpacity(0.2), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      onChanged: (_) => setState(() {}),
      validator: validator,
    );
  }

  Widget _buildPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) strength++;

    final labels = ['', 'Lemah', 'Cukup', 'Kuat', 'Sangat Kuat'];
    final colors = [
      Colors.grey.shade200,
      const Color(0xFFFF5252),
      const Color(0xFFFFB300),
      const Color(0xFF00BFA5),
      const Color(0xFF00897B),
    ];

    if (password.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(4, (i) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.only(right: i < 3 ? 4 : 0),
                height: 4,
                decoration: BoxDecoration(
                  color: i < strength
                      ? colors[strength]
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 4),
        Text(
          strength > 0 ? 'Keamanan: ${labels[strength]}' : '',
          style: TextStyle(
            fontSize: 11,
            color: strength > 0 ? colors[strength] : Colors.transparent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
