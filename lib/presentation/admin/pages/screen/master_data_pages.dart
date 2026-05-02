import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/category_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/product_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/supliers_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/user_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/warehouse_pages.dart';
import '../theme/app_theme.dart';

class MasterDataHub extends StatelessWidget {
  final AppUser currentUser;
  const MasterDataHub({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final tiles = <_T>[
      _T(Icons.group_rounded, AppColors.primary, 'User',
          'Daftarkan super admin, admin, dan user', const UsersScreen()),
      _T(Icons.warehouse_rounded, AppColors.info, 'Gudang',
          'Buat gudang utama & cabang', const WarehousesScreen()),
      _T(Icons.local_shipping_rounded, AppColors.warning, 'Supplier',
          'Mitra penyedia barang', const SuppliersScreen()),
      _T(Icons.category_rounded, AppColors.accent, 'Kategori',
          'Pengelompokan produk', const CategoriesScreen()),
      _T(Icons.inventory_2_rounded, AppColors.success, 'Produk',
          'Daftar SKU, stok minimum, & ubah harga',
          ProductsScreen(currentUser: currentUser)),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Master Data')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_outline_rounded,
                    color: AppColors.primary, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Setup data dasar dilakukan sekali di awal supaya alur stok berikutnya berjalan rapi.',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12.5,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ...tiles.asMap().entries.map((e) {
            final i = e.key;
            final t = e.value;
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: Duration(milliseconds: 250 + i * 80),
              curve: Curves.easeOut,
              builder: (_, v, child) => Opacity(
                opacity: v,
                child: Transform.translate(
                  offset: Offset(0, (1 - v) * 16),
                  child: child,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => t.page));
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: t.color.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(t.icon, color: t.color),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.5)),
                                const SizedBox(height: 2),
                                Text(t.subtitle,
                                    style: const TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 12.5)),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: AppColors.textMuted),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _T {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final Widget page;
  _T(this.icon, this.color, this.title, this.subtitle, this.page);
}
