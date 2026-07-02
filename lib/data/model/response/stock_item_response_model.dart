// lib/features/stock/models/stock_item.dart

enum StockStatus { normal, low, critical, overstock }

extension StockStatusX on StockStatus {
  String get label {
    switch (this) {
      case StockStatus.normal:    return 'Normal';
      case StockStatus.low:       return 'Stok Rendah';
      case StockStatus.critical:  return 'Kritis';
      case StockStatus.overstock: return 'Overstock';
    }
  }
}

class StockItem {
  final String id;
  final String productCode;
  final String productName;
  final String category;
  final String warehouseId;
  final String supplierId;
  final int currentStock;
  final int minimumStock;
  final int maximumStock;
  final String unit;
  final double buyPrice;
  final double sellPrice;
  final DateTime lastUpdated;
  final String? notes;

  const StockItem({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.category,
    required this.warehouseId,
    required this.supplierId,
    required this.currentStock,
    required this.minimumStock,
    required this.maximumStock,
    required this.unit,
    required this.buyPrice,
    required this.sellPrice,
    required this.lastUpdated,
    this.notes,
  });

  StockStatus get status {
    if (currentStock == 0)                    return StockStatus.critical;
    if (currentStock < minimumStock)          return StockStatus.low;
    if (currentStock > maximumStock)          return StockStatus.overstock;
    return StockStatus.normal;
  }

  double get stockValueBuy  => currentStock * buyPrice;
  double get stockValueSell => currentStock * sellPrice;

  StockItem copyWith({
    String? id,
    String? productCode,
    String? productName,
    String? category,
    String? warehouseId,
    String? supplierId,
    int? currentStock,
    int? minimumStock,
    int? maximumStock,
    String? unit,
    double? buyPrice,
    double? sellPrice,
    DateTime? lastUpdated,
    String? notes,
  }) {
    return StockItem(
      id:            id            ?? this.id,
      productCode:   productCode   ?? this.productCode,
      productName:   productName   ?? this.productName,
      category:      category      ?? this.category,
      warehouseId:   warehouseId   ?? this.warehouseId,
      supplierId:    supplierId    ?? this.supplierId,
      currentStock:  currentStock  ?? this.currentStock,
      minimumStock:  minimumStock  ?? this.minimumStock,
      maximumStock:  maximumStock  ?? this.maximumStock,
      unit:          unit          ?? this.unit,
      buyPrice:      buyPrice      ?? this.buyPrice,
      sellPrice:     sellPrice     ?? this.sellPrice,
      lastUpdated:   lastUpdated   ?? this.lastUpdated,
      notes:         notes         ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() => {
        'id':           id,
        'productCode':  productCode,
        'productName':  productName,
        'category':     category,
        'warehouseId':  warehouseId,
        'supplierId':   supplierId,
        'currentStock': currentStock,
        'minimumStock': minimumStock,
        'maximumStock': maximumStock,
        'unit':         unit,
        'buyPrice':     buyPrice,
        'sellPrice':    sellPrice,
        'lastUpdated':  lastUpdated.toIso8601String(),
        'notes':        notes,
      };

  factory StockItem.fromJson(Map<String, dynamic> json) => StockItem(
        id:           json['id'] as String,
        productCode:  json['productCode'] as String,
        productName:  json['productName'] as String,
        category:     json['category'] as String,
        warehouseId:  json['warehouseId'] as String,
        supplierId:   json['supplierId'] as String,
        currentStock: json['currentStock'] as int,
        minimumStock: json['minimumStock'] as int,
        maximumStock: json['maximumStock'] as int,
        unit:         json['unit'] as String,
        buyPrice:     (json['buyPrice'] as num).toDouble(),
        sellPrice:    (json['sellPrice'] as num).toDouble(),
        lastUpdated:  DateTime.parse(json['lastUpdated'] as String),
        notes:        json['notes'] as String?,
      );
}


