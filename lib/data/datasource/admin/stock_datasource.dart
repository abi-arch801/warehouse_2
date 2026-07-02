// lib/features/stock/datasource/stock_datasource.dart

import 'package:warehouse/data/model/response/stock_item_response_model.dart';

// ─── Abstract contract ──────────────────────────────────────────────────────

abstract class StockDataSource {
  /// Fetch all stock items (optionally filtered by warehouse)
  Future<List<StockItem>> fetchAll({String? warehouseId});

  /// Fetch a single item by [id]
  Future<StockItem> fetchById(String id);

  /// Create a new stock item; returns the persisted entity
  Future<StockItem> create(StockItem item);

  /// Update an existing item; returns the updated entity
  Future<StockItem> update(StockItem item);

  /// Delete an item by [id]
  Future<void> delete(String id);

  /// Adjust stock quantity (positive = add, negative = deduct)
  Future<StockItem> adjustStock(String id, int delta, {String? reason});

  /// Return a summary map (totalItems, totalValue, lowStockCount, …)
  Future<Map<String, dynamic>> fetchSummary({String? warehouseId});
}

// ─── Mock implementation ─────────────────────────────────────────────────────

class MockStockDataSource implements StockDataSource {
  // Singleton-like in-memory store so mutations are visible across calls
  final List<StockItem> _store = List.from(_seed);

  @override
  Future<List<StockItem>> fetchAll({String? warehouseId}) async {
    await _delay();
    if (warehouseId != null) {
      return _store.where((s) => s.warehouseId == warehouseId).toList();
    }
    return List.from(_store);
  }

  @override
  Future<StockItem> fetchById(String id) async {
    await _delay();
    return _store.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('StockItem $id not found'),
    );
  }

  @override
  Future<StockItem> create(StockItem item) async {
    await _delay();
    final newItem = item.copyWith(id: _nextId(), lastUpdated: DateTime.now());
    _store.add(newItem);
    return newItem;
  }

  @override
  Future<StockItem> update(StockItem item) async {
    await _delay();
    final idx = _store.indexWhere((s) => s.id == item.id);
    if (idx == -1) throw Exception('StockItem ${item.id} not found');
    final updated = item.copyWith(lastUpdated: DateTime.now());
    _store[idx] = updated;
    return updated;
  }

  @override
  Future<void> delete(String id) async {
    await _delay();
    _store.removeWhere((s) => s.id == id);
  }

  @override
  Future<StockItem> adjustStock(String id, int delta, {String? reason}) async {
    await _delay();
    final idx = _store.indexWhere((s) => s.id == id);
    if (idx == -1) throw Exception('StockItem $id not found');
    final current = _store[idx];
    final newQty = (current.currentStock + delta).clamp(0, 999999);
    final updated = current.copyWith(
      currentStock: newQty,
      lastUpdated: DateTime.now(),
      notes: reason ?? current.notes,
    );
    _store[idx] = updated;
    return updated;
  }

  @override
  Future<Map<String, dynamic>> fetchSummary({String? warehouseId}) async {
    await _delay();
    final items = warehouseId != null
        ? _store.where((s) => s.warehouseId == warehouseId).toList()
        : List<StockItem>.from(_store);

    double totalValue = 0;
    int lowCount = 0;
    int criticalCount = 0;
    int overstockCount = 0;

    for (final item in items) {
      totalValue += item.stockValueBuy;
      switch (item.status) {
        case StockStatus.low:
          lowCount++;
          break;
        case StockStatus.critical:
          criticalCount++;
          break;
        case StockStatus.overstock:
          overstockCount++;
          break;
        case StockStatus.normal:
          break;
      }
    }

    return {
      'totalItems': items.length,
      'totalValue': totalValue,
      'lowStockCount': lowCount,
      'criticalCount': criticalCount,
      'overstockCount': overstockCount,
    };
  }

  // helpers
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 400));
  int _autoId = 100;
  String _nextId() => 'STK${_autoId++}';
}

// ─── Seed data ────────────────────────────────────────────────────────────────

final List<StockItem> _seed = [
  StockItem(
    id: 'STK001',
    productCode: 'PRD-001',
    productName: 'Beras Premium 5 kg',
    category: 'Pangan',
    warehouseId: 'WH001',
    supplierId: 'SUP001',
    currentStock: 150,
    minimumStock: 50,
    maximumStock: 500,
    unit: 'Karung',
    buyPrice: 65000,
    sellPrice: 75000,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  StockItem(
    id: 'STK002',
    productCode: 'PRD-002',
    productName: 'Minyak Goreng 2 L',
    category: 'Pangan',
    warehouseId: 'WH001',
    supplierId: 'SUP002',
    currentStock: 20,
    minimumStock: 30,
    maximumStock: 300,
    unit: 'Botol',
    buyPrice: 28000,
    sellPrice: 33000,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  StockItem(
    id: 'STK003',
    productCode: 'PRD-003',
    productName: 'Gula Pasir 1 kg',
    category: 'Pangan',
    warehouseId: 'WH001',
    supplierId: 'SUP001',
    currentStock: 0,
    minimumStock: 20,
    maximumStock: 200,
    unit: 'Kg',
    buyPrice: 14000,
    sellPrice: 16500,
    lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
    notes: 'Menunggu restok dari supplier',
  ),
  StockItem(
    id: 'STK004',
    productCode: 'PRD-004',
    productName: 'Deterjen Bubuk 1 kg',
    category: 'Kebersihan',
    warehouseId: 'WH002',
    supplierId: 'SUP003',
    currentStock: 800,
    minimumStock: 100,
    maximumStock: 600,
    unit: 'Pcs',
    buyPrice: 22000,
    sellPrice: 27000,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  StockItem(
    id: 'STK005',
    productCode: 'PRD-005',
    productName: 'Sabun Mandi 90g',
    category: 'Kebersihan',
    warehouseId: 'WH002',
    supplierId: 'SUP003',
    currentStock: 245,
    minimumStock: 50,
    maximumStock: 500,
    unit: 'Pcs',
    buyPrice: 4500,
    sellPrice: 6000,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  StockItem(
    id: 'STK006',
    productCode: 'PRD-006',
    productName: 'Tepung Terigu 1 kg',
    category: 'Pangan',
    warehouseId: 'WH001',
    supplierId: 'SUP002',
    currentStock: 10,
    minimumStock: 40,
    maximumStock: 300,
    unit: 'Kg',
    buyPrice: 11500,
    sellPrice: 13500,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 8)),
  ),
];
