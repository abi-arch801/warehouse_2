import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final about = MockDB.instance.aboutUs;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            builder: (_, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, (1 - v) * 16),
                child: child,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(22),
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
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.warehouse_rounded,
                        color: Colors.white, size: 38),
                  ),
                  const SizedBox(height: 14),
                  Text(about.appName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Versi ${about.version}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    about.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text('PERUSAHAAN',
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700)),
          ),
          _infoTile(
            context,
            Icons.business_rounded,
            AppColors.primary,
            'Perusahaan',
            about.company,
          ),
          _infoTile(
            context,
            Icons.email_rounded,
            AppColors.info,
            'Email',
            about.email,
            copyable: true,
          ),
          _infoTile(
            context,
            Icons.phone_rounded,
            AppColors.success,
            'Telepon',
            about.phone,
            copyable: true,
          ),
          _infoTile(
            context,
            Icons.location_on_rounded,
            AppColors.warning,
            'Alamat',
            about.address,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text('FITUR UTAMA',
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700)),
          ),
          _featureTile(Icons.shopping_cart_checkout_rounded,
              'Purchase Order', 'Alur PO ke supplier dengan approval'),
          _featureTile(Icons.assignment_turned_in_rounded,
              'Stock Request', 'Request internal dengan lampiran SPK'),
          _featureTile(Icons.swap_horiz_rounded, 'Transfer Antar Gudang',
              'Pencatatan transfer in/out otomatis'),
          _featureTile(Icons.fact_check_rounded, 'Stock Opname',
              'Penyesuaian stok berbasis hitung fisik'),
          _featureTile(Icons.sync_alt_rounded, 'Sinkron Keuangan',
              'Jurnal otomatis ke modul finance'),
          const SizedBox(height: 22),
          Center(
            child: Text(
              '© ${DateTime.now().year} ${about.company}',
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(BuildContext context, IconData icon, Color color,
      String label, String value,
      {bool copyable = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: copyable
              ? () {
                  HapticFeedback.lightImpact();
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.success,
                      content: Text('$label disalin ke clipboard'),
                    ),
                  );
                }
              : null,
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
                      Text(label,
                          style: const TextStyle(
                              fontSize: 11.5,
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6)),
                      const SizedBox(height: 2),
                      Text(value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                              height: 1.4)),
                    ],
                  ),
                ),
                if (copyable)
                  const Icon(Icons.copy_rounded,
                      color: AppColors.textMuted, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 13.5)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
