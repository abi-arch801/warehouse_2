// import 'dart:convert';
// import 'package:warehouse/data/model/response/pagination_meta.dart';

// // ── Stock Movement (migration: stock_movements) ───────────────────────────
// // type: in | out | transfer_in | transfer_out | adjustment
// class StockMovementModel {
//   final int id;
//   final int productId;
//   final int warehouseId;
//   final String type;
//   final int quantity;
//   final int quantityBefore;
//   final int quantityAfter;
//   final String?
//       referenceType; // request | purchase_order | stock_transfer | stock_opname | manual
//   final int? referenceId;
//   final int createdBy;
//   final String? note;
//   final String createdAt;
//   final Map<String, dynamic>? product;
//   final Map<String, dynamic>? warehouse;

//   const StockMovementModel({
//     required this.id,
//     required this.productId,
//     required this.warehouseId,
//     required this.type,
//     required this.quantity,
//     required this.quantityBefore,
//     required this.quantityAfter,
//     this.referenceType,
//     this.referenceId,
//     required this.createdBy,
//     this.note,
//     required this.createdAt,
//     this.product,
//     this.warehouse,
//   });

//   factory StockMovementModel.fromMap(Map<String, dynamic> m) =>
//       StockMovementModel(
//         id: m['id'] ?? 0,
//         productId: m['product_id'] ?? 0,
//         warehouseId: m['warehouse_id'] ?? 0,
//         type: m['type'] ?? 'in',
//         quantity: m['quantity'] ?? 0,
//         quantityBefore: m['quantity_before'] ?? 0,
//         quantityAfter: m['quantity_after'] ?? 0,
//         referenceType: m['reference_type'],
//         referenceId: m['reference_id'],
//         createdBy: m['created_by'] ?? 0,
//         note: m['note'],
//         createdAt: m['created_at'] ?? '',
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//       );
// }

// // ── Stock Report (migration: stock_reports) ───────────────────────────────
// class StockReportModel {
//   final int id;
//   final int warehouseId;
//   final int productId;
//   final String periodType; // daily | monthly
//   final String periodDate;
//   final int openingStock;
//   final int stockIn;
//   final int stockOut;
//   final int transferIn;
//   final int transferOut;
//   final int adjustment;
//   final int closingStock;
//   final double totalValue;
//   final Map<String, dynamic>? product;
//   final Map<String, dynamic>? warehouse;

//   const StockReportModel({
//     required this.id,
//     required this.warehouseId,
//     required this.productId,
//     required this.periodType,
//     required this.periodDate,
//     required this.openingStock,
//     required this.stockIn,
//     required this.stockOut,
//     required this.transferIn,
//     required this.transferOut,
//     required this.adjustment,
//     required this.closingStock,
//     required this.totalValue,
//     this.product,
//     this.warehouse,
//   });

//   factory StockReportModel.fromMap(Map<String, dynamic> m) => StockReportModel(
//         id: m['id'] ?? 0,
//         warehouseId: m['warehouse_id'] ?? 0,
//         productId: m['product_id'] ?? 0,
//         periodType: m['period_type'] ?? 'daily',
//         periodDate: m['period_date'] ?? '',
//         openingStock: m['opening_stock'] ?? 0,
//         stockIn: m['stock_in'] ?? 0,
//         stockOut: m['stock_out'] ?? 0,
//         transferIn: m['transfer_in'] ?? 0,
//         transferOut: m['transfer_out'] ?? 0,
//         adjustment: m['adjustment'] ?? 0,
//         closingStock: m['closing_stock'] ?? 0,
//         totalValue: (m['total_value'] as num?)?.toDouble() ?? 0,
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//       );
// }

// // ── Stock Opname Item (migration: stock_opname_items) ─────────────────────
// class StockOpnameItemModel {
//   final int id;
//   final int stockOpnameId;
//   final int productId;
//   final int systemStock;
//   final int physicalStock;
//   final int difference; // storedAs: physical_stock - system_stock
//   final String? notes;
//   final Map<String, dynamic>? product;

