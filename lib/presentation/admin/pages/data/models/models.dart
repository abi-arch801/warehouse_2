enum UserRole { superAdmin, admin }

extension UserRoleX on UserRole {
  String get label {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.admin:
        return 'Admin';
    }
  }
}

enum DocStatus {
  draft,
  pending,
  approved,
  rejected,
  inTransit,
  received,
  completed,
}

extension DocStatusX on DocStatus {
  String get label {
    switch (this) {
      case DocStatus.draft:
        return 'Draft';
      case DocStatus.pending:
        return 'Menunggu';
      case DocStatus.approved:
        return 'Disetujui';
      case DocStatus.rejected:
        return 'Ditolak';
      case DocStatus.inTransit:
        return 'Dikirim';
      case DocStatus.received:
        return 'Diterima';
      case DocStatus.completed:
        return 'Selesai';
    }
  }
}

enum MovementType {
  inbound,
  outbound,
  adjustment,
  transfer,
  transferIn,
  transferOut,
}

extension MovementTypeX on MovementType {
  String get label {
    switch (this) {
      case MovementType.inbound:
        return 'Masuk';
      case MovementType.outbound:
        return 'Keluar';
      case MovementType.adjustment:
        return 'Penyesuaian';
      case MovementType.transfer:
        return 'Transfer';
      case MovementType.transferIn:
        return 'Transfer Masuk';
      case MovementType.transferOut:
        return 'Transfer Keluar';
    }
  }
}

enum FinanceSyncStatus { pending, synced, failed }

extension FinanceSyncStatusX on FinanceSyncStatus {
  String get label {
    switch (this) {
      case FinanceSyncStatus.pending:
        return 'Menunggu';
      case FinanceSyncStatus.synced:
        return 'Tersinkron';
      case FinanceSyncStatus.failed:
        return 'Gagal';
    }
  }
}

/// Tujuan / kategori penggunaan stok.
/// - [maintenance] : stok dipakai untuk perawatan, perbaikan, kebutuhan operasional.
/// - [perakitan]   : stok dipakai untuk perakitan/produksi. Biasanya memiliki
///   tambahan biaya perakitan (lihat [Stock.biayaTambahan]).
enum StockPurpose { maintenance, perakitan }

extension StockPurposeX on StockPurpose {
  String get label {
    switch (this) {
      case StockPurpose.maintenance:
        return 'Maintenance';
      case StockPurpose.perakitan:
        return 'Perakitan';
    }
  }

  String get shortLabel {
    switch (this) {
      case StockPurpose.maintenance:
        return 'MTC';
      case StockPurpose.perakitan:
        return 'PRK';
    }
  }
}

class AppUser {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? warehouseId;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.warehouseId,
  });
}

class Warehouse {
  final String id;
  final String code;
  final String name;
  final String city;
  final String address;

  Warehouse({
    required this.id,
    required this.code,
    required this.name,
    required this.city,
    required this.address,
  });
}

class Supplier {
  final String id;
  final String name;
  final String contact;
  final String phone;
  final String category;

  Supplier({
    required this.id,
    required this.name,
    required this.contact,
    required this.phone,
    required this.category,
  });
}

class Category {
  final String id;
  final String code;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
  });
}

class Product {
  final String id;
  final String sku;
  final String barcode;
  final String name;
  final String unit;
  final String categoryId;
  final int minStock;
  final bool active;
  double hargaPokok;
  DocStatus status;
  String? approvedBy;

  Product({
    required this.id,
    required this.sku,
    required this.barcode,
    required this.name,
    required this.unit,
    required this.categoryId,
    required this.minStock,
    this.active = true,
    this.hargaPokok = 0,
    this.status = DocStatus.approved,
    this.approvedBy,
  });
}

/// Stok per produk per gudang.
///
/// Mulai versi ini setiap baris stok memiliki [purpose] yang membedakan
/// peruntukannya: maintenance atau perakitan. Stok perakitan memiliki
/// [biayaTambahan] (mis. biaya jasa rakit, packing kit) yang akan ditambahkan
/// ke nilai jurnal saat stok perakitan dikeluarkan.
class Stock {
  final String productId;
  final String warehouseId;
  int quantity;
  final StockPurpose purpose;
  double biayaTambahan;

  Stock({
    required this.productId,
    required this.warehouseId,
    required this.quantity,
    this.purpose = StockPurpose.maintenance,
    this.biayaTambahan = 0,
  });

  /// Total nilai per unit (HPP + biaya tambahan kalau perakitan).
  double unitValue(double hargaPokok) {
    if (purpose == StockPurpose.perakitan) {
      return hargaPokok + biayaTambahan;
    }
    return hargaPokok;
  }
}

class StockMovement {
  final String id;
  final String productId;
  final String warehouseId;
  final MovementType type;
  final int quantity;
  final int qtyBefore;
  final int qtyAfter;
  final String note;
  final DateTime date;
  final String reference;

  StockMovement({
    required this.id,
    required this.productId,
    required this.warehouseId,
    required this.type,
    required this.quantity,
    required this.qtyBefore,
    required this.qtyAfter,
    required this.note,
    required this.date,
    required this.reference,
  });
}

class POItem {
  final String productId;
  final int quantity;
  final int receivedQty;

  POItem({
    required this.productId,
    required this.quantity,
    this.receivedQty = 0,
  });
}

class PurchaseOrder {
  final String id;
  final String code;
  final String supplierId;
  final String warehouseId;
  final List<POItem> items;
  DocStatus status;
  final DateTime createdAt;
  final String createdBy;

