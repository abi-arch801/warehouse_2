// import 'dart:convert';
// import 'package:warehouse/data/model/response/pagination_meta.dart';

// class PurchaseOrderItemModel {
//   final int id;
//   final int purchaseOrderId;
//   final int productId;
//   final String unit;
//   final double conversionValue;
//   final int quantityOrdered;
//   final int quantityReceived;
//   final double unitPrice;
//   final double discountPercent;
//   final double subtotal;
//   final String? notes;
//   final Map<String, dynamic>? product;

//   const PurchaseOrderItemModel({
//     required this.id,
//     required this.purchaseOrderId,
//     required this.productId,
//     required this.unit,
//     required this.conversionValue,
//     required this.quantityOrdered,
//     required this.quantityReceived,
//     required this.unitPrice,
//     required this.discountPercent,
//     required this.subtotal,
//     this.notes,
//     this.product,
//   });

//   factory PurchaseOrderItemModel.fromMap(Map<String, dynamic> m) =>
//       PurchaseOrderItemModel(
//         id: m['id'] ?? 0,
//         purchaseOrderId: m['purchase_order_id'] ?? 0,
//         productId: m['product_id'] ?? 0,
//         unit: m['unit'] ?? '',
//         conversionValue: (m['conversion_value'] as num?)?.toDouble() ?? 1.0,
//         quantityOrdered: m['quantity_ordered'] ?? 0,
//         quantityReceived: m['quantity_received'] ?? 0,
//         unitPrice: (m['unit_price'] as num?)?.toDouble() ?? 0,
//         discountPercent: (m['discount_percent'] as num?)?.toDouble() ?? 0,
//         subtotal: (m['subtotal'] as num?)?.toDouble() ?? 0,
//         notes: m['notes'],
//         product: m['product'] is Map
//             ? Map<String, dynamic>.from(m['product'])
//             : null,
//       );
// }

// // Status: draft | pending | approved | partial | received | cancelled
// // payment_term: cod | net_7 | net_14 | net_30 | net_60
// class PurchaseOrderModel {
//   final int id;
//   final String poNumber;
//   final int supplierId;
//   final int warehouseId;
//   final int createdBy;
//   final int? approvedBy;
//   final String status;
//   final String orderDate;
//   final String? expectedDate;
//   final String? receivedDate;
//   final String paymentTerm;
//   final double subtotal;
//   final double taxPercent;
//   final double taxAmount;
//   final double discountAmount;
//   final double totalAmount;
//   final String? notes;
//   final List<PurchaseOrderItemModel> items;
//   final Map<String, dynamic>? supplier;
//   final Map<String, dynamic>? warehouse;
//   final String? createdAt;

//   const PurchaseOrderModel({
//     required this.id,
//     required this.poNumber,
//     required this.supplierId,
//     required this.warehouseId,
//     required this.createdBy,
//     this.approvedBy,
//     required this.status,
//     required this.orderDate,
//     this.expectedDate,
//     this.receivedDate,
//     required this.paymentTerm,
//     required this.subtotal,
//     required this.taxPercent,
//     required this.taxAmount,
//     required this.discountAmount,
//     required this.totalAmount,
//     this.notes,
//     this.items = const [],
//     this.supplier,
//     this.warehouse,
//     this.createdAt,
//   });

//   factory PurchaseOrderModel.fromMap(Map<String, dynamic> m) =>
//       PurchaseOrderModel(
//         id: m['id'] ?? 0,
//         poNumber: m['po_number'] ?? '',
//         supplierId: m['supplier_id'] ?? 0,
//         warehouseId: m['warehouse_id'] ?? 0,
//         createdBy: m['created_by'] ?? 0,
//         approvedBy: m['approved_by'],
//         status: m['status'] ?? 'draft',
//         orderDate: m['order_date'] ?? '',
//         expectedDate: m['expected_date'],
//         receivedDate: m['received_date'],
//         paymentTerm: m['payment_term'] ?? 'cod',
//         subtotal: (m['subtotal'] as num?)?.toDouble() ?? 0,
//         taxPercent: (m['tax_percent'] as num?)?.toDouble() ?? 0,
//         taxAmount: (m['tax_amount'] as num?)?.toDouble() ?? 0,
//         discountAmount: (m['discount_amount'] as num?)?.toDouble() ?? 0,
//         totalAmount: (m['total_amount'] as num?)?.toDouble() ?? 0,
//         notes: m['notes'],
//         items: (m['items'] as List? ?? [])
//             .map((e) => PurchaseOrderItemModel.fromMap(e))
//             .toList(),
//         supplier: m['supplier'] is Map
//             ? Map<String, dynamic>.from(m['supplier'])
//             : null,
//         warehouse: m['warehouse'] is Map
//             ? Map<String, dynamic>.from(m['warehouse'])
//             : null,
//         createdAt: m['created_at'],
//       );

