// import 'dart:convert';
// import 'package:warehouse/data/model/response/pagination_meta.dart';

// class ProductUnitModel {
//   final int id;
//   final int productId;
//   final String unit;
//   final double conversionRate;
//   final double? purchasePrice;
//   final double? sellingPrice;

//   ProductUnitModel({
//     required this.id,
//     required this.productId,
//     required this.unit,
//     required this.conversionRate,
//     this.purchasePrice,
//     this.sellingPrice,
//   });

//   factory ProductUnitModel.fromMap(Map<String, dynamic> map) =>
//       ProductUnitModel(
//         id: map['id'] ?? 0,
//         productId: map['product_id'] ?? 0,
//         unit: map['unit'] ?? '',
//         conversionRate:
//             (map['conversion_rate'] as num?)?.toDouble() ?? 1.0,
//         purchasePrice:
//             (map['purchase_price'] as num?)?.toDouble(),
//         sellingPrice:
//             (map['selling_price'] as num?)?.toDouble(),
//       );
// }

// class ProductModel {
//   final int id;
//   final String name;
//   final String sku;
//   final String? barcode;
//   final String? description;
//   final String? unit;
//   final double? purchasePrice;
//   final double? sellingPrice;
//   final int minStock;
//   final bool isActive;
//   final String? photo;
//   final int? categoryId;
//   final Map<String, dynamic>? category;
//   final List<ProductUnitModel> units;
//   final String createdAt;

//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.sku,
//     this.barcode,
//     this.description,
//     this.unit,
//     this.purchasePrice,
//     this.sellingPrice,
//     required this.minStock,
//     required this.isActive,
//     this.photo,
//     this.categoryId,
//     this.category,
//     required this.units,
//     required this.createdAt,
//   });

//   factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
//         id: map['id'] ?? 0,
//         name: map['name'] ?? '',
//         sku: map['sku'] ?? '',
//         barcode: map['barcode'],
//         description: map['description'],
//         unit: map['unit'],
//         purchasePrice: (map['purchase_price'] as num?)?.toDouble(),
//         sellingPrice: (map['selling_price'] as num?)?.toDouble(),
//         minStock: map['min_stock'] ?? 0,
//         isActive: map['is_active'] ?? true,
//         photo: map['photo'],
//         categoryId: map['category_id'],
//         category: map['category'] is Map
//             ? Map<String, dynamic>.from(map['category'])
//             : null,
//         units: (map['units'] as List? ?? [])
//             .map((e) => ProductUnitModel.fromMap(e))
//             .toList(),
//         createdAt: map['created_at'] ?? '',
//       );
// }

// class ProductListResponseModel {
//   final bool success;
//   final List<ProductModel> data;
//   final PaginationMeta? meta;

//   ProductListResponseModel(
//       {required this.success, required this.data, this.meta});

//   factory ProductListResponseModel.fromJson(String str) =>
//       ProductListResponseModel.fromMap(jsonDecode(str));

//   factory ProductListResponseModel.fromMap(Map<String, dynamic> map) {
//     final rawData = map['data'];
//     List<ProductModel> items = [];
//     PaginationMeta? meta;

//     if (rawData is Map) {
//       items = (rawData['data'] as List? ?? [])
//           .map((e) => ProductModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(rawData);
//     } else if (rawData is List) {
//       items = rawData.map((e) => ProductModel.fromMap(e)).toList();
//     }

//     return ProductListResponseModel(
//         success: map['success'] ?? false, data: items, meta: meta);
//   }
// }

// class ProductResponseModel {
//   final bool success;
//   final String? message;
//   final ProductModel? data;

//   ProductResponseModel({required this.success, this.message, this.data});

//   factory ProductResponseModel.fromJson(String str) =>
//       ProductResponseModel.fromMap(jsonDecode(str));

