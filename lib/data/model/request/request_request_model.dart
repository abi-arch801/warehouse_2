// import 'dart:convert';

// // ─────────────────────────────────────────────────────────────────────────────
// // POST /api/requests — store()
// //
// // Laravel validation rules:
// //   'purpose'            => 'required|in:maintenance,distribution,return,other'
// //   'note'               => 'nullable|string'          ← bukan 'notes'
// //   'items'              => 'required|array|min:1'
// //   'items.*.product_id' => 'required|exists:products,id'
// //   'items.*.quantity'   => 'required|integer|min:1'   ← bukan 'requested_quantity'
// //   'items.*.note'       => 'nullable|string'
// // ─────────────────────────────────────────────────────────────────────────────

// class RequestItemInput {
//   final int productId;
//   final int quantity;        // Laravel: 'quantity'
//   final String? note;

//   const RequestItemInput({
//     required this.productId,
//     required this.quantity,
//     this.note,
//   });

//   Map<String, dynamic> toMap() => {
//         'product_id': productId,
//         'quantity': quantity,
//         if (note != null && note!.isNotEmpty) 'note': note,
//       };
// }

// class StoreStockRequestModel {
//   final String purpose;   // required|in:maintenance,distribution,return,other
//   final String? note;     // Laravel field: 'note' (bukan 'notes')
//   final List<RequestItemInput> items;

//   const StoreStockRequestModel({
//     required this.purpose,
//     this.note,
//     required this.items,
//   });

//   Map<String, dynamic> toMap() => {
//         'purpose': purpose,
//         if (note != null && note!.isNotEmpty) 'note': note,
//         'items': items.map((e) => e.toMap()).toList(),
//       };

//   String toJson() => jsonEncode(toMap());
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // PUT /api/requests/{id} — update()
// // Laravel: hanya bisa update 'purpose' dan 'note'
// // ─────────────────────────────────────────────────────────────────────────────
// class UpdateStockRequestModel {
//   final String? purpose;
//   final String? note;

//   const UpdateStockRequestModel({this.purpose, this.note});

//   Map<String, dynamic> toMap() => {
//         if (purpose != null) 'purpose': purpose,
//         if (note != null) 'note': note,
//       };

//   String toJson() => jsonEncode(toMap());
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // POST /api/requests/{id}/approve — approve()
// //
// // Laravel validation rules:
// //   'warehouse_id'                => 'required|exists:warehouses,id'
// //   'items'                       => 'required|array'
// //   'items.*.request_item_id'     => 'required|exists:request_items,id'
// //   'items.*.approved_quantity'   => 'required|integer|min:0'
// // ─────────────────────────────────────────────────────────────────────────────
// class ApproveItemInput {
//   final int requestItemId;
//   final int approvedQuantity;


//   const ApproveItemInput({
//     required this.requestItemId,
//     required this.approvedQuantity,
//   });

//   Map<String, dynamic> toMap() => {
//         'request_item_id': requestItemId,
//         'approved_quantity': approvedQuantity,
//       };
// }

// class ApproveRequestModel {
//   final int warehouseId;
//   final List<ApproveItemInput> items;

//   const ApproveRequestModel({
//     required this.warehouseId,
//     required this.items,
//   });

//   Map<String, dynamic> toMap() => {
//         'warehouse_id': warehouseId,
//         'items': items.map((e) => e.toMap()).toList(),
//       };

//   String toJson() => jsonEncode(toMap());
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // POST /api/requests/{id}/reject — reject()
// // ─────────────────────────────────────────────────────────────────────────────
// class RejectRequestModel {
//   final String reason;

//   const RejectRequestModel({required this.reason});

//   Map<String, dynamic> toMap() => {'reason': reason};
//   String toJson() => jsonEncode(toMap());
// }





import 'dart:convert';

// ─────────────────────────────────────────────────────────────────────────────
// POST /api/requests — store()
//
// Laravel validation rules:
//   'purpose'                  => 'required|in:maintenance,distribution,return,other'
//   'note'                     => 'nullable|string'
//   'items'                    => 'required|array|min:1'
//   'items.*.quantity'         => 'required|integer|min:1'
//   'items.*.note'             => 'nullable|string'
//   'items.*.product_id'       => 'nullable|integer|exists:products,id'
//   'items.*.external_name'    => 'nullable|string|max:255'
//   'items.*.external_spec'    => 'nullable|string'
//   'items.*.external_link'    => 'nullable|string|max:500'
//   'items.*.external_price'   => 'nullable|numeric|min:0'
// ─────────────────────────────────────────────────────────────────────────────

