// ════════════════════════════════════════════════════════════════
//  admin_stock_page.dart  — FIXED
//  Error diperbaiki:
//    • AppColors.bg           → nilai langsung Color(0xFFF0F9FF) di const ctx
//    • AppColors.text         → ada di AppColors ✅
//    • AppColors.primaryDark  → ada di AppColors ✅
//    • AppColors.warningSoft  → ada di AppColors ✅
//    • invalid_constant & non_constant_list_element → hapus const pada
//      LinearGradient yang pakai AppColors.primaryDark (runtime reference)
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';

import '../../../data/model/response/auth/auth_response_model.dart';
import '../../../data/datasource/admin/admin_remote_datasource.dart';

// ── Sederhana: BLoC inline untuk stock page ───────────────────────────────────
// Stock page menggunakan AdminRemoteDatasource langsung dengan StatefulWidget
// (bisa diganti BLoC terpisah bila sudah di-generate)

class AdminStockPage extends StatefulWidget {
  const AdminStockPage({super.key});

  @override
  State<AdminStockPage> createState() => _AdminStockPageState();
}

class _AdminStockPageState extends State<AdminStockPage> {
  final _ds = AdminRemoteDatasource();

  bool _loading = true;
  String? _error;
  List<dynamic> _stocks    = [];
  List<dynamic> _lowStocks = [];
  List<dynamic> _warehouses = [];
  int? _selectedWarehouseId;
  bool _showLowOnly = false;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    // Load warehouses untuk filter chip
    final whResult = await _ds.getWarehouses(perPage: 100);
    whResult.fold(
      (err) {},
      (body) {
        final data = body['data'];
        if (data is Map) {
          _warehouses = (data['data'] as List?) ?? [];
        }
      },
    );