//   factory ProductResponseModel.fromMap(Map<String, dynamic> map) =>
//       ProductResponseModel(
//         success: map['success'] ?? false,
//         message: map['message'],
//         data: map['data'] != null
//             ? ProductModel.fromMap(map['data'])
//             : null,
//       );
// }

import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

class ProductUnitModel {
  final int id;
  final int productId;
  final String unit;
  final double conversionRate;
  final double? purchasePrice;
  final double? sellingPrice;

  ProductUnitModel({
    required this.id,
    required this.productId,
    required this.unit,
    required this.conversionRate,
    this.purchasePrice,
    this.sellingPrice,
  });

  factory ProductUnitModel.fromMap(Map<String, dynamic> map) =>
      ProductUnitModel(
        id: map['id'] ?? 0,
        productId: map['product_id'] ?? 0,
        unit: map['unit'] ?? '',
        conversionRate: (map['conversion_rate'] as num?)?.toDouble() ?? 1.0,
        purchasePrice: (map['purchase_price'] as num?)?.toDouble(),
        sellingPrice: (map['selling_price'] as num?)?.toDouble(),
      );
}

class ProductModel {
  final int id;
  final String name;
  final String sku;
  final String? barcode;
  final String? description;
  final String? unit;
  final double? purchasePrice;
  final double? sellingPrice;
  final int minStock;
  final bool isActive;
  final String? photo;
  final int? categoryId;
  final Map<String, dynamic>? category;
  final List<ProductUnitModel> units;
  final String createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.sku,
    this.barcode,
    this.description,
    this.unit,
    this.purchasePrice,
    this.sellingPrice,
    required this.minStock,
    required this.isActive,
    this.photo,
    this.categoryId,
    this.category,
    required this.units,
    required this.createdAt,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        sku: map['sku'] ?? '',
        barcode: map['barcode'],
        description: map['description'],
        unit: map['unit'],
        purchasePrice: (map['purchase_price'] as num?)?.toDouble(),
        sellingPrice: (map['selling_price'] as num?)?.toDouble(),
        minStock: map['min_stock'] ?? 0,
        isActive: map['is_active'] ?? true,
        photo: map['photo'],
        categoryId: map['category_id'],
        category: map['category'] is Map
            ? Map<String, dynamic>.from(map['category'] as Map)
            : null,
        units: (map['units'] as List? ?? [])
            .map((e) => ProductUnitModel.fromMap(
                Map<String, dynamic>.from(e as Map)))
            .toList(),
        createdAt: map['created_at'] ?? '',
      );
}

class ProductListResponseModel {
  final bool success;
  final List<ProductModel> data;
  final PaginationMeta? meta;

  ProductListResponseModel(
      {required this.success, required this.data, this.meta});

  factory ProductListResponseModel.fromJson(String str) =>
      ProductListResponseModel.fromMap(
          Map<String, dynamic>.from(jsonDecode(str) as Map));

  factory ProductListResponseModel.fromMap(Map<String, dynamic> map) {
    final rawData = map['data'];
    List<ProductModel> items = [];
    PaginationMeta? meta;

    if (rawData is Map) {
      items = (rawData['data'] as List? ?? [])
          .map((e) => ProductModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(rawData));
    } else if (rawData is List) {
      items = rawData
          .map((e) => ProductModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
    }

    return ProductListResponseModel(
        success: map['success'] ?? false, data: items, meta: meta);
  }
}

class ProductResponseModel {
  final bool success;
  final String? message;
  final ProductModel? data;

  ProductResponseModel({required this.success, this.message, this.data});

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(
          Map<String, dynamic>.from(jsonDecode(str) as Map));

  factory ProductResponseModel.fromMap(Map<String, dynamic> map) =>
      ProductResponseModel(
        success: map['success'] ?? false,
        message: map['message'],
        data: map['data'] != null
            ? ProductModel.fromMap(
                Map<String, dynamic>.from(map['data'] as Map))
            : null,
      );
}




