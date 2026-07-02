import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/admin_activity_page.dart';
import 'package:warehouse/presentation/admin/admin_category_page.dart';
import 'package:warehouse/presentation/admin/admin_product_list_page.dart';
import 'package:warehouse/presentation/admin/admin_request_list_page.dart';
import 'package:warehouse/presentation/admin/admin_supplier_list_page.dart';
import 'package:warehouse/presentation/admin/admin_user_page.dart';
import 'package:warehouse/presentation/admin/admin_warehouse_page.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/admin/opname_list_page.dart';
import 'package:warehouse/presentation/admin/po_list_page.dart';
import 'package:warehouse/presentation/admin/transfer_list_page.dart';
import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_user/admin_user_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/category/category_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/po/po_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/supplier/supplier_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_request/admin_request_bloc.dart';

class FlowScreen extends StatelessWidget {
  const FlowScreen({super.key});

  static PageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  void _go(BuildContext ctx, Widget page) {
    HapticFeedback.selectionClick();
    Navigator.push(ctx, _route(page));
  }

  void _showGuide(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Text(
                'Ringkasan alur warehouse',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              _guidePoint(
                'Stok Masuk',
                '3 sumber: Purchase Order dari supplier, '
                    'Transfer dari gudang lain, dan Request yang disetujui admin.',
                AppColors.success,
              ),
              const SizedBox(height: 8),
              _guidePoint(
                'Stok Keluar',
                '2 sumber: Request barang oleh user '
                    'dan Transfer keluar ke gudang lain.',
                AppColors.danger,
              ),
              const SizedBox(height: 8),
              _guidePoint(
                'Koreksi',
                'Stock Opname untuk menyesuaikan stok fisik '
                    'vs sistem dengan audit trail lengkap.',
                AppColors.warning,
              ),
              const SizedBox(height: 8),
              _guidePoint(
                'Audit Trail',
                'Semua pergerakan stok otomatis tercatat '
                    'di Aktivitas Stok sebagai riwayat lengkap.',
                AppColors.info,
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Mengerti'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMasterDataMenu(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Text(
                'Pilih Master Data',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              _masterDataItem(
                ctx,
                icon: Icons.warehouse_rounded,
                color: AppColors.primary,
                title: 'Gudang',
                subtitle: 'Kelola data gudang',
                page: () => BlocProvider(
                  create: (_) => AdminWarehouseBloc()
                    ..add(const AdminWarehouseEvent.load()),
                  child: const AdminWarehousesPage(),
                ),
              ),
              _masterDataItem(
                ctx,
                icon: Icons.local_shipping_rounded,
                color: AppColors.info,
                title: 'Supplier',
                subtitle: 'Kelola data supplier',
                page: () => BlocProvider(
                  create: (_) =>
                      SupplierBloc()..add(const SupplierEvent.loadSuppliers()),
                  child: const SupplierListPage(),
                ),
              ),
              _masterDataItem(
                ctx,
                icon: Icons.category_rounded,
                color: AppColors.warning,
                title: 'Kategori',
                subtitle: 'Kelola kategori produk',
                page: () => BlocProvider(
                  create: (_) =>
                      CategoryBloc()..add(const CategoryEvent.loadCategories()),
                  child: const CategoriesPage(),
                ),
              ),
              _masterDataItem(
                ctx,
                icon: Icons.inventory_2_rounded,
                color: AppColors.success,
                title: 'Produk',
                subtitle: 'Kelola data produk',
                page: () => BlocProvider(
                  create: (_) =>
                      AdminProductBloc()..add(const AdminProductEvent.load()),
                  child: const AdminProductListPage(),
                ),
              ),
              _masterDataItem(
                ctx,
                icon: Icons.people_alt_rounded,
                color: AppColors.accent,
                title: 'Manajemen User',
                subtitle: 'Kelola data user',
                page: () => BlocProvider(
                  create: (_) =>
                      AdminUserBloc()..add(const AdminUserEvent.load()),
                  child: const AdminUserPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _masterDataItem(
    BuildContext ctx, {
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required Widget Function() page,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pop(ctx);
          _go(ctx, page());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: Colors.grey.shade300, size: 22),
            ],
          ),
        ),
      ),
    );
  }

