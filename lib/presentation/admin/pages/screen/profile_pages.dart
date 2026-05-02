import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/about_us_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/finance_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/master_data_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/role_request_pages.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';
import 'package:warehouse/presentation/shared/login_page.dart';

class ProfileScreen extends StatefulWidget {
  final AppUser currentUser;
  const ProfileScreen({super.key, required this.currentUser});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notif = true;
  bool _darkPref = false;

  Future<bool> _confirmLogout() async {
    final v = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Keluar dari aplikasi?'),
        content: const Text(
            'Anda perlu masuk lagi untuk mengakses dashboard warehouse.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    return v ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final wh = widget.currentUser.warehouseId != null
        ? MockDB.instance.warehouseById(widget.currentUser.warehouseId!)
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white.withValues(alpha: 0.25),
                  child: Text(
                    widget.currentUser.name.substring(0, 1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(widget.currentUser.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
                const SizedBox(height: 4),
                Text(widget.currentUser.email,
                    style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.currentUser.role.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (wh != null) ...[
                  const SizedBox(height: 8),
                  Text('${wh.code} · ${wh.name}',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 12.5)),
                ],
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text('MANAJEMEN',
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700)),
          ),
          _menuTile(
            Icons.dataset_rounded,
            AppColors.primary,
            'Master Data',
            'Kelola user, gudang, supplier, kategori, produk',
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      MasterDataHub(currentUser: widget.currentUser),
                ),
              );
            },
          ),
          _menuTile(
            Icons.sync_alt_rounded,
            AppColors.success,
            'Sinkron Keuangan',
            'Pantau jurnal otomatis ke modul finance',
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      FinanceSyncScreen(currentUser: widget.currentUser),
                ),
              );
            },
          ),
          _menuTile(
            Icons.admin_panel_settings_rounded,
            AppColors.warning,
            'Pengajuan Role',
            'Permintaan akses admin gudang',
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RoleRequestScreen(currentUser: widget.currentUser),
                ),
              );
            },
          ),
          _switchTile(
            Icons.notifications_active_rounded,
            AppColors.warning,
            'Notifikasi',
            'Terima notifikasi alur warehouse',
            _notif,
            (v) => setState(() => _notif = v),
          ),
          _switchTile(
            Icons.dark_mode_rounded,
            AppColors.info,
            'Mode Gelap',
            'Aktifkan tampilan gelap (segera hadir)',
            _darkPref,
            (v) {
              setState(() => _darkPref = v);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Mode gelap akan tersedia di update berikutnya')),
              );
            },
          ),
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text('LAINNYA',
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700)),
          ),
          _menuTile(
            Icons.help_outline_rounded,
            AppColors.info,
            'Pusat Bantuan',
            'Panduan penggunaan & FAQ',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Belum tersedia')),
              );
            },
          ),
          _menuTile(
            Icons.info_outline_rounded,
            AppColors.accent,
            'Tentang Aplikasi',
            'Profil aplikasi & kontak perusahaan',
            onTap: () {
              HapticFeedback.selectionClick();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutUsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 22),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.danger,
              side: const BorderSide(color: AppColors.danger),
            ),
            onPressed: () async {
              final ok = await _confirmLogout();
              if (ok && mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (_) => false,
                );
              }
            },
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, Color color, String title, String subtitle,
      {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 12.5, color: AppColors.textMuted)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchTile(IconData icon, Color color, String title,
      String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 12.5, color: AppColors.textMuted)),
                ],
              ),
            ),
            Switch.adaptive(
              value: value,
              activeThumbColor: AppColors.primary,
              onChanged: (v) {
                HapticFeedback.lightImpact();
                onChanged(v);
              },
            ),
          ],
        ),
      ),
    );
  }
}
