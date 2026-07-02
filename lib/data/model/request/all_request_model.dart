import 'dart:convert';

// ─── Auth ─────────────────────────────────────────────────────────────────────
class LoginRequest {
  final String email;
  final String password;
  const LoginRequest({required this.email, required this.password});
  String toJson() => jsonEncode({'email': email, 'password': password});
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  const RegisterRequest({required this.name, required this.email,
      required this.password, required this.passwordConfirmation});
  String toJson() => jsonEncode({'name': name, 'email': email,
      'password': password, 'password_confirmation': passwordConfirmation});
}

// ─── Product ──────────────────────────────────────────────────────────────────
// migration: products (category_id required, unit required, purchase_price/selling_price decimal)
class StoreProductRequest {
  final int categoryId;
  final String name;
  final String sku;
  final String? barcode;
  final String unit;
  final int minStock;
  final double purchasePrice;
  final double sellingPrice;
  final String? description;
  final bool isActive;

  const StoreProductRequest({
    required this.categoryId, required this.name, required this.sku,
    this.barcode, required this.unit, this.minStock = 0,
    this.purchasePrice = 0, this.sellingPrice = 0,
    this.description, this.isActive = true,
  });

  Map<String, dynamic> toMap() => {
    'category_id': categoryId, 'name': name, 'sku': sku,
    if (barcode != null) 'barcode': barcode,
    'unit': unit, 'min_stock': minStock,
    'purchase_price': purchasePrice, 'selling_price': sellingPrice,
    if (description != null) 'description': description,
    'is_active': isActive,
  };
  String toJson() => jsonEncode(toMap());
}

class UpdateProductRequest {
  final int? categoryId;
  final String? name;
  final String? sku;
  final String? barcode;
  final String? unit;
  final int? minStock;
  final double? purchasePrice;
  final double? sellingPrice;
  final String? description;
  final bool? isActive;

  const UpdateProductRequest({this.categoryId, this.name, this.sku,
      this.barcode, this.unit, this.minStock, this.purchasePrice,
      this.sellingPrice, this.description, this.isActive});

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (categoryId != null) m['category_id'] = categoryId;
    if (name != null) m['name'] = name;
    if (sku != null) m['sku'] = sku;
    if (barcode != null) m['barcode'] = barcode;
    if (unit != null) m['unit'] = unit;
    if (minStock != null) m['min_stock'] = minStock;
    if (purchasePrice != null) m['purchase_price'] = purchasePrice;
    if (sellingPrice != null) m['selling_price'] = sellingPrice;
    if (description != null) m['description'] = description;
    if (isActive != null) m['is_active'] = isActive;
    return m;
  }
  String toJson() => jsonEncode(toMap());
}

// ─── Category ────────────────────────────────────────────────────────────────
class StoreCategoryRequest {
  final String name;
  final String? code;
  final String? description;
  final bool isActive;
  const StoreCategoryRequest({required this.name, this.code, this.description, this.isActive = true});
  String toJson() => jsonEncode({'name': name, if (code != null) 'code': code,
      if (description != null) 'description': description, 'is_active': isActive});
}

// ─── Warehouse ────────────────────────────────────────────────────────────────
class StoreWarehouseRequest {
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;
  final bool isActive;
  const StoreWarehouseRequest({required this.name, required this.code,
      required this.location, this.picName, this.picPhone, this.isActive = true});
  Map<String, dynamic> toMap() => {
    'name': name, 'code': code, 'location': location,
    if (picName != null) 'pic_name': picName,
    if (picPhone != null) 'pic_phone': picPhone,
    'is_active': isActive,
  };
  String toJson() => jsonEncode(toMap());
}