//   const StockOpnameItemModel({
//     required this.id,
//     required this.stockOpnameId,
//     required this.productId,
//     required this.systemStock,
//     required this.physicalStock,
//     required this.difference,
//     this.notes,
//     this.product,
//   });

//   factory StockOpnameItemModel.fromMap(Map<String, dynamic> m) =>
//       StockOpnameItemModel(
//         id: m['id'] ?? 0,
//         stockOpnameId: m['stock_opname_id'] ?? 0,
//         productId: m['product_id'] ?? 0,
//         systemStock: m['system_stock'] ?? 0,
//         physicalStock: m['physical_stock'] ?? 0,
//         difference: m['difference'] ??
//             (m['physical_stock'] ?? 0) - (m['system_stock'] ?? 0),
//         notes: m['notes'],
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//       );
// }

// // ── Stock Opname (migration: stock_opnames) ───────────────────────────────
// // Status: draft | in_progress | pending_approval | approved | cancelled
// class StockOpnameModel {
//   final int id;
//   final String opnameNumber;
//   final int warehouseId;
//   final int createdBy;        // ✅ tetap int, ambil dari nested object
//   final String? createdByName; // ✅ tambah nama
//   final int? approvedBy;
//   final String status;
//   final String opnameDate;
//   final String? startedAt;
//   final String? completedAt;
//   final String? approvedAt;
//   final String? notes;
//   final String? rejectReason;
//   final List<StockOpnameItemModel> items;
//   final Map<String, dynamic>? warehouse;

//   const StockOpnameModel({
//     required this.id,
//     required this.opnameNumber,
//     required this.warehouseId,
//     required this.createdBy,
//     this.createdByName,
//     this.approvedBy,
//     required this.status,
//     required this.opnameDate,
//     this.startedAt,
//     this.completedAt,
//     this.approvedAt,
//     this.notes,
//     this.rejectReason,
//     this.items = const [],
//     this.warehouse,
//   });

//   factory StockOpnameModel.fromMap(Map<String, dynamic> m) {
//     // ✅ created_by bisa berupa int atau object {"id":..,"name":..}
//     final createdByRaw = m['created_by'];
//     final int createdById;
//     final String? createdByName;
//     if (createdByRaw is Map) {
//       createdById = createdByRaw['id'] ?? 0;
//       createdByName = createdByRaw['name'];
//     } else {
//       createdById = createdByRaw ?? 0;
//       createdByName = null;
//     }

//     // ✅ approved_by bisa berupa int atau object atau null
//     final approvedByRaw = m['approved_by'];
//     final int? approvedById;
//     if (approvedByRaw is Map) {
//       approvedById = approvedByRaw['id'];
//     } else {
//       approvedById = approvedByRaw;
//     }

//     return StockOpnameModel(
//       id: m['id'] ?? 0,
//       opnameNumber: m['opname_number'] ?? '',
//       warehouseId: m['warehouse_id'] ?? 0,
//       createdBy: createdById,
//       createdByName: createdByName,
//       approvedBy: approvedById,
//       status: m['status'] ?? 'draft',
//       opnameDate: m['opname_date'] ?? '',
//       startedAt: m['started_at'],
//       completedAt: m['completed_at'],
//       approvedAt: m['approved_at'],
//       notes: m['notes'],
//       rejectReason: m['reject_reason'],
//       items: (m['items'] as List? ?? [])
//           .map((e) => StockOpnameItemModel.fromMap(e))
//           .toList(),
//       warehouse: m['warehouse'] is Map
//           ? Map<String, dynamic>.from(m['warehouse'])
//           : null,
//     );
//   }
// }
// // ── Response wrappers ──────────────────────────────────────────────────────
// class StockMovementListResponse {
//   final bool success;
//   final List<StockMovementModel> data;
//   final PaginationMeta? meta;
//   const StockMovementListResponse(
//       {required this.success, required this.data, this.meta});

//   factory StockMovementListResponse.fromJson(String s) =>
//       StockMovementListResponse.fromMap(jsonDecode(s));