//   String get formattedTotal {
//     final s = totalAmount.toInt().toString();
//     final r = StringBuffer();
//     for (int i = 0; i < s.length; i++) {
//       if (i > 0 && (s.length - i) % 3 == 0) r.write('.');
//       r.write(s[i]);
//     }
//     return 'Rp $r';
//   }
// }

// class PurchaseOrderListResponse {
//   final bool success;
//   final List<PurchaseOrderModel> data;
//   final PaginationMeta? meta;

//   const PurchaseOrderListResponse(
//       {required this.success, required this.data, this.meta});

//   factory PurchaseOrderListResponse.fromJson(String s) =>
//       PurchaseOrderListResponse.fromMap(jsonDecode(s));

//   factory PurchaseOrderListResponse.fromMap(Map<String, dynamic> m) {
//     final raw = m['data'];
//     List<PurchaseOrderModel> items = [];
//     PaginationMeta? meta;
//     if (raw is Map) {
//       items = (raw['data'] as List? ?? [])
//           .map((e) => PurchaseOrderModel.fromMap(e))
//           .toList();
//       meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
//     } else if (raw is List) {
//       items = raw.map((e) => PurchaseOrderModel.fromMap(e)).toList();
//     }
//     return PurchaseOrderListResponse(
//         success: m['success'] ?? false, data: items, meta: meta);
//   }
// }

// class PurchaseOrderSingleResponse {
//   final bool success;
//   final String? message;
//   final PurchaseOrderModel? data;

//   const PurchaseOrderSingleResponse(
//       {required this.success, this.message, this.data});

//   factory PurchaseOrderSingleResponse.fromJson(String s) =>
//       PurchaseOrderSingleResponse.fromMap(jsonDecode(s));

//   factory PurchaseOrderSingleResponse.fromMap(Map<String, dynamic> m) =>
//       PurchaseOrderSingleResponse(
//         success: m['success'] ?? false,
//         message: m['message'],
//         data: m['data'] != null ? PurchaseOrderModel.fromMap(m['data']) : null,
//       );
// }

import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

double _toDouble(dynamic v, [double fallback = 0]) {
  if (v == null) return fallback;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? fallback;
  return fallback;
}

int _toInt(dynamic v, [int fallback = 0]) {
  if (v == null) return fallback;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  // kalau ternyata Map (relasi ter-load menimpa key FK), ambil 'id' di dalamnya
  if (v is Map && v['id'] != null) return _toInt(v['id'], fallback);
  return fallback;
}

int? _toIntNullable(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  if (v is Map && v['id'] != null) return _toInt(v['id']);
  return null;
}

class PurchaseOrderItemModel {
  final int id;
  final int purchaseOrderId;
  final int productId;
  final String unit;
  final double conversionValue;
  final int quantityOrdered;
  final int quantityReceived;
  final double unitPrice;
  final double discountPercent;
  final double subtotal;
  final String? notes;
  final Map<String, dynamic>? product;
  int get remainingQty => quantityOrdered - quantityReceived;

  const PurchaseOrderItemModel({
    required this.id,
    required this.purchaseOrderId,
    required this.productId,
    required this.unit,
    required this.conversionValue,
    required this.quantityOrdered,
    required this.quantityReceived,
    required this.unitPrice,
    required this.discountPercent,
    required this.subtotal,
    this.notes,
    this.product,
  });

  factory PurchaseOrderItemModel.fromMap(Map<String, dynamic> m) =>
      PurchaseOrderItemModel(
        id: _toInt(m['id']),
        purchaseOrderId: _toInt(m['purchase_order_id']),
        productId: _toInt(m['product_id']),
        unit: m['unit']?.toString() ?? '',
        conversionValue: _toDouble(m['conversion_value'], 1.0),
        quantityOrdered: _toInt(m['quantity_ordered']),
        quantityReceived: _toInt(m['quantity_received']),
        unitPrice: _toDouble(m['unit_price']),
        discountPercent: _toDouble(m['discount_percent']),
        subtotal: _toDouble(m['subtotal']),
        notes: m['notes']?.toString(),
        product: m['product'] is Map
            ? Map<String, dynamic>.from(m['product'])
            : null,
      );
}