class UpdateWarehouseRequest {
  final String? name;
  final String? code;
  final String? location;
  final String? picName;
  final String? picPhone;
  final bool? isActive;
  const UpdateWarehouseRequest({this.name, this.code, this.location,
      this.picName, this.picPhone, this.isActive});
  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (name != null) m['name'] = name;
    if (code != null) m['code'] = code;
    if (location != null) m['location'] = location;
    if (picName != null) m['pic_name'] = picName;
    if (picPhone != null) m['pic_phone'] = picPhone;
    if (isActive != null) m['is_active'] = isActive;
    return m;
  }
  String toJson() => jsonEncode(toMap());
}

// ─── Stock Request ────────────────────────────────────────────────────────────
// migration: requests (request_number auto-gen, purpose enum, warehouse_id nullable)
class RequestItemInput {
  final int productId;
  final int quantity;   // migration: quantity (bukan requested_quantity)
  final String? note;
  const RequestItemInput({required this.productId, required this.quantity, this.note});
  Map<String, dynamic> toMap() => {
    'product_id': productId, 'quantity': quantity,
    if (note != null) 'note': note,
  };
}

class StoreStockRequest {
  final int? warehouseId;
  final String purpose;  // maintenance | distribution | return | other
  final String? note;
  final List<RequestItemInput> items;
  const StoreStockRequest({this.warehouseId, this.purpose = 'distribution',
      this.note, required this.items});
  Map<String, dynamic> toMap() => {
    if (warehouseId != null) 'warehouse_id': warehouseId,
    'purpose': purpose,
    if (note != null) 'note': note,
    'items': items.map((e) => e.toMap()).toList(),
  };
  String toJson() => jsonEncode(toMap());
}

class ApproveItemInput {
  final int requestItemId;
  final int approvedQuantity;
  const ApproveItemInput({required this.requestItemId, required this.approvedQuantity});
  Map<String, dynamic> toMap() => {
    'request_item_id': requestItemId, 'approved_quantity': approvedQuantity,
  };
}

class ApproveStockRequest {
  final int warehouseId;
  final List<ApproveItemInput> items;
  const ApproveStockRequest({required this.warehouseId, required this.items});
  String toJson() => jsonEncode({
    'warehouse_id': warehouseId,
    'items': items.map((e) => e.toMap()).toList(),
  });
}

class RejectStockRequest {
  final String rejectReason;
  const RejectStockRequest({required this.rejectReason});
  String toJson() => jsonEncode({'reject_reason': rejectReason});
}

// ─── Supplier ─────────────────────────────────────────────────────────────────
class StoreSupplierRequest {
  final String name;
  final String code;
  final String? contactPerson;
  final String? phone;
  final String? email;
  final String? address;
  final String? city;
  final String? province;
  final String? npwp;
  final String? bankName;
  final String? bankAccount;
  final String? bankAccountName;
  final String? notes;
  const StoreSupplierRequest({required this.name, required this.code,
      this.contactPerson, this.phone, this.email, this.address,
      this.city, this.province, this.npwp, this.bankName,
      this.bankAccount, this.bankAccountName, this.notes});
  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{'name': name, 'code': code};
    if (contactPerson != null) m['contact_person'] = contactPerson;
    if (phone != null) m['phone'] = phone;
    if (email != null) m['email'] = email;
    if (address != null) m['address'] = address;
    if (city != null) m['city'] = city;
    if (province != null) m['province'] = province;
    if (npwp != null) m['npwp'] = npwp;
    if (bankName != null) m['bank_name'] = bankName;
    if (bankAccount != null) m['bank_account'] = bankAccount;
    if (bankAccountName != null) m['bank_account_name'] = bankAccountName;
    if (notes != null) m['notes'] = notes;
    return m;
  }
  String toJson() => jsonEncode(toMap());
}

// ─── Chat ─────────────────────────────────────────────────────────────────────
class SendMessageRequest {
  final String message;
  const SendMessageRequest({required this.message});
  String toJson() => jsonEncode({'message': message});
}

class StartChatRequest {
  final int receiverId;
  final String message;
  const StartChatRequest({required this.receiverId, required this.message});
  String toJson() => jsonEncode({'receiver_id': receiverId, 'message': message});
}