//   factory StockMovementListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<StockMovementModel> items = [];
//     PaginationMeta? meta;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? [])
//           .map((e) => StockMovementModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
//     } else if (raw is List) {
//       items = raw.map((e) => StockMovementModel.fromMap(e)).toList();
//     }
//     return StockMovementListResponse(
//         success: m['success'] ?? false, data: items, meta: meta);
//   }
// }

// class StockOpnameListResponse {
//   final bool success;
//   final List<StockOpnameModel> data;
//   final PaginationMeta? meta;
//   const StockOpnameListResponse(
//       {required this.success, required this.data, this.meta});

//   factory StockOpnameListResponse.fromJson(String s) =>
//       StockOpnameListResponse.fromMap(jsonDecode(s));

//   factory StockOpnameListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<StockOpnameModel> items = [];
//     PaginationMeta? meta;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? [])
//           .map((e) => StockOpnameModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
//     } else if (raw is List) {
//       items = raw.map((e) => StockOpnameModel.fromMap(e)).toList();
//     }
//     return StockOpnameListResponse(
//         success: m['success'] ?? false, data: items, meta: meta);
//   }
// }

// class StockOpnameSingleResponse {
//   final bool success;
//   final String? message;
//   final StockOpnameModel? data;
//   const StockOpnameSingleResponse(
//       {required this.success, this.message, this.data});

//   factory StockOpnameSingleResponse.fromJson(String s) =>
//       StockOpnameSingleResponse.fromMap(jsonDecode(s));

//   factory StockOpnameSingleResponse.fromMap(Map<String, dynamic> m) =>
//       StockOpnameSingleResponse(
//         success: m['success'] ?? false,
//         message: m['message'],
//         data: m['data'] != null ? StockOpnameModel.fromMap(m['data']) : null,
//       );
// }

/////////code before 2206
// import 'dart:convert';
// import 'package:warehouse/data/model/response/pagination_meta.dart';

// // ── Helper: ambil int dari field yang bisa int atau Map ───────────────────
// int _parseInt(dynamic v, [int fallback = 0]) {
//   if (v is int) return v;
//   if (v is Map) return (v['id'] as int?) ?? fallback;
//   if (v is num) return v.toInt();
//   return fallback;
// }

// int? _parseIntNullable(dynamic v) {
//   if (v == null) return null;
//   if (v is int) return v;
//   if (v is Map) return v['id'] as int?;
//   if (v is num) return v.toInt();
//   return null;
// }

// // ── Stock Movement ────────────────────────────────────────────────────────
// class StockMovementModel {
//   final int id;
//   final int productId;
//   final int warehouseId;
//   final String type;
//   final int quantity;
//   final int quantityBefore;
//   final int quantityAfter;
//   final String? referenceType;
//   final int? referenceId;
//   final int createdBy;
//   final String? createdByName;
//   final String? note;
//   final String createdAt;
//   final Map<String, dynamic>? product;
//   final Map<String, dynamic>? warehouse;

//   const StockMovementModel({
//     required this.id,
//     required this.productId,
//     required this.warehouseId,
//     required this.type,
//     required this.quantity,
//     required this.quantityBefore,
//     required this.quantityAfter,
//     this.referenceType,
//     this.referenceId,
//     required this.createdBy,
//     this.createdByName,
//     this.note,
//     required this.createdAt,
//     this.product,
//     this.warehouse,
//   });

//   factory StockMovementModel.fromMap(Map<String, dynamic> m) =>
//       StockMovementModel(
//         id: _parseInt(m['id']),
//         productId: _parseInt(m['product_id']),
//         warehouseId: _parseInt(m['warehouse_id']),
//         type: m['type'] ?? 'in',
//         quantity: _parseInt(m['quantity']),
//         quantityBefore: _parseInt(m['quantity_before']),
//         quantityAfter: _parseInt(m['quantity_after']),
//         referenceType: m['reference_type'],
//         referenceId: _parseIntNullable(m['reference_id']),
//         // ✅ created_by bisa object atau int
//         createdBy: _parseInt(m['created_by']),
//         createdByName: m['created_by'] is Map ? m['created_by']['name'] : null,
//         note: m['note'],
//         createdAt: m['created_at'] ?? '',
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//       );
// }