  Widget _guidePoint(String title, String desc, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: color, fontSize: 13)),
              const SizedBox(height: 2),
              Text(desc,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12.5, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final steps = <_FlowStep>[
      // ── Setup ──────────────────────────────────────────────────────────
      _FlowStep(
        section: 'SETUP',
        number: 1,
        icon: Icons.settings_rounded,
        color: AppColors.primary,
        title: 'Setup Master Data',
        desc: 'Buat gudang, supplier, kategori, produk, dan manajemen user.',
        onTap: (ctx) => _showMasterDataMenu(ctx),
        buildPage: () => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  AdminProductBloc()..add(const AdminProductEvent.load()),
            ),
            BlocProvider(
              create: (_) =>
                  AdminWarehouseBloc()..add(const AdminWarehouseEvent.load()),
            ),
            BlocProvider(
              create: (_) =>
                  SupplierBloc()..add(const SupplierEvent.loadSuppliers()),
            ),
          ],
          // Ganti MasterDataPage dengan page master data yang benar di project kamu
          // Contoh: child: const AdminProductPage(),
          child: const AdminProductListPage(),
        ),
      ),

      // ── Stok Masuk ─────────────────────────────────────────────────────
      _FlowStep(
        section: 'STOK MASUK',
        number: 2,
        icon: Icons.receipt_long_rounded,
        color: AppColors.info,
        title: 'Purchase Order ke Supplier',
        desc: 'Buat PO → setujui → terima barang → stok bertambah otomatis.',
        buildPage: () => BlocProvider(
          create: (_) => PoBloc()..add(const PoEvent.load()),
          child: const PoListPage(),
        ),
      ),
      _FlowStep(
        section: null,
        number: 3,
        icon: Icons.swap_horiz_rounded,
        color: AppColors.primary,
        title: 'Transfer Antar Gudang',
        desc: 'Pindah stok antar gudang — kirim, setujui, terima.',
        buildPage: () => BlocProvider(
          create: (_) => TransferBloc()..add(const TransferEvent.load()),
          child: const TransferListPage(),
        ),
      ),

      // ── Stok Keluar ────────────────────────────────────────────────────
      _FlowStep(
        section: 'STOK KELUAR',
        number: 4,
        icon: Icons.assignment_turned_in_rounded,
        color: AppColors.warning,
        title: 'Request Barang oleh User',
        desc: 'User minta barang → admin setujui/tolak → stok keluar tercatat.',
        // ✅ Hapus SubjectBloc/BlocConsumer — langsung pakai AdminRequestBloc
        buildPage: () => BlocProvider(
          create: (_) =>
              AdminRequestBloc()..add(const AdminRequestEvent.load()),
          child: const AdminRequestListPage(),
        ),
      ),

      // ── Koreksi ────────────────────────────────────────────────────────
      _FlowStep(
        section: 'KONTROL & KOREKSI',
        number: 5,
        icon: Icons.fact_check_rounded,
        color: AppColors.success,
        title: 'Stock Opname',
        desc: 'Hitung fisik vs sistem → input selisih → adjustment stok.',
        buildPage: () => BlocProvider(
          create: (_) => OpnameBloc()..add(const OpnameEvent.load()),
          child: const OpnameListPage(),
        ),
      ),

      // ── Laporan ────────────────────────────────────────────────────────
      _FlowStep(
        section: 'LAPORAN',
        number: 6,
        icon: Icons.bar_chart_rounded,
        color: AppColors.accent,
        title: 'Aktivitas Stok',
        desc:
            'Riwayat lengkap semua pergerakan stok — masuk, keluar, transfer, penyesuaian.',
        buildPage: () => BlocProvider(
          create: (_) => ActivityBloc()..add(const ActivityEvent.loadAll()),
          child: const ActivityListPage(),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Alur Warehouse'),
        backgroundColor: AppColors.surface,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            tooltip: 'Panduan',
            onPressed: () => _showGuide(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
        itemCount: steps.length + 1,
        itemBuilder: (ctx, i) {
          // ── Banner header ─────────────────────────────────────────────
          if (i == 0) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              builder: (_, v, child) => Opacity(
                opacity: v,
                child: Transform.translate(
                  offset: Offset(0, (1 - v) * 16),
                  child: child,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.28),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.route_rounded,
                            color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Alur Lengkap Warehouse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      'Ikuti urutan langkah ini supaya stok selalu akurat '
                      'dan dapat dilacak: setup data → barang masuk → '
                      'pergerakan → kontrol → laporan.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12.5,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: steps
                          .map((s) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.18),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${s.number}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          }

          // ── Step card ─────────────────────────────────────────────────
          final step = steps[i - 1];
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 300 + i * 80),
            curve: Curves.easeOut,
            builder: (_, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset((1 - v) * 20, 0),
                child: child,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section header
                  if (step.section != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 6, 0, 8),
                      child: Row(children: [
                        Container(
                          width: 3,
                          height: 14,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: step.color,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Text(
                          step.section!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 11,
                            color: step.color,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ]),
                    ),

                  // Card
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      // onTap: () => _go(ctx, step.buildPage()),
                      onTap: () {
                        if (step.onTap != null) {
                          step.onTap!(ctx);
                        } else {
                          _go(ctx, step.buildPage());
                        }
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(children: [
                          Stack(clipBehavior: Clip.none, children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: step.color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child:
                                  Icon(step.icon, color: step.color, size: 26),
                            ),
                            Positioned(
                              top: -5,
                              left: -5,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: AppColors.text,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${step.number}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(step.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.5)),
                                const SizedBox(height: 4),
                                Text(step.desc,
                                    style: const TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 12,
                                        height: 1.45)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.chevron_right_rounded,
                              color: Colors.grey.shade300, size: 22),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FlowStep {
  final String? section;
  final int number;
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  final Widget Function() buildPage;
  final void Function(BuildContext)? onTap;

  const _FlowStep({
    required this.section,
    required this.number,
    required this.icon,
    required this.color,
    required this.title,
    required this.desc,
    required this.buildPage,
    this.onTap,
  });
}