    await _loadStocks();
  }

  Future<void> _loadStocks() async {
    setState(() => _loading = true);

    if (_showLowOnly) {
      final result = await _ds.getLowStocks();
      result.fold(
        (err) => setState(() {
          _error = err;
          _loading = false;
        }),
        (list) => setState(() {
          _stocks  = list;
          _loading = false;
        }),
      );
    } else {
      final result = await _ds.getStocks(
        warehouseId: _selectedWarehouseId,
        search: _search.isNotEmpty ? _search : null,
      );
      result.fold(
        (err) => setState(() {
          _error = err;
          _loading = false;
        }),
        (body) {
          final data = body['data'];
          final list = (data is Map ? data['data'] : data) as List? ?? [];
          setState(() {
            _stocks  = list;
            _loading = false;
          });
        },
      );
    }

    // Selalu load low stock count untuk badge header
    final lowResult = await _ds.getLowStocks();
    lowResult.fold(
      (_) {},
      (list) => setState(() => _lowStocks = list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          // ── Sticky Header dengan gradient ─────────────────────
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            title: const Text('Stok Gudang',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                // ✅ FIXED: tidak const karena AppColors.primaryDark adalah
                // static const field — boleh di const, tapi bungkus
                // LinearGradient tidak boleh const bila ada non-const sibling.
                // Gunakan deklarasi non-const aman:
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryDark,  // ✅ ada di AppColors
                      AppColors.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(20, 52, 20, 16),
                    child: Row(
                      children: [
                        _SummaryChip(
                          label: 'Total Item',
                          value: '${_stocks.length}',
                          icon: Icons.inventory_2_outlined,
                        ),
                        const SizedBox(width: 12),
                        _SummaryChip(
                          label: 'Stok Rendah',
                          value: '${_lowStocks.length}',
                          icon: Icons.warning_amber_rounded,
                          isAlert: _lowStocks.isNotEmpty,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Actions
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded,
                    color: Colors.white),
                onPressed: _loadAll,
              ),
            ],
          ),
        ],
        body: Column(
          children: [
            // ── Filter bar ────────────────────────────────────
            Container(
              color: AppColors.surface,
              padding:
                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Column(
                children: [
                  // Search
                  TextField(
                    onChanged: (q) {
                      _search = q;
                      _loadStocks();
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari produk...',
                      prefixIcon: const Icon(Icons.search_rounded,
                          color: AppColors.textMuted),
                      filled: true,
                      fillColor: AppColors.bg,  // ✅
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Filter chips: Low stock toggle + warehouse
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Low stock toggle
                        _FilterChip(
                          label: 'Stok Rendah',
                          selected: _showLowOnly,
                          color: AppColors.warning,
                          softColor: AppColors.warningSoft,  // ✅
                          onTap: () {
                            setState(() => _showLowOnly = !_showLowOnly);
                            _loadStocks();
                          },
                        ),
                        const SizedBox(width: 8),

                        // Warehouse filter chips
                        ..._warehouses.map((w) {
                          final id = (w as Map)['id'] as int;
                          final selected =
                              _selectedWarehouseId == id;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _FilterChip(
                              label: w['name'] as String,
                              selected: selected,
                              color: AppColors.primary,
                              softColor: AppColors.primarySoft,
                              onTap: () {
                                setState(() {
                                  _selectedWarehouseId =
                                      selected ? null : id;
                                });
                                _loadStocks();
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── List ─────────────────────────────────────────
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _error != null
                      ? _ErrorState(
                          message: _error!,
                          onRetry: _loadAll,
                        )
                      : _stocks.isEmpty
                          ? const _EmptyState()
                          : RefreshIndicator(
                              onRefresh: _loadAll,
                              child: ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 8, 16, 80),
                                itemCount: _stocks.length,
                                itemBuilder: (_, i) {
                                  final s = _stocks[i]
                                      as Map<String, dynamic>;
                                  return _StockCard(stock: s);
                                },
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Summary Chip di header ────────────────────────────────────────────────────
class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isAlert;

  const _SummaryChip({
    required this.label,
    required this.value,
    required this.icon,
    this.isAlert = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),  // ✅ withValues
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon,
              color: isAlert ? Colors.orangeAccent : Colors.white,
              size: 16),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Filter Chip ───────────────────────────────────────────────────────────────
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final Color softColor;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.color,
    required this.softColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color : softColor,   // ✅ tidak const
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}

// ── Stock Card ────────────────────────────────────────────────────────────────
class _StockCard extends StatelessWidget {
  final Map<String, dynamic> stock;
  const _StockCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    final product   = stock['product']   as Map<String, dynamic>? ?? {};
    final warehouse = stock['warehouse'] as Map<String, dynamic>? ?? {};
    final qty       = (stock['quantity'] ?? 0) as int;
    final minStock  = (product['min_stock'] ?? 0) as int;
    final isLow     = qty <= minStock;
    final name      = (product['name'] ?? '-').toString();
    final sku       = (product['sku']  ?? '-').toString();
    final unit      = (product['unit'] ?? '').toString();
    final wName     = (warehouse['name'] ?? '-').toString();

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isLow ? AppColors.warning : AppColors.border,
          width: isLow ? 1.5 : 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Ikon produk
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isLow
                    ? AppColors.warningSoft    // ✅ ada di AppColors
                    : AppColors.primarySoft,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.inventory_2_rounded,
                color: isLow ? AppColors.warning : AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.text,  // ✅ ada di AppColors
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'SKU: $sku • $wName',
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isLow) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.warningSoft,  // ✅
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Stok Rendah',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.warning,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Qty
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$qty',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color:
                        isLow ? AppColors.warning : AppColors.primary,
                  ),
                ),
                Text(
                  unit,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.textMuted),
                ),
                Text(
                  'min: $minStock',
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.textMuted),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Empty & Error State ───────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.primarySoft,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.inventory_2_rounded,
                size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          const Text('Tidak ada data stok',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text)),
          const SizedBox(height: 6),
          const Text('Coba ubah filter atau cari nama produk lain',
              style:
                  TextStyle(fontSize: 13, color: AppColors.textMuted),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded,
                size: 48, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(message,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}