// // ── Stock Report ──────────────────────────────────────────────────────────
// class StockReportModel {
//   final int id;
//   final int warehouseId;
//   final int productId;
//   final String periodType;
//   final String periodDate;
//   final int openingStock;
//   final int stockIn;
//   final int stockOut;
//   final int transferIn;
//   final int transferOut;
//   final int adjustment;
//   final int closingStock;
//   final double totalValue;
//   final Map<String, dynamic>? product;
//   final Map<String, dynamic>? warehouse;

//   const StockReportModel({
//     required this.id,
//     required this.warehouseId,
//     required this.productId,
//     required this.periodType,
//     required this.periodDate,
//     required this.openingStock,
//     required this.stockIn,
//     required this.stockOut,
//     required this.transferIn,
//     required this.transferOut,
//     required this.adjustment,
//     required this.closingStock,
//     required this.totalValue,
//     this.product,
//     this.warehouse,
//   });

//   factory StockReportModel.fromMap(Map<String, dynamic> m) => StockReportModel(
//         id: _parseInt(m['id']),
//         warehouseId: _parseInt(m['warehouse_id']),
//         productId: _parseInt(m['product_id']),
//         periodType: m['period_type'] ?? 'daily',
//         periodDate: m['period_date'] ?? '',
//         openingStock: _parseInt(m['opening_stock']),
//         stockIn: _parseInt(m['stock_in']),
//         stockOut: _parseInt(m['stock_out']),
//         transferIn: _parseInt(m['transfer_in']),
//         transferOut: _parseInt(m['transfer_out']),
//         adjustment: _parseInt(m['adjustment']),
//         closingStock: _parseInt(m['closing_stock']),
//         totalValue: (m['total_value'] as num?)?.toDouble() ?? 0,
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//       );
// }

// // ── Stock Opname Item ─────────────────────────────────────────────────────
// class StockOpnameItemModel {
//   final int id;
//   final int stockOpnameId;
//   final int productId;
//   final int systemStock;
//   final int physicalStock;
//   final int difference;
//   final String? notes;
//   final Map<String, dynamic>? product;

//   const StockOpnameItemModel({
//     required this.id,
//     required this.stockOpnameId,
//     required this.productId,
//     required this.systemStock,
//     required this.physicalStock,
//     required this.difference,
//     this.notes,
//     this.product,
//   });

//   factory StockOpnameItemModel.fromMap(Map<String, dynamic> m) =>
//       StockOpnameItemModel(
//         id: _parseInt(m['id']),
//         stockOpnameId: _parseInt(m['stock_opname_id']),
//         productId: _parseInt(m['product_id']),
//         systemStock: _parseInt(m['system_stock']),
//         physicalStock: _parseInt(m['physical_stock']),
//         difference: m['difference'] != null
//             ? _parseInt(m['difference'])
//             : _parseInt(m['physical_stock']) - _parseInt(m['system_stock']),
//         notes: m['notes'],
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//       );
// }

// // ── Stock Opname ──────────────────────────────────────────────────────────
// class StockOpnameModel {
//   final int id;
//   final String opnameNumber;
//   final int warehouseId;
//   final int createdBy;
//   final String? createdByName;
//   final int? approvedBy;
//   final String? approvedByName;
//   final String status;
//   final String opnameDate;
//   final String? startedAt;
//   final String? completedAt;
//   final String? approvedAt;
//   final String? notes;
//   final String? rejectReason;
//   final List<StockOpnameItemModel> items;
//   final Map<String, dynamic>? warehouse;

//   const StockOpnameModel({
//     required this.id,
//     required this.opnameNumber,
//     required this.warehouseId,
//     required this.createdBy,
//     this.createdByName,
//     this.approvedBy,
//     this.approvedByName,
//     required this.status,
//     required this.opnameDate,
//     this.startedAt,
//     this.completedAt,
//     this.approvedAt,
//     this.notes,
//     this.rejectReason,
//     this.items = const [],
//     this.warehouse,
//   });

