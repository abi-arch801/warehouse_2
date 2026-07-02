// import 'dart:convert';
// import 'package:warehouse/data/model/response/pagination_meta.dart';

// class WarehouseModel {
//   final int id;
//   final String name;
//   final String code;
//   final String location;
//   final String? picName;
//   final String? picPhone;
//   final bool isActive;
//   final String? photo;
//   final int? stocksCount;
//   final String createdAt;

//   WarehouseModel({
//     required this.id,
//     required this.name,
//     required this.code,
//     required this.location,
//     this.picName,
//     this.picPhone,
//     required this.isActive,
//     this.photo,
//     this.stocksCount,
//     required this.createdAt,
//   });

//   factory WarehouseModel.fromMap(Map<String, dynamic> map) =>
//       WarehouseModel(
//         id: map['id'] ?? 0,
//         name: map['name'] ?? '',
//         code: map['code'] ?? '',
//         location: map['location'] ?? '',
//         picName: map['pic_name'],
//         picPhone: map['pic_phone'],
//         isActive: map['is_active'] ?? true,
//         photo: map['photo'],
//         stocksCount: map['stocks_count'],
//         createdAt: map['created_at'] ?? '',
//       );
// }

// class WarehouseListResponseModel {
//   final bool success;
//   final List<WarehouseModel> data;
//   final PaginationMeta? meta;

//   WarehouseListResponseModel(
//       {required this.success, required this.data, this.meta});

//   factory WarehouseListResponseModel.fromJson(String str) =>
//       WarehouseListResponseModel.fromMap(jsonDecode(str));

//   factory WarehouseListResponseModel.fromMap(Map<String, dynamic> map) {
//     final rawData = map['data'];
//     List<WarehouseModel> items = [];
//     PaginationMeta? meta;

//     if (rawData is Map) {
//       items = (rawData['data'] as List? ?? [])
//           .map((e) => WarehouseModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(rawData);
//     } else if (rawData is List) {
//       items = rawData.map((e) => WarehouseModel.fromMap(e)).toList();
//     }

//     return WarehouseListResponseModel(
//         success: map['success'] ?? false, data: items, meta: meta);
//   }
// }

// class WarehouseResponseModel {
//   final bool success;
//   final String? message;
//   final WarehouseModel? data;

//   WarehouseResponseModel({required this.success, this.message, this.data});

//   factory WarehouseResponseModel.fromJson(String str) =>
//       WarehouseResponseModel.fromMap(jsonDecode(str));

//   factory WarehouseResponseModel.fromMap(Map<String, dynamic> map) =>
//       WarehouseResponseModel(
//         success: map['success'] ?? false,
//         message: map['message'],
//         data: map['data'] != null
//             ? WarehouseModel.fromMap(map['data'])
//             : null,
//       );
// }

import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

class WarehouseModel {
  final int id;
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;
  final bool isActive;
  final String? photo;
  final int? stocksCount;
  final String createdAt;

  WarehouseModel({
    required this.id,
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
    required this.isActive,
    this.photo,
    this.stocksCount,
    required this.createdAt,
  });

  factory WarehouseModel.fromMap(Map<String, dynamic> map) => WarehouseModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        code: map['code'] ?? '',
        location: map['location'] ?? '',
        picName: map['pic_name'],
        picPhone: map['pic_phone'],
        isActive: map['is_active'] ?? true,
        photo: map['photo'],
        stocksCount: map['stocks_count'],
        createdAt: map['created_at'] ?? '',
      );
}

class WarehouseListResponseModel {
  final bool success;
  final List<WarehouseModel> data;
  final PaginationMeta? meta;

  WarehouseListResponseModel(
      {required this.success, required this.data, this.meta});

  factory WarehouseListResponseModel.fromJson(String str) =>
      WarehouseListResponseModel.fromMap(
          Map<String, dynamic>.from(jsonDecode(str) as Map));

  factory WarehouseListResponseModel.fromMap(Map<String, dynamic> map) {
    final rawData = map['data'];
    List<WarehouseModel> items = [];
    PaginationMeta? meta;

    if (rawData is Map) {
      items = (rawData['data'] as List? ?? [])
          .map((e) =>
              WarehouseModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(rawData));
    } else if (rawData is List) {
      items = rawData
          .map((e) =>
              WarehouseModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
    }

    return WarehouseListResponseModel(
        success: map['success'] ?? false, data: items, meta: meta);
  }
}

class WarehouseResponseModel {
  final bool success;
  final String? message;
  final WarehouseModel? data;

  WarehouseResponseModel({required this.success, this.message, this.data});

  factory WarehouseResponseModel.fromJson(String str) =>
      WarehouseResponseModel.fromMap(
          Map<String, dynamic>.from(jsonDecode(str) as Map));

  factory WarehouseResponseModel.fromMap(Map<String, dynamic> map) =>
      WarehouseResponseModel(
        success: map['success'] ?? false,
        message: map['message'],
        data: map['data'] != null
            ? WarehouseModel.fromMap(
                Map<String, dynamic>.from(map['data'] as Map))
            : null,
      );
}

// warehouse_request_model.dart
class StoreWarehouseRequestModel {
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;

  StoreWarehouseRequestModel({
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'location': location,
        if (picName != null) 'pic_name': picName,
        if (picPhone != null) 'pic_phone': picPhone,
      };
}

class UpdateWarehouseRequestModel {
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;

  UpdateWarehouseRequestModel({
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'location': location,
        if (picName != null) 'pic_name': picName,
        if (picPhone != null) 'pic_phone': picPhone,
      };
}

