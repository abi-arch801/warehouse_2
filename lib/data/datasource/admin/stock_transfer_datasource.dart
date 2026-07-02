// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:warehouse/core/constant/base_http.dart';
// import '../../model/response/auth/auth_response_model.dart';

// // ── StockTransfer models ───────────────────────────────────────────────────
// class StockTransferItemModel {
//   final int id;
//   final int transferId;
//   final int productId;
//   final int quantitySent;
//   final int? quantityReceived;
//   final String? note;
//   final Map<String, dynamic>? product;

//   const StockTransferItemModel({
//     required this.id, required this.transferId, required this.productId,
//     required this.quantitySent, this.quantityReceived, this.note, this.product,
//   });

//   factory StockTransferItemModel.fromMap(Map<String, dynamic> m) =>
//       StockTransferItemModel(
//         id: m['id'] ?? 0, transferId: m['transfer_id'] ?? 0,
//         productId: m['product_id'] ?? 0,
//         quantitySent: m['quantity_sent'] ?? 0,
//         quantityReceived: m['quantity_received'],
//         note: m['note'],
//         product: m['product'] is Map ? Map<String, dynamic>.from(m['product']) : null,
//       );
// }

// // Status: draft | pending | approved | sent | received | cancelled
// class StockTransferModel {
//   final int id;
//   final String transferNumber;
//   final int fromWarehouseId;
//   final int toWarehouseId;
//   final int createdBy;
//   final int? approvedBy;
//   final String status;
//   final String? notes;
//   final String? sentAt;
//   final String? receivedAt;
//   final String? approvedAt;
//   final String? rejectReason;
//   final List<StockTransferItemModel> items;
//   final Map<String, dynamic>? fromWarehouse;
//   final Map<String, dynamic>? toWarehouse;
//   final String createdAt;

//   const StockTransferModel({
//     required this.id, required this.transferNumber,
//     required this.fromWarehouseId, required this.toWarehouseId,
//     required this.createdBy, this.approvedBy, required this.status,
//     this.notes, this.sentAt, this.receivedAt, this.approvedAt,
//     this.rejectReason, this.items = const [],
//     this.fromWarehouse, this.toWarehouse, required this.createdAt,
//   });

//   factory StockTransferModel.fromMap(Map<String, dynamic> m) =>
//       StockTransferModel(
//         id: m['id'] ?? 0,
//         transferNumber: m['transfer_number'] ?? '',
//         fromWarehouseId: m['from_warehouse_id'] ?? 0,
//         toWarehouseId: m['to_warehouse_id'] ?? 0,
//         createdBy: m['created_by'] ?? 0,
//         approvedBy: m['approved_by'],
//         status: m['status'] ?? 'draft',
//         notes: m['notes'],
//         sentAt: m['sent_at'],
//         receivedAt: m['received_at'],
//         approvedAt: m['approved_at'],
//         rejectReason: m['reject_reason'],
//         items: (m['items'] as List? ?? [])
//             .map((e) => StockTransferItemModel.fromMap(e)).toList(),
//         fromWarehouse: m['from_warehouse'] is Map
//             ? Map<String, dynamic>.from(m['from_warehouse']) : null,
//         toWarehouse: m['to_warehouse'] is Map
//             ? Map<String, dynamic>.from(m['to_warehouse']) : null,
//         createdAt: m['created_at'] ?? '',
//       );
// }

// class StockTransferListResponse {
//   final bool success;
//   final List<StockTransferModel> data;
//   final int? total, currentPage, lastPage;

//   const StockTransferListResponse({
//     required this.success, required this.data,
//     this.total, this.currentPage, this.lastPage,
//   });

//   factory StockTransferListResponse.fromJson(String s) =>
//       StockTransferListResponse.fromMap(jsonDecode(s));

//   factory StockTransferListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<StockTransferModel> items = [];
//     int? total, cp, lp;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? []).map((e) => StockTransferModel.fromMap(e)).toList();
//       total = raw['total']; cp = raw['current_page']; lp = raw['last_page'];
//     } else if (raw is List) {
//       items = raw.map((e) => StockTransferModel.fromMap(e)).toList();
//     }
//     return StockTransferListResponse(
//       success: m['success'] ?? false, data: items,
//       total: total, currentPage: cp, lastPage: lp,
//     );
//   }
// }