//   factory StockOpnameModel.fromMap(Map<String, dynamic> m) => StockOpnameModel(
//         id: _parseInt(m['id']),
//         opnameNumber: m['opname_number'] ?? '',
//         warehouseId: _parseInt(m['warehouse_id']),
//         // ✅ created_by & approved_by: handle int atau object
//         createdBy: _parseInt(m['created_by']),
//         createdByName: m['created_by'] is Map ? m['created_by']['name'] : null,
//         approvedBy: _parseIntNullable(m['approved_by']),
//         approvedByName:
//             m['approved_by'] is Map ? m['approved_by']['name'] : null,
//         status: m['status'] ?? 'draft',
//         opnameDate: m['opname_date'] ?? '',
//         startedAt: m['started_at'],
//         completedAt: m['completed_at'],
//         approvedAt: m['approved_at'],
//         notes: m['notes'],
//         rejectReason: m['reject_reason'],
//         items: (m['items'] as List? ?? [])
//             .map((e) => StockOpnameItemModel.fromMap(e))
//             .toList(),
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//       );
// }

// // ── Response Wrappers ─────────────────────────────────────────────────────
// class StockMovementListResponse {
//   final bool success;
//   final List<StockMovementModel> data;
//   final PaginationMeta? meta;
//   const StockMovementListResponse(
//       {required this.success, required this.data, this.meta});

//   factory StockMovementListResponse.fromJson(String s) =>
//       StockMovementListResponse.fromMap(jsonDecode(s));

//   factory StockMovementListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<StockMovementModel> items = [];
//     PaginationMeta? meta;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? [])
//           .map((e) => StockMovementModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
//     } else if (raw is List) {
//       items = raw.map((e) => StockMovementModel.fromMap(e)).toList();
//     }
//     return StockMovementListResponse(
//         success: m['success'] ?? false, data: items, meta: meta);
//   }
// }

// class StockOpnameListResponse {
//   final bool success;
//   final List<StockOpnameModel> data;
//   final PaginationMeta? meta;
//   const StockOpnameListResponse(
//       {required this.success, required this.data, this.meta});

//   factory StockOpnameListResponse.fromJson(String s) =>
//       StockOpnameListResponse.fromMap(jsonDecode(s));

//   factory StockOpnameListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<StockOpnameModel> items = [];
//     PaginationMeta? meta;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? [])
//           .map((e) => StockOpnameModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
//     } else if (raw is List) {
//       items = raw.map((e) => StockOpnameModel.fromMap(e)).toList();
//     }
//     return StockOpnameListResponse(
//         success: m['success'] ?? false, data: items, meta: meta);
//   }
// }

// class StockOpnameSingleResponse {
//   final bool success;
//   final String? message;
//   final StockOpnameModel? data;
//   const StockOpnameSingleResponse(
//       {required this.success, this.message, this.data});

//   factory StockOpnameSingleResponse.fromJson(String s) =>
//       StockOpnameSingleResponse.fromMap(jsonDecode(s));

//   factory StockOpnameSingleResponse.fromMap(Map<String, dynamic> m) =>
//       StockOpnameSingleResponse(
//         success: m['success'] ?? false,
//         message: m['message'],
//         data: m['data'] is Map
//             ? StockOpnameModel.fromMap(Map<String, dynamic>.from(m['data']))
//             : null,
//       );
// }

/////////////code 2206
///import 'dart:convert';
import 'dart:convert';

import 'package:warehouse/data/model/response/pagination_meta.dart';

// ── Helper ────────────────────────────────────────────────────────────────
int _parseInt(dynamic v, [int fallback = 0]) {
  if (v is int) return v;
  if (v is Map) return (v['id'] as int?) ?? fallback;
  if (v is num) return v.toInt();
  return fallback;
}

int? _parseIntNullable(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is Map) return v['id'] as int?;
  if (v is num) return v.toInt();
  return null;
}

// ── Stock Movement ────────────────────────────────────────────────────────
class StockMovementModel {
  final int id;
  final int productId;
  final int warehouseId;
  final String type;
  final int quantity;
  final int quantityBefore;
  final int quantityAfter;
  final String? referenceType;
  final int? referenceId;
  final int createdBy;
  final String? createdByName;
  final String? note;
  final String createdAt;
  final Map<String, dynamic>? product;
  final Map<String, dynamic>? warehouse;

