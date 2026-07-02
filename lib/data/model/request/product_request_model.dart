import 'dart:convert';

class StoreProductRequestModel {
  final String name;
  final String sku;
  final String? barcode;
  final String? description;
  final String? unit;
  final double? purchasePrice;
  final double? sellingPrice;
  final int? minStock;
  final int? categoryId;
  final bool? isActive;

  StoreProductRequestModel({
    required this.name,
    required this.sku,
    this.barcode,
    this.description,
    this.unit,
    this.purchasePrice,
    this.sellingPrice,
    this.minStock,
    this.categoryId,
    this.isActive,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'sku': sku,
        if (barcode != null) 'barcode': barcode,
        if (description != null) 'description': description,
        if (unit != null) 'unit': unit,
        if (purchasePrice != null) 'purchase_price': purchasePrice,
        if (sellingPrice != null) 'selling_price': sellingPrice,
        if (minStock != null) 'min_stock': minStock,
        if (categoryId != null) 'category_id': categoryId,
        if (isActive != null) 'is_active': isActive,
      };

  String toJson() => jsonEncode(toMap());
}

class UpdateProductRequestModel {
  final String? name;
  final String? sku;
  final String? barcode;
  final String? description;
  final String? unit;
  final double? purchasePrice;
  final double? sellingPrice;
  final int? minStock;
  final int? categoryId;
  final bool? isActive;

  UpdateProductRequestModel({
    this.name,
    this.sku,
    this.barcode,
    this.description,
    this.unit,
    this.purchasePrice,
    this.sellingPrice,
    this.minStock,
    this.categoryId,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (name != null) m['name'] = name;
    if (sku != null) m['sku'] = sku;
    if (barcode != null) m['barcode'] = barcode;
    if (description != null) m['description'] = description;
    if (unit != null) m['unit'] = unit;
    if (purchasePrice != null) m['purchase_price'] = purchasePrice;
    if (sellingPrice != null) m['selling_price'] = sellingPrice;
    if (minStock != null) m['min_stock'] = minStock;
    if (categoryId != null) m['category_id'] = categoryId;
    if (isActive != null) m['is_active'] = isActive;
    return m;
  }

  String toJson() => jsonEncode(toMap());
}