class RequestItemInput {
  final int? productId;       // wajib untuk barang gudang, null untuk barang luar
  final int quantity;
  final String? note;

  // ── Hanya dipakai untuk barang "Dari Luar" ──
  final String? externalName;
  final String? externalSpec;
  final String? externalLink;
  final num? externalPrice;

  const RequestItemInput({
    this.productId,
    required this.quantity,
    this.note,
    this.externalName,
    this.externalSpec,
    this.externalLink,
    this.externalPrice,
  });

  /// Builder khusus barang dari gudang — arsitektur TIDAK diubah.
  factory RequestItemInput.fromWarehouse({
    required int productId,
    required int quantity,
    String? note,
  }) =>
      RequestItemInput(productId: productId, quantity: quantity, note: note);

  /// Builder khusus barang dari luar (beli di toko/ecommerce).
  factory RequestItemInput.fromExternal({
    required String externalName,
    required String externalSpec,
    required String externalLink,
    required num externalPrice,
    required int quantity,
    String? note,
  }) =>
      RequestItemInput(
        quantity: quantity,
        note: note,
        externalName: externalName,
        externalSpec: externalSpec,
        externalLink: externalLink,
        externalPrice: externalPrice,
      );

  Map<String, dynamic> toMap() => {
        if (productId != null) 'product_id': productId,
        'quantity': quantity,
        if (note != null && note!.isNotEmpty) 'note': note,
        if (externalName != null) 'external_name': externalName,
        if (externalSpec != null) 'external_spec': externalSpec,
        if (externalLink != null) 'external_link': externalLink,
        if (externalPrice != null) 'external_price': externalPrice,
      };
}

class StoreStockRequestModel {
  final String purpose;   // required|in:maintenance,distribution,return,other
  final String? note;     // Laravel field: 'note'
  final List<RequestItemInput> items;

  const StoreStockRequestModel({
    required this.purpose,
    this.note,
    required this.items,
  });

  Map<String, dynamic> toMap() => {
        'purpose': purpose,
        if (note != null && note!.isNotEmpty) 'note': note,
        'items': items.map((e) => e.toMap()).toList(),
      };

  String toJson() => jsonEncode(toMap());
}

// ─────────────────────────────────────────────────────────────────────────────
// PUT /api/requests/{id} — update()
// Laravel: hanya bisa update 'purpose' dan 'note'
// ─────────────────────────────────────────────────────────────────────────────
class UpdateStockRequestModel {
  final String? purpose;
  final String? note;

  const UpdateStockRequestModel({this.purpose, this.note});

  Map<String, dynamic> toMap() => {
        if (purpose != null) 'purpose': purpose,
        if (note != null) 'note': note,
      };

  String toJson() => jsonEncode(toMap());
}

// ─────────────────────────────────────────────────────────────────────────────
// POST /api/requests/{id}/approve — approve()
// ─────────────────────────────────────────────────────────────────────────────
class ApproveItemInput {
  final int requestItemId;
  final int approvedQuantity;

  const ApproveItemInput({
    required this.requestItemId,
    required this.approvedQuantity,
  });

  Map<String, dynamic> toMap() => {
        'request_item_id': requestItemId,
        'approved_quantity': approvedQuantity,
      };
}

class ApproveRequestModel {
  final int warehouseId;
  final List<ApproveItemInput> items;

  const ApproveRequestModel({
    required this.warehouseId,
    required this.items,
  });

  Map<String, dynamic> toMap() => {
        'warehouse_id': warehouseId,
        'items': items.map((e) => e.toMap()).toList(),
      };

  String toJson() => jsonEncode(toMap());
}

// ─────────────────────────────────────────────────────────────────────────────
// POST /api/requests/{id}/reject — reject()
// ─────────────────────────────────────────────────────────────────────────────
class RejectRequestModel {
  final String reason;

  const RejectRequestModel({required this.reason});

  Map<String, dynamic> toMap() => {'reason': reason};
  String toJson() => jsonEncode(toMap());
}