  const StockMovementModel({
    required this.id,
    required this.productId,
    required this.warehouseId,
    required this.type,
    required this.quantity,
    required this.quantityBefore,
    required this.quantityAfter,
    this.referenceType,
    this.referenceId,
    required this.createdBy,
    this.createdByName,
    this.note,
    required this.createdAt,
    this.product,
    this.warehouse,
  });

  factory StockMovementModel.fromMap(Map<String, dynamic> m) =>
      StockMovementModel(
        id: _parseInt(m['id']),
        productId: _parseInt(m['product_id']),
        warehouseId: _parseInt(m['warehouse_id']),
        type: m['type'] ?? 'in',
        quantity: _parseInt(m['quantity']),
        quantityBefore: _parseInt(m['quantity_before']),
        quantityAfter: _parseInt(m['quantity_after']),
        referenceType: m['reference_type'],
        referenceId: _parseIntNullable(m['reference_id']),
        createdBy: _parseInt(m['created_by']),
        createdByName: m['created_by'] is Map ? m['created_by']['name'] : null,
        note: m['note'],
        createdAt: m['created_at'] ?? '',
        product: m['product'] is Map
            ? Map<String, dynamic>.from(m['product'])
            : null,
        warehouse: m['warehouse'] is Map
            ? Map<String, dynamic>.from(m['warehouse'])
            : null,
      );
}

// ── Stock Report ──────────────────────────────────────────────────────────
class StockReportModel {
  final int id;
  final int warehouseId;
  final int productId;
  final String periodType;
  final String periodDate;
  final int openingStock;
  final int stockIn;
  final int stockOut;
  final int transferIn;
  final int transferOut;
  final int adjustment;
  final int closingStock;
  final double totalValue;
  final Map<String, dynamic>? product;
  final Map<String, dynamic>? warehouse;

  const StockReportModel({
    required this.id,
    required this.warehouseId,
    required this.productId,
    required this.periodType,
    required this.periodDate,
    required this.openingStock,
    required this.stockIn,
    required this.stockOut,
    required this.transferIn,
    required this.transferOut,
    required this.adjustment,
    required this.closingStock,
    required this.totalValue,
    this.product,
    this.warehouse,
  });

  factory StockReportModel.fromMap(Map<String, dynamic> m) => StockReportModel(
        id: _parseInt(m['id']),
        warehouseId: _parseInt(m['warehouse_id']),
        productId: _parseInt(m['product_id']),
        periodType: m['period_type'] ?? 'daily',
        periodDate: m['period_date'] ?? '',
        openingStock: _parseInt(m['opening_stock']),
        stockIn: _parseInt(m['stock_in']),
        stockOut: _parseInt(m['stock_out']),
        transferIn: _parseInt(m['transfer_in']),
        transferOut: _parseInt(m['transfer_out']),
        adjustment: _parseInt(m['adjustment']),
        closingStock: _parseInt(m['closing_stock']),
        totalValue: (m['total_value'] as num?)?.toDouble() ?? 0,
        product: m['product'] is Map
            ? Map<String, dynamic>.from(m['product'])
            : null,
        warehouse: m['warehouse'] is Map
            ? Map<String, dynamic>.from(m['warehouse'])
            : null,
      );
}

// ── Stock Opname Item ─────────────────────────────────────────────────────
// physicalStock & difference sekarang NULLABLE (belum diisi = null)
class StockOpnameItemModel {
  final int id;
  final int stockOpnameId;
  final int productId;
  final int systemStock;
  final int? physicalStock; // ← nullable
  final int? difference; // ← nullable
  final String? notes;
  final Map<String, dynamic>? product;

  const StockOpnameItemModel({
    required this.id,
    required this.stockOpnameId,
    required this.productId,
    required this.systemStock,
    this.physicalStock,
    this.difference,
    this.notes,
    this.product,
  });

  // Helper: nama produk
  String get productName =>
      product?['name']?.toString() ?? 'Produk #$productId';