// class StockTransferSingleResponse {
//   final bool success;
//   final String? message;
//   final StockTransferModel? data;

//   const StockTransferSingleResponse({required this.success, this.message, this.data});

//   factory StockTransferSingleResponse.fromJson(String s) =>
//       StockTransferSingleResponse.fromMap(jsonDecode(s));

//   factory StockTransferSingleResponse.fromMap(Map<String, dynamic> m) =>
//       StockTransferSingleResponse(
//         success: m['success'] ?? false, message: m['message'],
//         data: m['data'] != null ? StockTransferModel.fromMap(m['data']) : null,
//       );
// }

// // ── Datasource ─────────────────────────────────────────────────────────────
// class StockTransferDatasource extends BaseHttp {
//   Future<Either<String, StockTransferListResponse>> getAll({
//     int page = 1, String? status, int? fromWarehouseId, int? toWarehouseId,
//   }) async {
//     final p = <String, String>{'page': '$page'};
//     if (status != null) p['status'] = status;
//     if (fromWarehouseId != null) p['from_warehouse_id'] = '$fromWarehouseId';
//     if (toWarehouseId != null) p['to_warehouse_id'] = '$toWarehouseId';
//     return get('/api/stock-transfers', StockTransferListResponse.fromJson, params: p);
//   }

//   Future<Either<String, StockTransferSingleResponse>> getDetail(int id) =>
//       get('/api/stock-transfers/$id', StockTransferSingleResponse.fromJson);

//   Future<Either<String, StockTransferSingleResponse>> store(Map<String, dynamic> body) =>
//       post('/api/stock-transfers', StockTransferSingleResponse.fromJson, body: jsonEncode(body));

//   Future<Either<String, StockTransferSingleResponse>> approve(int id) =>
//       post('/api/stock-transfers/$id/approve', StockTransferSingleResponse.fromJson);

//   Future<Either<String, StockTransferSingleResponse>> send(int id) =>
//       post('/api/stock-transfers/$id/send', StockTransferSingleResponse.fromJson);

//   Future<Either<String, StockTransferSingleResponse>> receive(
//       int id, List<Map<String, dynamic>> items) =>
//       post('/api/stock-transfers/$id/receive', StockTransferSingleResponse.fromJson,
//           body: jsonEncode({'items': items}));

//   Future<Either<String, StockTransferSingleResponse>> reject(int id, String reason) =>
//       post('/api/stock-transfers/$id/reject', StockTransferSingleResponse.fromJson,
//           body: jsonEncode({'reject_reason': reason}));
// }

////code 2206
///
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:warehouse/core/constant/base_http.dart';

// ── Helpers ──────────────────────────────────────────────────────────────
// Backend kadang mengembalikan objek relasi penuh (mis. {"id": 3, "name": ...})
// di key yang seharusnya berisi ID scalar (mis. "approved_by", "from_warehouse_id").
// Helper ini bikin parsing tahan banting terhadap kasus itu, supaya
// "_Map<String, dynamic> is not a subtype of type 'int'" tidak terjadi lagi.

int _toInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v) ?? 0;
  if (v is Map) {
    // backend salah kirim objek relasi penuh, ambil 'id' dari dalamnya
    return _toInt(v['id']);
  }
  return 0;
}

int? _toIntNullable(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is double) return v.toInt();
  if (v is String) return int.tryParse(v);
  if (v is Map) return _toInt(v['id']);
  return null;
}

// ── Models ─────────────────────────────────────────────────────────────────

class StockTransferItemModel {
  final int id;
  final int stockTransferId;
  final int productId;
  final int quantityRequested;
  final int quantitySent;
  final int quantityReceived;
  final String? notes;
  final Map<String, dynamic>? product;

  const StockTransferItemModel({
    required this.id,
    required this.stockTransferId,
    required this.productId,
    required this.quantityRequested,
    required this.quantitySent,
    required this.quantityReceived,
    this.notes,
    this.product,
  });

