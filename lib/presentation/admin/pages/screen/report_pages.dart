import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class StockReportScreen extends StatefulWidget {
  const StockReportScreen({super.key});

  @override
  State<StockReportScreen> createState() => _StockReportScreenState();
}

class _StockReportScreenState extends State<StockReportScreen> {
  String? _warehouseFilter;

  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final stocks = _warehouseFilter == null
        ? db.stocks
        : db.stocks.where((s) => s.warehouseId == _warehouseFilter).toList();

    final totalStock = stocks.fold<int>(0, (s, x) => s + x.quantity);
    final inboundCount = db.movements
        .where((m) => m.type == MovementType.inbound)
        .fold<int>(0, (s, m) => s + m.quantity);
    final outboundCount = db.movements
        .where((m) => m.type == MovementType.outbound)
        .fold<int>(0, (s, m) => s + m.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Stok'),
        actions: [
          IconButton(
            tooltip: 'Riwayat snapshot',
            icon: const Icon(Icons.history_rounded),
            onPressed: () => _showSnapshots(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryDark, AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total stok aktif',
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 4),
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: totalStock),
                    duration: const Duration(milliseconds: 800),
                    builder: (_, v, __) => Text(
                      '$v',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _miniStat(
                          label: 'Total Masuk',
                          value: '+$inboundCount',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 36,
                        color: Colors.white24,
                      ),
                      Expanded(
                        child: _miniStat(
                          label: 'Total Keluar',
                          value: '-$outboundCount',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 46,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _whChip(null, 'Semua Gudang'),
                  ...db.warehouses.map((w) => _whChip(w.id, w.name)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...db.products.asMap().entries.map((e) {
              final i = e.key;
              final p = e.value;
              final phStocks =
                  stocks.where((s) => s.productId == p.id).toList();
              final total =
                  phStocks.fold<int>(0, (s, x) => s + x.quantity);
              final percent = totalStock == 0
                  ? 0.0
                  : (total / totalStock).clamp(0.0, 1.0);
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration:
                    Duration(milliseconds: 220 + (i * 50).clamp(0, 500)),
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
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(p.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('$total ${p.unit}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: percent),
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeOutCubic,
                            builder: (_, v, __) => LinearProgressIndicator(
                              value: v,
                              minHeight: 6,
                              backgroundColor: AppColors.bg,
                              valueColor: const AlwaysStoppedAnimation(
                                  AppColors.primary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: phStocks.map((s) {
                            final w = db.warehouseById(s.warehouseId);
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.bg,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${w?.code ?? '-'}: ${s.quantity}',
                                style: const TextStyle(
                                    fontSize: 11.5,
                                    color: AppColors.text,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _miniStat({required String label, required String value}) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _whChip(String? id, String label) {
    final selected = _warehouseFilter == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          HapticFeedback.selectionClick();
          setState(() => _warehouseFilter = id);
        },
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.text,
          fontWeight: FontWeight.w600,
          fontSize: 12.5,
        ),
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
      ),
    );
  }

  void _showSnapshots(BuildContext context) {
    HapticFeedback.selectionClick();
    final db = MockDB.instance;
    final snaps = [...db.stockReports]
      ..sort((a, b) => b.snapshotDate.compareTo(a.snapshotDate));
    final dateFmt = DateFormat('d MMM yyyy · HH:mm');
    final grouped = <String, List<StockReportSnapshot>>{};
    for (final s in snaps) {
      final key = DateFormat('d MMMM yyyy').format(s.snapshotDate);
      grouped.putIfAbsent(key, () => []).add(s);
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        maxChildSize: 0.92,
        builder: (_, ctrl) => Column(
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 10, bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 6, 20, 12),
              child: Row(
                children: [
                  Icon(Icons.history_rounded,
                      color: AppColors.primary),
                  SizedBox(width: 10),
                  Text('Riwayat Snapshot Stok',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            Expanded(
              child: snaps.isEmpty
                  ? const Center(
                      child: Text('Belum ada snapshot tersimpan',
                          style: TextStyle(
                              color: AppColors.textMuted)))
                  : ListView(
                      controller: ctrl,
                      padding:
                          const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      children: grouped.entries.map((entry) {
                        return Container(
                          margin:
                              const EdgeInsets.only(bottom: 14),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            border: Border.all(
                                color: AppColors.border),
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primarySoft,
                                  borderRadius:
                                      const BorderRadius.vertical(
                                          top: Radius.circular(13)),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                        Icons.calendar_today_rounded,
                                        size: 14,
                                        color: AppColors.primary),
                                    const SizedBox(width: 6),
                                    Text(entry.key,
                                        style: const TextStyle(
                                            color:
                                                AppColors.primary,
                                            fontWeight:
                                                FontWeight.w700,
                                            fontSize: 12.5)),
                                    const Spacer(),
                                    Text(
                                      '${entry.value.length} entri',
                                      style: const TextStyle(
                                          color:
                                              AppColors.primary,
                                          fontSize: 11.5,
                                          fontWeight:
                                              FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              ...entry.value.map((s) {
                                final p =
                                    db.productById(s.productId);
                                final w = db.warehouseById(
                                    s.warehouseId);
                                return Padding(
                                  padding: const EdgeInsets
                                      .symmetric(
                                      horizontal: 12,
                                      vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                          children: [
                                            Text(
                                                p?.name ??
                                                    s.productId,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight
                                                            .w700,
                                                    fontSize:
                                                        13.5)),
                                            const SizedBox(
                                                height: 2),
                                            Text(
                                              '${w?.name ?? '-'} · ${dateFmt.format(s.snapshotDate)}',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .textMuted,
                                                  fontSize: 11.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 10,
                                            vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors
                                              .successSoft,
                                          borderRadius:
                                              BorderRadius
                                                  .circular(8),
                                        ),
                                        child: Text(
                                          '${s.quantity} ${p?.unit ?? ''}',
                                          style: const TextStyle(
                                              color: AppColors
                                                  .success,
                                              fontWeight:
                                                  FontWeight.w800,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