  PurchaseOrder({
    required this.id,
    required this.code,
    required this.supplierId,
    required this.warehouseId,
    required this.items,
    required this.status,
    required this.createdAt,
    required this.createdBy,
  });

  int get totalQty => items.fold(0, (s, i) => s + i.quantity);
}

class StockRequestItem {
  final String productId;
  final int quantity;
  final int approvedQty;

  StockRequestItem({
    required this.productId,
    required this.quantity,
    this.approvedQty = 0,
  });
}

class StockRequest {
  final String id;
  final String code;
  final String requesterId;
  final String warehouseId;
  final String purpose;
  final List<StockRequestItem> items;
  DocStatus status;
  final DateTime createdAt;
  String? filePath;

  StockRequest({
    required this.id,
    required this.code,
    required this.requesterId,
    required this.warehouseId,
    required this.purpose,
    required this.items,
    required this.status,
    required this.createdAt,
    this.filePath,
  });
}

class TransferItem {
  final String productId;
  final int quantity;

  TransferItem({required this.productId, required this.quantity});
}

class StockTransfer {
  final String id;
  final String code;
  final String fromWarehouseId;
  final String toWarehouseId;
  final List<TransferItem> items;
  DocStatus status;
  final DateTime createdAt;

  StockTransfer({
    required this.id,
    required this.code,
    required this.fromWarehouseId,
    required this.toWarehouseId,
    required this.items,
    required this.status,
    required this.createdAt,
  });
}

class ProductSubmission {
  final String id;
  final String code;
  final String name;
  final String sku;
  final String unit;
  final String categoryId;
  final String warehouseId;
  final int initialStock;
  final double hargaPokok;
  final String submittedBy;
  DocStatus status;
  final DateTime createdAt;

  ProductSubmission({
    required this.id,
    required this.code,
    required this.name,
    required this.sku,
    required this.unit,
    required this.categoryId,
    required this.warehouseId,
    required this.initialStock,
    required this.submittedBy,
    required this.status,
    required this.createdAt,
    this.hargaPokok = 0,
  });
}

class OpnameItem {
  final String productId;
  final int systemQty;
  int physicalQty;

  OpnameItem({
    required this.productId,
    required this.systemQty,
    required this.physicalQty,
  });

  int get diff => physicalQty - systemQty;
}

class StockOpname {
  final String id;
  final String code;
  final String warehouseId;
  final List<OpnameItem> items;
  DocStatus status;
  final DateTime createdAt;
  final String createdBy;

  StockOpname({
    required this.id,
    required this.code,
    required this.warehouseId,
    required this.items,
    required this.status,
    required this.createdAt,
    required this.createdBy,
  });
}

class BarcodeLog {
  final String id;
  final String productId;
  final String warehouseId;
  final String userId;
  final DateTime scannedAt;
  final String device;

  BarcodeLog({
    required this.id,
    required this.productId,
    required this.warehouseId,
    required this.userId,
    required this.scannedAt,
    required this.device,
  });
}

class FinanceSyncLog {
  final String id;
  final String reference;
  final MovementType movementType;
  final double amount;
  final DateTime syncedAt;
  FinanceSyncStatus status;
  final String note;

  FinanceSyncLog({
    required this.id,
    required this.reference,
    required this.movementType,
    required this.amount,
    required this.syncedAt,
    required this.status,
    required this.note,
  });
}

class StockReportSnapshot {
  final String id;
  final DateTime snapshotDate;
  final String warehouseId;
  final String productId;
  final int quantity;

  StockReportSnapshot({
    required this.id,
    required this.snapshotDate,
    required this.warehouseId,
    required this.productId,
    required this.quantity,
  });
}

class RoleRequest {
  final String id;
  final String name;
  final String email;
  final String reason;
  final UserRole requestedRole;
  DocStatus status;
  final DateTime createdAt;
  String? approvedBy;

  RoleRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.reason,
    required this.requestedRole,
    required this.status,
    required this.createdAt,
    this.approvedBy,
  });
}

class AboutUs {
  final String appName;
  final String version;
  final String description;
  final String company;
  final String email;
  final String phone;
  final String address;

  AboutUs({
    required this.appName,
    required this.version,
    required this.description,
    required this.company,
    required this.email,
    required this.phone,
    required this.address,
  });
}

/// =====================================================================
/// CHAT
/// =====================================================================

/// Satu pesan dalam thread chat.
class ChatMessage {
  final String id;
  final String senderId;
  final String text;
  final DateTime sentAt;
  final bool isMe;

  /// Lampiran sederhana (mis. nama file dokumen / BAST / SPK).
  /// Null kalau pesan teks biasa.
  final String? attachmentName;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.text,
    required this.sentAt,
    required this.isMe,
    this.attachmentName,
  });
}

/// Thread / percakapan dua pihak (user saat ini ↔ [participantId]).
/// Disimpan flat di MockDB.chats dan diurutkan berdasarkan [updatedAt]
/// terbaru di chat list.
class ChatThread {
  final String id;
  final String participantId;
  final List<ChatMessage> messages;
  int unread;
  bool pinned;

  ChatThread({
    required this.id,
    required this.participantId,
    required this.messages,
    this.unread = 0,
    this.pinned = false,
  });

  ChatMessage? get lastMessage =>
      messages.isEmpty ? null : messages.last;

  DateTime get updatedAt =>
      messages.isEmpty ? DateTime.now() : messages.last.sentAt;
}
