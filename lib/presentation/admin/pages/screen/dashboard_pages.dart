import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/screen/PO_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/barcode_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/opname_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/product_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/report_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/request_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/submission_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/screen/transfer_list_pages.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class DashboardScreen extends StatefulWidget {
  final AppUser currentUser;
  const DashboardScreen({super.key, required this.currentUser});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 700));
    if (mounted) setState(() {});
  }

  void _push(Widget page) {
    HapticFeedback.selectionClick();
    Navigator.push(context, MaterialPageRoute(builder: (_) => page))
        .then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final lowStock = db.products
        .where((p) => db.totalStockOf(p.id) <= p.minStock + 5)
        .length;
    final pendingPO =
        db.purchaseOrders.where((po) => po.status == DocStatus.pending).length;
    final pendingReq =
        db.requests.where((r) => r.status == DocStatus.pending).length;
    final inTransit = db.transfers
        .where((t) => t.status == DocStatus.inTransit)
        .length;
    final totalUnits =
        db.stocks.fold<int>(0, (s, x) => s + x.quantity);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: _refresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 12, 20, 18),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryDark, AppColors.primary],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.2),
                            child: Text(
                              widget.currentUser.name.substring(0, 1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Halo, ${widget.currentUser.name.split(' ').first}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${widget.currentUser.role.label} · ${DateFormat('EEEE, d MMM').format(DateTime.now())}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                HapticFeedback.selectionClick();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Tidak ada notifikasi baru'),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                    Icons.notifications_none_rounded,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Pantauan Stok',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 4),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: totalUnits.toDouble()),
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeOutCubic,
                        builder: (_, value, __) => Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${value.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Text('unit total',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  delegate: SliverChildListDelegate([
                    _statCard(Icons.inventory_2_rounded, AppColors.primary,
                        'Total Produk', '${db.products.length}',
                        '${db.warehouses.length} gudang aktif'),
                    _statCard(Icons.warning_amber_rounded, AppColors.warning,
                        'Stok Menipis', '$lowStock',
                        'Perlu restock segera'),
                    _statCard(Icons.receipt_long_rounded, AppColors.info,
                        'PO Menunggu', '$pendingPO',
                        'Approval super admin'),
                    _statCard(Icons.swap_horiz_rounded, AppColors.accent,
                        'Transfer Berjalan', '$inTransit', 'Sedang dikirim'),
                  ]),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 18, 20, 10),
                  child: Text('Aksi cepat',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700)),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  delegate: SliverChildListDelegate([
                    _action(Icons.receipt_long_rounded, AppColors.primary,
                        'Purchase\nOrder',
                        () => _push(POListScreen(currentUser: widget.currentUser))),
                    _action(Icons.assignment_turned_in_rounded,
                        AppColors.warning, 'Request\nBarang',
                        () => _push(RequestListScreen(currentUser: widget.currentUser))),
                    _action(Icons.swap_horiz_rounded, AppColors.accent,
                        'Transfer\nGudang',
                        () => _push(TransferListScreen(currentUser: widget.currentUser))),
                    _action(Icons.fact_check_rounded, AppColors.success,
                        'Stock\nOpname',
                        () => _push(OpnameListScreen(currentUser: widget.currentUser))),
                    _action(Icons.inventory_rounded, AppColors.info,
                        'Pengajuan\nProduk',
                        () => _push(SubmissionListScreen(currentUser: widget.currentUser))),
                    _action(Icons.bar_chart_rounded, AppColors.danger,
                        'Laporan\nStok',
                        () => _push(const StockReportScreen())),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text('Notifikasi alur',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat semua'),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (pendingReq > 0)
                      _alertTile(
                          Icons.assignment_turned_in_rounded,
                          AppColors.warning,
                          AppColors.warningSoft,
                          '$pendingReq request menunggu approval',
                          'Tinjau & setujui pengeluaran stok user.',
                          () => _push(RequestListScreen(currentUser: widget.currentUser))),
                    if (pendingPO > 0) ...[
                      const SizedBox(height: 10),
                      _alertTile(
                          Icons.receipt_long_rounded,
                          AppColors.info,
                          AppColors.infoSoft,
                          '$pendingPO purchase order pending',
                          'Menunggu persetujuan super admin.',
                          () => _push(POListScreen(currentUser: widget.currentUser))),
                    ],
                    if (lowStock > 0) ...[
                      const SizedBox(height: 10),
                      _alertTile(
                          Icons.warning_amber_rounded,
                          AppColors.danger,
                          AppColors.dangerSoft,
                          '$lowStock produk dekat stok minimum',
                          'Pertimbangkan untuk membuat PO.',
                          () => _push(const ProductsScreen())),
                    ],
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text('Pergerakan stok terbaru',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),
                      TextButton(
                        onPressed: () =>
                            _push(const StockReportScreen()),
                        child: const Text('Laporan'),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final m = db.movements.reversed.toList()[i];
                      final p = db.productById(m.productId);
                      final w = db.warehouseById(m.warehouseId);
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(milliseconds: 350 + i * 80),
                        curve: Curves.easeOut,
                        builder: (_, v, child) => Opacity(
                          opacity: v,
                          child: Transform.translate(
                            offset: Offset(0, (1 - v) * 12),
                            child: child,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _movementTile(
                              m, p?.name ?? '-', p?.unit ?? '', w?.name ?? '-'),
                        ),
                      );
                    },
                    childCount: db.movements.length.clamp(0, 4),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.qr_code_scanner_rounded),
        label: const Text('Scan'),
        onPressed: () =>
            _push(BarcodeScanScreen(currentUser: widget.currentUser)),
      ),
    );
  }

  Widget _statCard(IconData icon, Color color, String label, String value, String hint) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // ini penting
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textMuted,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Text(
          hint,
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

  Widget _action(
      IconData icon, Color color, String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _alertTile(IconData icon, Color color, Color bg, String title,
      String subtitle, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                        )),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movementTile(StockMovement m, String productName, String unit,
      String warehouse) {
    Color color;
    IconData icon;
    String prefix;
    switch (m.type) {
      case MovementType.inbound:
        color = AppColors.success;
        icon = Icons.south_west_rounded;
        prefix = '+';
        break;
      case MovementType.outbound:
        color = AppColors.danger;
        icon = Icons.north_east_rounded;
        prefix = '-';
        break;
      case MovementType.transfer:
      case MovementType.transferOut:
        color = AppColors.accent;
        icon = Icons.north_east_rounded;
        prefix = '-';
        break;
      case MovementType.transferIn:
        color = AppColors.info;
        icon = Icons.south_west_rounded;
        prefix = '+';
        break;
      case MovementType.adjustment:
        color = AppColors.warning;
        icon = Icons.tune_rounded;
        prefix = '~';
        break;
    }
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13.5)),
                const SizedBox(height: 2),
                Text('$warehouse · ${m.note}',
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 11.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$prefix${m.quantity} $unit',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: color)),
              const SizedBox(height: 2),
              Text(DateFormat('d MMM').format(m.date),
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}
