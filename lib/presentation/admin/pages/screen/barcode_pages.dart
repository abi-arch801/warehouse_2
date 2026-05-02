import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class BarcodeScanScreen extends StatefulWidget {
  final AppUser currentUser;
  const BarcodeScanScreen({super.key, required this.currentUser});

  @override
  State<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen>
    with SingleTickerProviderStateMixin {
  final _ctrl = TextEditingController();
  Product? _result;
  bool _scanning = false;
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    _ctrl.dispose();
    super.dispose();
  }

  void _scan(String code) async {
    HapticFeedback.selectionClick();
    setState(() => _scanning = true);
    await Future.delayed(const Duration(milliseconds: 400));
    final db = MockDB.instance;
    final found = db.findProductByBarcode(code.trim());
    setState(() {
      _result = found;
      _scanning = false;
    });
    if (found != null) {
      HapticFeedback.heavyImpact();
      db.barcodeLogs.add(BarcodeLog(
        id: 'bl${DateTime.now().millisecondsSinceEpoch}',
        productId: found.id,
        warehouseId: widget.currentUser.warehouseId ?? 'w1',
        userId: widget.currentUser.id,
        scannedAt: DateTime.now(),
        device: 'Mobile App',
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Barcode tidak ditemukan'),
          backgroundColor: AppColors.danger,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 220,
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
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _pulse,
                  builder: (_, __) {
                    return Container(
                      width: 200 + _pulse.value * 8,
                      height: 130 + _pulse.value * 6,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white
                              .withValues(alpha: 0.6 + _pulse.value * 0.4),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _pulse,
                  builder: (_, __) {
                    return Positioned(
                      top: 56 + _pulse.value * 80,
                      child: Container(
                        width: 180,
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.accent
                              .withValues(alpha: 0.9 - _pulse.value * 0.4),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent
                                  .withValues(alpha: 0.6),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Icon(Icons.qr_code_scanner_rounded,
                    color: Colors.white24, size: 80),
                Positioned(
                  bottom: 14,
                  child: Text(
                    _scanning
                        ? 'Memproses barcode...'
                        : 'Arahkan kamera ke barcode produk',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                hintText: 'Atau ketik barcode/SKU manual',
                prefixIcon: const Icon(Icons.qr_code_2_rounded),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () => _scan(_ctrl.text),
                ),
              ),
              onSubmitted: _scan,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: db.products
                  .take(5)
                  .map((p) => ActionChip(
                        label: Text(p.barcode),
                        onPressed: () {
                          _ctrl.text = p.barcode;
                          _scan(p.barcode);
                        },
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.08),
                    end: Offset.zero,
                  ).animate(anim),
                  child: child,
                ),
              ),
              child: _result == null
                  ? ListView(
                      key: const ValueKey('empty'),
                      children: const [
                        SizedBox(height: 30),
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.qr_code_scanner_rounded,
                                  size: 56, color: AppColors.textMuted),
                              SizedBox(height: 14),
                              Text('Belum ada hasil scan',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                              SizedBox(height: 6),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  'Scan barcode atau pilih kode contoh di atas untuk melihat info produk.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 12.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : _buildResult(_result!, key: ValueKey(_result!.id)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(Product product, {required Key key}) {
    final db = MockDB.instance;
    final cat = db.categoryById(product.categoryId);
    final stocks =
        db.stocks.where((s) => s.productId == product.id).toList();
    final totalStock =
        stocks.fold<int>(0, (s, x) => s + x.quantity);
    return ListView(
      key: key,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'product-${product.id}',
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.inventory_2_rounded,
                          color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(height: 2),
                        Text(
                            '${product.sku} · ${cat?.name ?? '-'} · ${product.unit}',
                            style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 12.5)),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                children: [
                  const Text('Total stok',
                      style:
                          TextStyle(fontWeight: FontWeight.w700)),
                  const Spacer(),
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: totalStock),
                    duration: const Duration(milliseconds: 700),
                    builder: (_, v, __) => Text(
                      '$v ${product.unit}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Stok per gudang',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              ...stocks.map((s) {
                final w = db.warehouseById(s.warehouseId);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(w?.name ?? '-',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                      ),
                      Text('${s.quantity} ${product.unit}',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Riwayat scan',
            style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ...db.barcodeLogs.reversed
            .where((b) => b.productId == product.id)
            .map((b) {
          final user = db.userById(b.userId);
          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.history_rounded,
                    color: AppColors.textMuted, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text('${user?.name ?? '-'} · ${b.device}',
                      style: const TextStyle(fontSize: 12.5)),
                ),
                Text(DateFormat('d MMM HH:mm').format(b.scannedAt),
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 11.5)),
              ],
            ),
          );
        }),
      ],
    );
  }
}
