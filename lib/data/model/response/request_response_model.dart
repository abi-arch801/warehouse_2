import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Laravel response untuk request_items:
//   id, request_id, product_id, quantity, approved_quantity, note
//   product: { id, name, sku, unit }
// ─────────────────────────────────────────────────────────────────────────────

class RequestItemModel {
  final int id;
  final int requestId;
  final int productId;
  final int requestedQuantity;    // Laravel field: 'quantity'
  final int? approvedQuantity;
  final String? note;
  final Map<String, dynamic>? product;

  RequestItemModel({
    required this.id,
    required this.requestId,
    required this.productId,
    required this.requestedQuantity,
    this.approvedQuantity,
    this.note,
    this.product,
  });

  factory RequestItemModel.fromMap(Map<String, dynamic> map) => RequestItemModel(
        id: map['id'] ?? 0,
        requestId: map['request_id'] ?? 0,
        productId: map['product_id'] ?? 0,
        requestedQuantity: map['quantity'] ?? 0,      // ← Laravel: 'quantity'
        approvedQuantity: map['approved_quantity'],
        note: map['note'],
        product: map['product'] is Map
            ? Map<String, dynamic>.from(map['product'])
            : null,
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Laravel response untuk requests:
//   id, request_number, user_id, warehouse_id, purpose, status,
//   approved_by, approved_at, completed_at, reject_reason,
//   note (bukan notes), created_at, updated_at
// ─────────────────────────────────────────────────────────────────────────────

class StockRequestModel {
  final int id;
  final String? requestNumber;
  final int userId;
  final int? warehouseId;
  final String purpose;
  final String status;
  final String? note;             // Laravel field: 'note' (bukan 'notes')
  final String? rejectReason;
  final String? approvedAt;
  final String? completedAt;
  final String createdAt;
  final String updatedAt;
  final List<RequestItemModel> items;
  final Map<String, dynamic>? user;
  final Map<String, dynamic>? approvedBy;

  StockRequestModel({
    required this.id,
    this.requestNumber,
    required this.userId,
    this.warehouseId,
    required this.purpose,
    required this.status,
    this.note,
    this.rejectReason,
    this.approvedAt,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
    this.user,
    this.approvedBy,
  });

  // Getter untuk backward-compat di UI yang masih pakai .notes
  String? get notes => note;

  factory StockRequestModel.fromMap(Map<String, dynamic> map) =>
      StockRequestModel(
        id: map['id'] ?? 0,
        requestNumber: map['request_number'],
        userId: map['user_id'] ?? 0,
        warehouseId: map['warehouse_id'],
        purpose: map['purpose'] ?? '',
        status: map['status'] ?? 'pending',
        note: map['note'],                            // ← Laravel: 'note'
        rejectReason: map['reject_reason'],
        approvedAt: map['approved_at'],
        completedAt: map['completed_at'],
        createdAt: map['created_at'] ?? '',
        updatedAt: map['updated_at'] ?? '',
        items: (map['items'] as List? ?? [])
            .map((e) => RequestItemModel.fromMap(e))
            .toList(),
        user: map['user'] is Map
            ? Map<String, dynamic>.from(map['user'])
            : null,
        approvedBy: map['approved_by'] is Map
            ? Map<String, dynamic>.from(map['approved_by'])
            : null,
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// List response — Laravel paginate() nesting: data.data
// ─────────────────────────────────────────────────────────────────────────────

class StockRequestListResponseModel {
  final bool success;
  final List<StockRequestModel> data;
  final PaginationMeta? meta;

  StockRequestListResponseModel({
    required this.success,
    required this.data,
    this.meta,
  });

  factory StockRequestListResponseModel.fromJson(String str) =>
      StockRequestListResponseModel.fromMap(jsonDecode(str));

  factory StockRequestListResponseModel.fromMap(Map<String, dynamic> map) {
    final rawData = map['data'];
    List<StockRequestModel> items = [];
    PaginationMeta? meta;

    if (rawData is Map) {
      // Laravel paginate() → { data: { data: [...], current_page, ... } }
      items = (rawData['data'] as List? ?? [])
          .map((e) => StockRequestModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(rawData));
    } else if (rawData is List) {
      items = rawData.map((e) => StockRequestModel.fromMap(e)).toList();
    }

    return StockRequestListResponseModel(
      success: map['success'] ?? false,
      data: items,
      meta: meta,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single response
// ─────────────────────────────────────────────────────────────────────────────

class StockRequestResponseModel {
  final bool success;
  final String? message;
  final StockRequestModel? data;

  StockRequestResponseModel({
    required this.success,
    this.message,
    this.data,
  });

  factory StockRequestResponseModel.fromJson(String str) =>
      StockRequestResponseModel.fromMap(jsonDecode(str));

  factory StockRequestResponseModel.fromMap(Map<String, dynamic> map) =>
      StockRequestResponseModel(
        success: map['success'] ?? false,
        message: map['message'],
        data: map['data'] != null
            ? StockRequestModel.fromMap(map['data'])
            : null,
      );
}




