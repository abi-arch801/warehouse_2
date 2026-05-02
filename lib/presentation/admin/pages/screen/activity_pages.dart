import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class ActivityScreen extends StatefulWidget {
  final AppUser currentUser;
  const ActivityScreen({super.key, required this.currentUser});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  MovementType? _filter;
  String _search = '';

  Future<void> _refresh() async {
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final filtered = db.movements.reversed.where((m) {
      if (_filter != null && m.type != _filter) return false;
      if (_search.isNotEmpty) {
        final p = db.productById(m.productId);
        final q = _search.toLowerCase();
        if (!(p?.name.toLowerCase().contains(q) ?? false) &&
            !m.note.toLowerCase().contains(q) &&
            !m.reference.toLowerCase().contains(q)) {
          return false;
        }
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas Stok')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari produk, referensi, atau catatan...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _search.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => setState(() => _search = ''),
                      ),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _chip(null, 'Semua'),
                _chip(MovementType.inbound, 'Masuk'),
                _chip(MovementType.outbound, 'Keluar'),
                _chip(MovementType.transferIn, 'Trf Masuk'),
                _chip(MovementType.transferOut, 'Trf Keluar'),
                _chip(MovementType.adjustment, 'Penyesuaian'),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.primary,
              onRefresh: _refresh,
              child: filtered.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.inbox_rounded,
                                      size: 48, color: AppColors.textMuted),
                                  SizedBox(height: 12),
                                  Text('Tidak ada aktivitas',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, i) {
                        final m = filtered[i];
                        final p = db.productById(m.productId);
                        final w = db.warehouseById(m.warehouseId);
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration:
                              Duration(milliseconds: 250 + (i * 50).clamp(0, 600)),
                          curve: Curves.easeOut,
                          builder: (_, v, child) => Opacity(
                            opacity: v,
                            child: Transform.translate(
                              offset: Offset(0, (1 - v) * 12),
                              child: child,
                            ),
                          ),
                          child: _movementCard(
                              m, p?.name ?? '-', p?.unit ?? '', w?.name ?? '-'),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(MovementType? type, String label) {
    final selected = _filter == type;
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {
          HapticFeedback.selectionClick();
          setState(() => _filter = type);
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

  Widget _movementCard(StockMovement m, String productName, String unit,
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
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => _detailSheet(m, productName, unit, warehouse, color),
        );
      },
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
                              fontWeight: FontWeight.w700, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text('$warehouse · ${m.reference}',
                          style: const TextStyle(
                              color: AppColors.textMuted, fontSize: 12)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$prefix${m.quantity} $unit',
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w700,
                            fontSize: 14)),
                    Text(DateFormat('d MMM yyyy').format(m.date),
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 11)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sebelum',
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 11)),
                        Text('${m.qtyBefore}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_rounded,
                      color: AppColors.textMuted, size: 16),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sesudah',
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 11)),
                        Text('${m.qtyAfter}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Tipe',
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 11)),
                        Text(m.type.label,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailSheet(StockMovement m, String productName, String unit,
      String warehouse, Color color) {
    return SafeArea(
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
            Text(productName,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text('Referensi: ${m.reference}',
                style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 18),
            _detailRow('Tipe', m.type.label),
            _detailRow('Gudang', warehouse),
            _detailRow('Jumlah', '${m.quantity} $unit'),
            _detailRow('Stok sebelum', '${m.qtyBefore} $unit'),
            _detailRow('Stok sesudah', '${m.qtyAfter} $unit'),
            _detailRow('Catatan', m.note),
            _detailRow('Tanggal',
                DateFormat('EEEE, d MMM yyyy · HH:mm').format(m.date)),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              child: Text(label,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12.5)),
            ),
            Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );
}