// Status: draft | pending | approved | partial | received | cancelled
// payment_term: cod | net_7 | net_14 | net_30 | net_60
class PurchaseOrderModel {
  final int id;
  final String poNumber;
  final int supplierId;
  final int warehouseId;
  final int createdBy;
  final int? approvedBy;
  final String status;
  final String orderDate;
  final String? expectedDate;
  final String? receivedDate;
  final String paymentTerm;
  final double subtotal;
  final double taxPercent;
  final double taxAmount;
  final double discountAmount;
  final double totalAmount;
  final String? notes;
  final List<PurchaseOrderItemModel> items;
  final Map<String, dynamic>? supplier;
  final Map<String, dynamic>? warehouse;
  final String? createdAt;

  const PurchaseOrderModel({
    required this.id,
    required this.poNumber,
    required this.supplierId,
    required this.warehouseId,
    required this.createdBy,
    this.approvedBy,
    required this.status,
    required this.orderDate,
    this.expectedDate,
    this.receivedDate,
    required this.paymentTerm,
    required this.subtotal,
    required this.taxPercent,
    required this.taxAmount,
    required this.discountAmount,
    required this.totalAmount,
    this.notes,
    this.items = const [],
    this.supplier,
    this.warehouse,
    this.createdAt,
  });

  factory PurchaseOrderModel.fromMap(Map<String, dynamic> m) =>
      PurchaseOrderModel(
        id: _toInt(m['id']),
        poNumber: m['po_number']?.toString() ?? '',
        supplierId: _toInt(m['supplier_id']),
        warehouseId: _toInt(m['warehouse_id']),
        // ⚠️ created_by / approved_by bisa berupa Map kalau relasi
        // dengan nama sama ter-load (Laravel override key FK).
        createdBy: _toInt(m['created_by']),
        approvedBy: _toIntNullable(m['approved_by']),
        status: m['status']?.toString() ?? 'draft',
        orderDate: m['order_date']?.toString() ?? '',
        expectedDate: m['expected_date']?.toString(),
        receivedDate: m['received_date']?.toString(),
        paymentTerm: m['payment_term']?.toString() ?? 'cod',
        subtotal: _toDouble(m['subtotal']),
        taxPercent: _toDouble(m['tax_percent']),
        taxAmount: _toDouble(m['tax_amount']),
        discountAmount: _toDouble(m['discount_amount']),
        totalAmount: _toDouble(m['total_amount']),
        notes: m['notes']?.toString(),
        items: (m['items'] as List? ?? [])
            .map((e) => PurchaseOrderItemModel.fromMap(
                Map<String, dynamic>.from(e as Map)))
            .toList(),
        supplier: m['supplier'] is Map
            ? Map<String, dynamic>.from(m['supplier'])
            : null,
        warehouse: m['warehouse'] is Map
            ? Map<String, dynamic>.from(m['warehouse'])
            : null,
        createdAt: m['created_at']?.toString(),
      );

  String get formattedTotal {
    final s = totalAmount.toInt().toString();
    final r = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) r.write('.');
      r.write(s[i]);
    }
    return 'Rp $r';
  }
}

class PurchaseOrderListResponse {
  final bool success;
  final List<PurchaseOrderModel> data;
  final PaginationMeta? meta;

  const PurchaseOrderListResponse(
      {required this.success, required this.data, this.meta});

  factory PurchaseOrderListResponse.fromJson(String s) =>
      PurchaseOrderListResponse.fromMap(jsonDecode(s));

  factory PurchaseOrderListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<PurchaseOrderModel> items = [];
    PaginationMeta? meta;
    if (raw is Map) {
      final rawMap = Map<String, dynamic>.from(raw);
      items = (rawMap['data'] as List? ?? [])
          .map((e) =>
              PurchaseOrderModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
      meta = PaginationMeta.fromMap(rawMap);
    } else if (raw is List) {
      items = raw
          .map((e) =>
              PurchaseOrderModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
    }
    return PurchaseOrderListResponse(
        success: m['success'] == true, data: items, meta: meta);
  }
}

class PurchaseOrderSingleResponse {
  final bool success;
  final String? message;
  final PurchaseOrderModel? data;

  const PurchaseOrderSingleResponse(
      {required this.success, this.message, this.data});

  factory PurchaseOrderSingleResponse.fromJson(String s) =>
      PurchaseOrderSingleResponse.fromMap(jsonDecode(s));

  factory PurchaseOrderSingleResponse.fromMap(Map<String, dynamic> m) =>
      PurchaseOrderSingleResponse(
        success: m['success'] == true,
        message: m['message']?.toString(),
        data: m['data'] != null
            ? PurchaseOrderModel.fromMap(
                Map<String, dynamic>.from(m['data'] as Map))
            : null,
      );
}
