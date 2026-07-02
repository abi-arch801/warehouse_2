// lib/data/model/admin/warehouse/admin_warehouse_model.dart

import 'dart:convert';

// ─── Safe parsing helpers (sama persis dengan pola project) ──────────────────
double? _safeDouble(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v);
  return null;
}

int? _safeInt(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

bool? _safeBool(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v;
  if (v is int) return v == 1;
  if (v is String) return v == '1' || v.toLowerCase() == 'true';
  return null;
}
// ─────────────────────────────────────────────────────────────────────────────

// ══════════════════════════════════════════════════════════════════════════════
// REQUEST MODELS
// ══════════════════════════════════════════════════════════════════════════════

class AdminStoreWarehouseRequest {
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;
  final bool isActive;

  AdminStoreWarehouseRequest({
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
    this.isActive = true,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'code': code,
        'location': location,
        'pic_name': picName,
        'pic_phone': picPhone,
        'is_active': isActive,
      };

  String toJson() => jsonEncode(toMap());
}

class AdminUpdateWarehouseRequest {
  final String? name;
  final String? code;
  final String? location;
  final String? picName;
  final String? picPhone;
  final bool? isActive;

  AdminUpdateWarehouseRequest({
    this.name,
    this.code,
    this.location,
    this.picName,
    this.picPhone,
    this.isActive,
  });

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (code != null) 'code': code,
        if (location != null) 'location': location,
        'pic_name': picName,
        'pic_phone': picPhone,
        if (isActive != null) 'is_active': isActive,
      };

  String toJson() => jsonEncode(toMap());
}

// ══════════════════════════════════════════════════════════════════════════════
// CORE MODEL
// ══════════════════════════════════════════════════════════════════════════════

class AdminWarehouseModel {
  final int id;
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;
  final bool isActive;
  final String? photo;
  final int stocksCount;
  final String? createdAt;
  final String? updatedAt;

  AdminWarehouseModel({
    required this.id,
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
    required this.isActive,
    this.photo,
    this.stocksCount = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory AdminWarehouseModel.fromMap(Map<String, dynamic> json) {
    return AdminWarehouseModel(
      id:          _safeInt(json['id']) ?? 0,
      name:        json['name']?.toString() ?? '',
      code:        json['code']?.toString() ?? '',
      location:    json['location']?.toString() ?? '',
      picName:     json['pic_name']?.toString(),
      picPhone:    json['pic_phone']?.toString(),
      isActive:    _safeBool(json['is_active']) ?? true,
      photo:       json['photo']?.toString(),
      stocksCount: _safeInt(json['stocks_count']) ?? 0,
      createdAt:   json['created_at']?.toString(),
      updatedAt:   json['updated_at']?.toString(),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// PAGINATION META
// ══════════════════════════════════════════════════════════════════════════════

class AdminWarehouseMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  AdminWarehouseMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  bool get hasNextPage => currentPage < lastPage;

  factory AdminWarehouseMeta.fromMap(Map<String, dynamic> json) {
    return AdminWarehouseMeta(
      currentPage: _safeInt(json['current_page']) ?? 1,
      lastPage:    _safeInt(json['last_page']) ?? 1,
      perPage:     _safeInt(json['per_page']) ?? 15,
      total:       _safeInt(json['total']) ?? 0,
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// RESPONSE MODELS
// ══════════════════════════════════════════════════════════════════════════════

/// Response GET /admin/warehouses  (paginated)
/// JSON shape dari Laravel paginate():
/// {
///   "success": true,
///   "data": {
///     "data": [...],
///     "current_page": 1,
///     "last_page": 3,
///     "per_page": 15,
///     "total": 40
///   }
/// }
class AdminWarehouseListResponse {
  final bool success;
  final List<AdminWarehouseModel> data;
  final AdminWarehouseMeta meta;

  AdminWarehouseListResponse({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory AdminWarehouseListResponse.fromJson(String str) =>
      AdminWarehouseListResponse.fromMap(jsonDecode(str));

  factory AdminWarehouseListResponse.fromMap(Map<String, dynamic> json) {
    final payload = json['data'];

    if (payload is Map<String, dynamic>) {
      final rawList = payload['data'];
      return AdminWarehouseListResponse(
        success: _safeBool(json['success']) ?? false,
        data: rawList is List
            ? rawList
                .map((e) => AdminWarehouseModel.fromMap(e as Map<String, dynamic>))
                .toList()
            : [],
        meta: AdminWarehouseMeta.fromMap(payload),
      );
    }

    // Fallback: data langsung berupa list (non-paginated)
    if (payload is List) {
      return AdminWarehouseListResponse(
        success: _safeBool(json['success']) ?? false,
        data: payload
            .map((e) => AdminWarehouseModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        meta: AdminWarehouseMeta(
          currentPage: 1,
          lastPage:    1,
          perPage:     payload.length,
          total:       payload.length,
        ),
      );
    }

    return AdminWarehouseListResponse(
      success: false,
      data:    [],
      meta:    AdminWarehouseMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 0),
    );
  }
}

/// Response POST /admin/warehouses & PUT /admin/warehouses/{id}
/// JSON shape:
/// {
///   "success": true,
///   "message": "Gudang berhasil dibuat.",
///   "data": { ...warehouse }
/// }
class AdminWarehouseSingleResponse {
  final bool success;
  final String? message;
  final AdminWarehouseModel? data;

  AdminWarehouseSingleResponse({
    required this.success,
    this.message,
    this.data,
  });

  factory AdminWarehouseSingleResponse.fromJson(String str) =>
      AdminWarehouseSingleResponse.fromMap(jsonDecode(str));

  factory AdminWarehouseSingleResponse.fromMap(Map<String, dynamic> json) {
    return AdminWarehouseSingleResponse(
      success: _safeBool(json['success']) ?? false,
      message: json['message']?.toString(),
      data:    json['data'] != null
          ? AdminWarehouseModel.fromMap(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Response DELETE /admin/warehouses/{id}
/// JSON shape:
/// {
///   "success": true,
///   "message": "Gudang berhasil dihapus."
/// }
class AdminWarehouseDeleteResponse {
  final bool success;
  final String message;

  AdminWarehouseDeleteResponse({
    required this.success,
    required this.message,
  });

  factory AdminWarehouseDeleteResponse.fromJson(String str) =>
      AdminWarehouseDeleteResponse.fromMap(jsonDecode(str));

  factory AdminWarehouseDeleteResponse.fromMap(Map<String, dynamic> json) {
    return AdminWarehouseDeleteResponse(
      success: _safeBool(json['success']) ?? false,
      message: json['message']?.toString() ?? '',
    );
  }
}