  factory StockTransferItemModel.fromMap(Map<String, dynamic> m) =>
      StockTransferItemModel(
        id: _toInt(m['id']),
        // Laravel pakai "stock_transfer_id" di DB, response pakai key yg sama
        stockTransferId: _toInt(m['stock_transfer_id']),
        productId: _toInt(m['product_id']),
        quantityRequested: _toInt(m['quantity_requested']),
        quantitySent: _toInt(m['quantity_sent']),
        quantityReceived: _toInt(m['quantity_received']),
        notes: m['notes'],
        product: m['product'] is Map
            ? Map<String, dynamic>.from(m['product'])
            : null,
      );
}

// Status sesuai Laravel enum:
// pending | approved | in_transit | received | rejected | cancelled
class StockTransferModel {
  final int id;
  final String transferNumber;
  final int fromWarehouseId;
  final int toWarehouseId;
  final int requestedBy;
  final int? approvedBy;
  final int? receivedBy;
  final String status;
  final String? notes;
  final String? transferDate;
  final String? expectedArrival;
  final String? approvedAt;
  final String? receivedAt;
  final String? rejectReason;
  final List<StockTransferItemModel> items;
  final Map<String, dynamic>? fromWarehouse;
  final Map<String, dynamic>? toWarehouse;
  final String createdAt;

  const StockTransferModel({
    required this.id,
    required this.transferNumber,
    required this.fromWarehouseId,
    required this.toWarehouseId,
    required this.requestedBy,
    this.approvedBy,
    this.receivedBy,
    required this.status,
    this.notes,
    this.transferDate,
    this.expectedArrival,
    this.approvedAt,
    this.receivedAt,
    this.rejectReason,
    this.items = const [],
    this.fromWarehouse,
    this.toWarehouse,
    required this.createdAt,
  });

  factory StockTransferModel.fromMap(Map<String, dynamic> m) =>
      StockTransferModel(
        id: _toInt(m['id']),
        transferNumber: m['transfer_number'] ?? '',
        fromWarehouseId: _toInt(m['from_warehouse_id']),
        toWarehouseId: _toInt(m['to_warehouse_id']),
        // Laravel pakai "requested_by", bukan "created_by"
        requestedBy: _toInt(m['requested_by']),
        approvedBy: _toIntNullable(m['approved_by']),
        receivedBy: _toIntNullable(m['received_by']),
        status: m['status'] ?? 'pending',
        notes: m['notes'],
        transferDate: m['transfer_date'],
        expectedArrival: m['expected_arrival'],
        approvedAt: m['approved_at'],
        receivedAt: m['received_at'],
        rejectReason: m['reject_reason'],
        items: (m['items'] as List? ?? [])
            .map((e) => StockTransferItemModel.fromMap(e))
            .toList(),
        fromWarehouse: m['from_warehouse'] is Map
            ? Map<String, dynamic>.from(m['from_warehouse'])
            : null,
        toWarehouse: m['to_warehouse'] is Map
            ? Map<String, dynamic>.from(m['to_warehouse'])
            : null,
        createdAt: m['created_at'] ?? '',
      );

  /// Helper: apakah status ini berarti "sedang dalam perjalanan"
  bool get isInTransit => status == 'in_transit';

  /// Label display-friendly (cocok dengan filter tab UI)
  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'approved':
        return 'Disetujui';
      case 'in_transit':
        return 'Dikirim'; // UI tetap tampilkan "Dikirim"
      case 'received':
        return 'Diterima';
      case 'rejected':
        return 'Ditolak';
      case 'cancelled':
        return 'Batal';
      default:
        return status;
    }
  }
}

class StockTransferListResponse {
  final bool success;
  final List<StockTransferModel> data;
  final int? total, currentPage, lastPage;

  const StockTransferListResponse({
    required this.success,
    required this.data,
    this.total,
    this.currentPage,
    this.lastPage,
  });

  factory StockTransferListResponse.fromJson(String s) =>
      StockTransferListResponse.fromMap(jsonDecode(s));

