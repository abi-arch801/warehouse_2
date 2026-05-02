import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class OpnameCreateScreen extends StatefulWidget {
  final AppUser currentUser;
  const OpnameCreateScreen({super.key, required this.currentUser});

  @override
  State<OpnameCreateScreen> createState() => _OpnameCreateScreenState();
}

class _OpnameCreateScreenState extends State<OpnameCreateScreen> {
  String? _warehouseId;
  Map<String, int> _physical = {};
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final relevantStocks = _warehouseId == null
        ? <Stock>[]
        : db.stocks.where((s) => s.warehouseId == _warehouseId).toList();
    final totalDiff = relevantStocks.fold<int>(0, (sum, s) {
      final phys = _physical[s.productId] ?? s.quantity;
      return sum + (phys - s.quantity);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Stock Opname Baru')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _warehouseId == null ? 0.5 : 1,
            child: ElevatedButton.icon(
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.4))
                  : const Icon(Icons.save_rounded),
              label: Text(_saving ? 'Menyimpan...' : 'Simpan Hasil Opname'),
              onPressed: _warehouseId == null || _saving ? null : _submit,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        children: [
          _label('Gudang'),
          DropdownButtonFormField<String>(
            initialValue: _warehouseId,
            items: db.warehouses
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) {
              HapticFeedback.selectionClick();
              setState(() {
                _warehouseId = v;
                _physical = {
                  for (final s
                      in db.stocks.where((s) => s.warehouseId == v))
                    s.productId: s.quantity
                };
              });
            },
            decoration: const InputDecoration(hintText: 'Pilih gudang'),
          ),
          const SizedBox(height: 18),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: _warehouseId == null
                ? const SizedBox(key: ValueKey('empty'))
                : Column(
                    key: ValueKey(_warehouseId),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: totalDiff == 0
                              ? AppColors.successSoft
                              : (totalDiff > 0
                                  ? AppColors.successSoft
                                  : AppColors.dangerSoft),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              totalDiff == 0
                                  ? Icons.check_circle_rounded
                                  : Icons.info_outline_rounded,
                              color: totalDiff < 0
                                  ? AppColors.danger
                                  : AppColors.success,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Total selisih saat ini: ${totalDiff > 0 ? '+' : ''}$totalDiff',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: totalDiff < 0
                                      ? AppColors.danger
                                      : AppColors.success,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text('Hitung Fisik',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      ...relevantStocks.asMap().entries.map((e) {
                        final i = e.key;
                        final s = e.value;
                        final p = db.productById(s.productId);
                        final phys = _physical[s.productId] ?? s.quantity;
                        final diff = phys - s.quantity;
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: Duration(
                              milliseconds:
                                  200 + (i * 50).clamp(0, 500)),
                          curve: Curves.easeOut,
                          builder: (_, v, child) => Opacity(
                            opacity: v,
                            child: Transform.translate(
                              offset: Offset((1 - v) * 12, 0),
                              child: child,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              border: Border.all(
                                color: diff == 0
                                    ? AppColors.border
                                    : (diff > 0
                                        ? AppColors.success
                                        : AppColors.danger),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(p?.name ?? '-',
                                          style: const TextStyle(
                                              fontWeight:
                                                  FontWeight.w700)),
                                      Text(
                                          'Sistem: ${s.quantity} ${p?.unit ?? ''}',
                                          style: const TextStyle(
                                              color:
                                                  AppColors.textMuted,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                _qtyBtn(Icons.remove_rounded, () {
                                  setState(() {
                                    final cur = _physical[s.productId] ??
                                        s.quantity;
                                    _physical[s.productId] =
                                        cur > 0 ? cur - 1 : 0;
                                  });
                                }),
                                SizedBox(
                                  width: 56,
                                  child: TextFormField(
                                    key: ValueKey(
                                        '${s.productId}-$_warehouseId'),
                                    initialValue: phys.toString(),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(
                                                vertical: 8)),
                                    onChanged: (v) {
                                      setState(() =>
                                          _physical[s.productId] =
                                              int.tryParse(v) ?? 0);
                                    },
                                  ),
                                ),
                                _qtyBtn(Icons.add_rounded, () {
                                  setState(() {
                                    final cur = _physical[s.productId] ??
                                        s.quantity;
                                    _physical[s.productId] = cur + 1;
                                  });
                                }),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    diff == 0
                                        ? '0'
                                        : (diff > 0 ? '+$diff' : '$diff'),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: diff == 0
                                          ? AppColors.textMuted
                                          : (diff > 0
                                              ? AppColors.success
                                              : AppColors.danger),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _label(String s) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 0, 6),
        child:
            Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
      );

  Widget _qtyBtn(IconData icon, VoidCallback onTap) => Material(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
        ),
      );

  void _submit() async {
    setState(() => _saving = true);
    await Future.delayed(const Duration(milliseconds: 500));
    final db = MockDB.instance;
    final code =
        'OPN/2026/${(db.opnames.length + 1).toString().padLeft(4, '0')}';
    final stocks =
        db.stocks.where((s) => s.warehouseId == _warehouseId).toList();
    db.opnames.add(StockOpname(
      id: 'op${DateTime.now().millisecondsSinceEpoch}',
      code: code,
      warehouseId: _warehouseId!,
      items: stocks
          .map((s) => OpnameItem(
                productId: s.productId,
                systemQty: s.quantity,
                physicalQty: _physical[s.productId] ?? s.quantity,
              ))
          .toList(),
      status: DocStatus.pending,
      createdAt: DateTime.now(),
      createdBy: widget.currentUser.id,
    ));
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opname $code menunggu approval'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }
}