  // Helper: SKU
  String get productSku => product?['sku']?.toString() ?? '-';

  // Helper: unit
  String get productUnit => product?['unit']?.toString() ?? 'pcs';

  // Sudah diisi fisik atau belum
  bool get isFilledIn => physicalStock != null;

  // Selisih untuk display (null jika belum diisi)
  int? get displayDifference =>
      physicalStock != null ? physicalStock! - systemStock : null;

  factory StockOpnameItemModel.fromMap(Map<String, dynamic> m) =>
      StockOpnameItemModel(
        id: _parseInt(m['id']),
        stockOpnameId: _parseInt(m['stock_opname_id']),
        productId: _parseInt(m['product_id']),
        systemStock: _parseInt(m['system_stock']),
        // physicalStock: null jika field null di backend
        physicalStock:
            m['physical_stock'] != null ? _parseInt(m['physical_stock']) : null,
        difference: m['difference'] != null ? _parseInt(m['difference']) : null,
        notes: m['notes'],
        product: m['product'] is Map
            ? Map<String, dynamic>.from(m['product'])
            : null,
      );

  // copyWith untuk update di state Flutter (tanpa hit backend)
  StockOpnameItemModel copyWithPhysical(int qty) => StockOpnameItemModel(
        id: id,
        stockOpnameId: stockOpnameId,
        productId: productId,
        systemStock: systemStock,
        physicalStock: qty,
        difference: qty - systemStock,
        notes: notes,
        product: product,
      );
}

// ── Stock Opname ──────────────────────────────────────────────────────────
class StockOpnameModel {
  final int id;
  final String opnameNumber;
  final int warehouseId;
  final String scope; // ← baru: all | category | manual
  final int? categoryId; // ← baru
  final int createdBy;
  final String? createdByName;
  final int? approvedBy;
  final String? approvedByName;
  final String status;
  final String opnameDate;
  final String? startedAt;
  final String? completedAt;
  final String? approvedAt;
  final String? notes;
  final String? rejectReason;
  final List<StockOpnameItemModel> items;
  final Map<String, dynamic>? warehouse;

  const StockOpnameModel({
    required this.id,
    required this.opnameNumber,
    required this.warehouseId,
    this.scope = 'all',
    this.categoryId,
    required this.createdBy,
    this.createdByName,
    this.approvedBy,
    this.approvedByName,
    required this.status,
    required this.opnameDate,
    this.startedAt,
    this.completedAt,
    this.approvedAt,
    this.notes,
    this.rejectReason,
    this.items = const [],
    this.warehouse,
  });

  String get warehouseName =>
      warehouse?['name']?.toString() ?? 'Gudang #$warehouseId';

  // Hitung progress pengisian
  int get filledCount => items.where((i) => i.isFilledIn).length;
  int get totalCount => items.length;
  double get fillProgress => totalCount == 0 ? 0 : filledCount / totalCount;

  // Total selisih absolut
  int get totalDifference =>
      items.fold(0, (sum, i) => sum + (i.difference?.abs() ?? 0));

  // Items dengan selisih (untuk review)
  List<StockOpnameItemModel> get itemsWithDifference =>
      items.where((i) => i.difference != null && i.difference != 0).toList();

  factory StockOpnameModel.fromMap(Map<String, dynamic> m) => StockOpnameModel(
        id: _parseInt(m['id']),
        opnameNumber: m['opname_number'] ?? '',
        warehouseId: _parseInt(m['warehouse_id']),
        scope: m['scope'] ?? 'all',
        categoryId: _parseIntNullable(m['category_id']),
        createdBy: _parseInt(m['created_by']),
        createdByName: m['created_by'] is Map ? m['created_by']['name'] : null,
        approvedBy: _parseIntNullable(m['approved_by']),
        approvedByName:
            m['approved_by'] is Map ? m['approved_by']['name'] : null,
        status: m['status'] ?? 'draft',
        opnameDate: m['opname_date'] ?? '',
        startedAt: m['started_at'],
        completedAt: m['completed_at'],
        approvedAt: m['approved_at'],
        notes: m['notes'],
        rejectReason: m['reject_reason'],
        items: (m['items'] as List? ?? [])
            .map((e) => StockOpnameItemModel.fromMap(e))
            .toList(),
        warehouse: m['warehouse'] is Map
            ? Map<String, dynamic>.from(m['warehouse'])
            : null,
      );
}

