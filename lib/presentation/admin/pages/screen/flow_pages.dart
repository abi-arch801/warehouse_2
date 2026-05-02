import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/PO_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/barcode_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/master_data_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/opname_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/report_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/request_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/submission_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/transfer_list_pages.dart';
import '../theme/app_theme.dart';

class FlowScreen extends StatelessWidget {
  final AppUser currentUser;
  const FlowScreen({super.key, required this.currentUser});

  void _go(BuildContext context, Widget page) {
    HapticFeedback.selectionClick();
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _showGuide(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
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
              const Text('Ringkasan alur warehouse',
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const Text(
                '3 sumber stok masuk: Purchase Order, Transfer, Pengajuan Produk.\n'
                '2 sumber stok keluar: Request user, Transfer ke gudang lain.\n'
                '1 mekanisme koreksi: Stock Opname.\n\n'
                'Semua pergerakan otomatis tercatat di stock movements sebagai audit trail.',
                style: TextStyle(
                    color: AppColors.textMuted,
                    height: 1.5,
                    fontSize: 13.5),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Mengerti'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final steps = <_FlowStep>[
      _FlowStep('Setup', 1, Icons.settings_rounded, AppColors.primary,
          'Setup Master Data',
          'Buat user, gudang, supplier, kategori, dan produk dasar.',
          MasterDataHub(currentUser: currentUser)),
      _FlowStep('Stok Masuk', 2, Icons.receipt_long_rounded, AppColors.info,
          'Purchase Order ke Supplier',
          'Admin buat PO → Super Admin approve → terima barang.',
          POListScreen(currentUser: currentUser)),
      _FlowStep(null, 5, Icons.add_box_rounded, AppColors.accent,
          'Pengajuan Produk Baru',
          'Admin ajukan produk baru → Super Admin approve → stok awal.',
          SubmissionListScreen(currentUser: currentUser)),
      _FlowStep('Stok Bergerak', 3, Icons.assignment_turned_in_rounded,
          AppColors.warning, 'Request Barang oleh User',
          'User minta barang → admin approve → stok keluar tercatat.',
          RequestListScreen(currentUser: currentUser)),
      _FlowStep(null, 4, Icons.swap_horiz_rounded, AppColors.primary,
          'Transfer Antar Gudang',
          'Pindah stok antar gudang dengan alur kirim & terima.',
          TransferListScreen(currentUser: currentUser)),
      _FlowStep('Kontrol & Koreksi', 6, Icons.fact_check_rounded,
          AppColors.success, 'Stock Opname',
          'Hitung fisik vs sistem → input selisih → adjustment.',
          OpnameListScreen(currentUser: currentUser)),
      _FlowStep(null, 7, Icons.qr_code_scanner_rounded, AppColors.danger,
          'Scan Barcode',
          'Scan barcode/SKU untuk identifikasi produk dan cek stok cepat.',
          BarcodeScanScreen(currentUser: currentUser)),
      _FlowStep('Laporan', 8, Icons.insert_chart_rounded, AppColors.info,
          'Laporan Stok',
          'Snapshot stok harian/bulanan dan audit trail seluruh pergerakan.',
          const StockReportScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alur Warehouse'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            onPressed: () => _showGuide(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        itemCount: steps.length + 1,
        itemBuilder: (_, i) {
          if (i == 0) {
            return Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alur lengkap dari awal sampai akhir',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 6),
                  Text(
                    'Ikuti urutan langkah ini supaya stok tetap akurat dan dapat dilacak: setup data → barang masuk → bergerak → kontrol → laporan.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        height: 1.45),
                  ),
                ],
              ),
            );
          }
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
                  if (step.section != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 6, 0, 10),
                      child: Text(
                        step.section!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _go(context, step.page),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: step.color.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(step.icon,
                                      color: step.color, size: 24),
                                ),
                                Positioned(
                                  top: -4,
                                  left: -4,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: AppColors.text,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
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
                              ],
                            ),
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
                                          height: 1.4)),
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
  final Widget page;
  _FlowStep(this.section, this.number, this.icon, this.color, this.title,
      this.desc, this.page);
}