  factory StockTransferListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<StockTransferModel> items = [];
    int? total, cp, lp;
    if (raw is Map) {
      items = (raw['data'] as List? ?? [])
          .map((e) => StockTransferModel.fromMap(e))
          .toList();
      total = _toIntNullable(raw['total']);
      cp = _toIntNullable(raw['current_page']);
      lp = _toIntNullable(raw['last_page']);
    } else if (raw is List) {
      items = raw.map((e) => StockTransferModel.fromMap(e)).toList();
    }
    return StockTransferListResponse(
      success: m['success'] ?? false,
      data: items,
      total: total,
      currentPage: cp,
      lastPage: lp,
    );
  }
}

class StockTransferSingleResponse {
  final bool success;
  final String? message;
  final StockTransferModel? data;

  const StockTransferSingleResponse({
    required this.success,
    this.message,
    this.data,
  });

  factory StockTransferSingleResponse.fromJson(String s) =>
      StockTransferSingleResponse.fromMap(jsonDecode(s));

  factory StockTransferSingleResponse.fromMap(Map<String, dynamic> m) =>
      StockTransferSingleResponse(
        success: m['success'] ?? false,
        message: m['message'],
        data: m['data'] != null ? StockTransferModel.fromMap(m['data']) : null,
      );
}

// ── Datasource ─────────────────────────────────────────────────────────────

class StockTransferDatasource extends BaseHttp {
  /// GET /api/stock-transfers
  Future<Either<String, StockTransferListResponse>> getAll({
    int page = 1,
    String? status,
    int? fromWarehouseId,
    int? toWarehouseId,
  }) async {
    final p = <String, String>{'page': '$page'};
    if (status != null) p['status'] = status;
    if (fromWarehouseId != null) p['from_warehouse_id'] = '$fromWarehouseId';
    if (toWarehouseId != null) p['to_warehouse_id'] = '$toWarehouseId';
    return get(
      '/api/stock-transfers',
      StockTransferListResponse.fromJson,
      params: p,
    );
  }

  /// GET /api/stock-transfers/{id}
  Future<Either<String, StockTransferSingleResponse>> getDetail(int id) =>
      get('/api/stock-transfers/$id', StockTransferSingleResponse.fromJson);

  /// POST /api/stock-transfers
  /// Body: { from_warehouse_id, to_warehouse_id, transfer_date,
  ///         notes?, items[{product_id, quantity_requested, note?}] }
  Future<Either<String, StockTransferSingleResponse>> store(
          Map<String, dynamic> body) =>
      post(
        '/api/stock-transfers',
        StockTransferSingleResponse.fromJson,
        body: jsonEncode(body),
      );

  /// POST /api/stock-transfers/{id}/approve
  Future<Either<String, StockTransferSingleResponse>> approve(int id) => post(
      '/api/stock-transfers/$id/approve', StockTransferSingleResponse.fromJson);

  /// POST /api/stock-transfers/{id}/send
  /// WAJIB kirim items[] karena Laravel butuh quantity_sent per item
  /// [items] contoh: [{ "stock_transfer_item_id": 1, "quantity_sent": 5 }]
  Future<Either<String, StockTransferSingleResponse>> send(
    int id, {
    required List<Map<String, dynamic>> items,
  }) =>
      post(
        '/api/stock-transfers/$id/send',
        StockTransferSingleResponse.fromJson,
        body: jsonEncode({'items': items}),
      );

  /// POST /api/stock-transfers/{id}/receive
  /// Status transfer harus "in_transit" (bukan "sent")
  /// [items] contoh: [{ "stock_transfer_item_id": 1, "quantity_received": 5 }]
  Future<Either<String, StockTransferSingleResponse>> receive(
    int id, {
    required List<Map<String, dynamic>> items,
  }) =>
      post(
        '/api/stock-transfers/$id/receive',
        StockTransferSingleResponse.fromJson,
        body: jsonEncode({'items': items}),
      );

  /// POST /api/stock-transfers/{id}/reject
  /// Status transfer harus "pending"
  Future<Either<String, StockTransferSingleResponse>> reject(
          int id, String reason) =>
      post(
        '/api/stock-transfers/$id/reject',
        StockTransferSingleResponse.fromJson,
        body: jsonEncode({'reject_reason': reason}),
      );
}