// ── Model produk untuk scope=manual ──────────────────────────────────────
class ProductForOpnameModel {
  final int productId;
  final String productName;
  final String productSku;
  final String productUnit;
  final int? categoryId;
  final int currentStock;
  bool isSelected;

  ProductForOpnameModel({
    required this.productId,
    required this.productName,
    required this.productSku,
    required this.productUnit,
    this.categoryId,
    required this.currentStock,
    this.isSelected = false,
  });

  factory ProductForOpnameModel.fromMap(Map<String, dynamic> m) =>
      ProductForOpnameModel(
        productId: _parseInt(m['product_id']),
        productName: m['product_name'] ?? '-',
        productSku: m['product_sku'] ?? '-',
        productUnit: m['product_unit'] ?? 'pcs',
        categoryId: _parseIntNullable(m['category_id']),
        currentStock: _parseInt(m['current_stock']),
      );
}

// ── Response Wrappers ─────────────────────────────────────────────────────
class StockMovementListResponse {
  final bool success;
  final List<StockMovementModel> data;
  final PaginationMeta? meta;
  const StockMovementListResponse(
      {required this.success, required this.data, this.meta});

  factory StockMovementListResponse.fromJson(String s) =>
      StockMovementListResponse.fromMap(jsonDecode(s));

  factory StockMovementListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<StockMovementModel> items = [];
    PaginationMeta? meta;
    if (raw is Map) {
      items = (raw['data'] as List? ?? [])
          .map((e) => StockMovementModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
    } else if (raw is List) {
      items = raw.map((e) => StockMovementModel.fromMap(e)).toList();
    }
    return StockMovementListResponse(
        success: m['success'] ?? false, data: items, meta: meta);
  }
}

class StockOpnameListResponse {
  final bool success;
  final List<StockOpnameModel> data;
  final PaginationMeta? meta;
  const StockOpnameListResponse(
      {required this.success, required this.data, this.meta});

  factory StockOpnameListResponse.fromJson(String s) =>
      StockOpnameListResponse.fromMap(jsonDecode(s));

  factory StockOpnameListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<StockOpnameModel> items = [];
    PaginationMeta? meta;
    if (raw is Map) {
      items = (raw['data'] as List? ?? [])
          .map((e) => StockOpnameModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
    } else if (raw is List) {
      items = raw.map((e) => StockOpnameModel.fromMap(e)).toList();
    }
    return StockOpnameListResponse(
        success: m['success'] ?? false, data: items, meta: meta);
  }
}

class StockOpnameSingleResponse {
  final bool success;
  final String? message;
  final StockOpnameModel? data;
  const StockOpnameSingleResponse(
      {required this.success, this.message, this.data});

  factory StockOpnameSingleResponse.fromJson(String s) =>
      StockOpnameSingleResponse.fromMap(jsonDecode(s));

  factory StockOpnameSingleResponse.fromMap(Map<String, dynamic> m) =>
      StockOpnameSingleResponse(
        success: m['success'] ?? false,
        message: m['message'],
        data: m['data'] is Map
            ? StockOpnameModel.fromMap(Map<String, dynamic>.from(m['data']))
            : null,
      );
}

// ── Response untuk productsForOpname ─────────────────────────────────────
class ProductForOpnameListResponse {
  final bool success;
  final List<ProductForOpnameModel> data;

  const ProductForOpnameListResponse(
      {required this.success, required this.data});

  factory ProductForOpnameListResponse.fromJson(String s) =>
      ProductForOpnameListResponse.fromMap(jsonDecode(s));

  factory ProductForOpnameListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    final items = raw is List
        ? raw.map((e) => ProductForOpnameModel.fromMap(e)).toList()
        : <ProductForOpnameModel>[];
    return ProductForOpnameListResponse(
        success: m['success'] ?? false, data: items);
  }
}
