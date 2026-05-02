import 'package:warehouse/presentation/admin/pages/data/models/models.dart';


class MockDB {
  MockDB._();
  static final MockDB instance = MockDB._();

  final List<AppUser> users = [
    AppUser(
      id: 'u1',
      name: 'Salma Putri',
      email: 'super@warehouse.id',
      role: UserRole.superAdmin,
    ),
    AppUser(
      id: 'u2',
      name: 'Bagas Admin',
      email: 'admin@warehouse.id',
      role: UserRole.admin,
      warehouseId: 'w1',
    ),
    AppUser(
      id: 'u3',
      name: 'Dwi Kurnia',
      email: 'dwi@warehouse.id',
      role: UserRole.admin,
      warehouseId: 'w2',
    ),
  ];

  final List<Warehouse> warehouses = [
    Warehouse(
      id: 'w1',
      code: 'WH-001',
      name: 'Gudang Utama',
      city: 'Yogyakarta',
      address: 'Jl. Magelang KM 7, Yogyakarta',
    ),
    Warehouse(
      id: 'w2',
      code: 'WH-002',
      name: 'Gudang Cabang A',
      city: 'Solo',
      address: 'Jl. Slamet Riyadi 120, Solo',
    ),
    Warehouse(
      id: 'w3',
      code: 'WH-003',
      name: 'Gudang Cabang B',
      city: 'Semarang',
      address: 'Jl. Pandanaran 45, Semarang',
    ),
  ];

  final List<Supplier> suppliers = [
    Supplier(
      id: 's1',
      name: 'CV Maju Jaya',
      contact: 'Budi Santoso',
      phone: '0812-3456-7890',
      category: 'ATK',
    ),
    Supplier(
      id: 's2',
      name: 'PT Sinar Logistik',
      contact: 'Rina Wati',
      phone: '0813-9988-7766',
      category: 'Elektronik',
    ),
    Supplier(
      id: 's3',
      name: 'Toko Sentosa',
      contact: 'Dimas Pratama',
      phone: '0857-1122-3344',
      category: 'Kebersihan',
    ),
  ];

  final List<Category> categories = [
    Category(
      id: 'c1',
      code: 'ATK',
      name: 'Alat Tulis Kantor',
      description: 'Kebutuhan operasional kantor',
    ),
    Category(
      id: 'c2',
      code: 'ELK',
      name: 'Elektronik',
      description: 'Perangkat elektronik & aksesoris',
    ),
    Category(
      id: 'c3',
      code: 'KBR',
      name: 'Kebersihan',
      description: 'Perlengkapan kebersihan',
    ),
  ];

  final List<Product> products = [
    Product(
      id: 'p1',
      sku: 'SKU-00001',
      barcode: '8900000000001',
      name: 'Kertas HVS A4',
      unit: 'rim',
      categoryId: 'c1',
      minStock: 10,
      hargaPokok: 45000,
      status: DocStatus.approved,
      approvedBy: 'u1',
    ),
    Product(
      id: 'p2',
      sku: 'SKU-00002',
      barcode: '8900000000002',
      name: 'Pulpen Standard',
      unit: 'pcs',
      categoryId: 'c1',
      minStock: 50,
      hargaPokok: 2500,
      status: DocStatus.approved,
      approvedBy: 'u1',
    ),
    Product(
      id: 'p3',
      sku: 'SKU-00003',
      barcode: '8900000000003',
      name: 'Mouse Wireless Logitech',
      unit: 'pcs',
      categoryId: 'c2',
      minStock: 5,
      hargaPokok: 185000,
      status: DocStatus.approved,
      approvedBy: 'u1',
    ),
    Product(
      id: 'p4',
      sku: 'SKU-00004',
      barcode: '8900000000004',
      name: 'Tinta Printer Hitam',
      unit: 'botol',
      categoryId: 'c2',
      minStock: 8,
      hargaPokok: 95000,
      status: DocStatus.pending,
    ),
    Product(
      id: 'p5',
      sku: 'SKU-00005',
      barcode: '8900000000005',
      name: 'Sabun Cuci Tangan',
      unit: 'botol',
      categoryId: 'c3',
      minStock: 12,
      hargaPokok: 18000,
      status: DocStatus.approved,
      approvedBy: 'u1',
    ),
  ];

  /// Stok dipisah per peruntukan (maintenance vs perakitan).
  /// Stok perakitan punya [biayaTambahan] yang menambah nilai per unit
  /// saat dikeluarkan (dipakai untuk jurnal keuangan).
  final List<Stock> stocks = [
    // Kertas HVS - dipakai operasional (maintenance) di 2 gudang
    Stock(
      productId: 'p1',
      warehouseId: 'w1',
      quantity: 38,
      purpose: StockPurpose.maintenance,
    ),
    Stock(
      productId: 'p1',
      warehouseId: 'w1',
      quantity: 10,
      purpose: StockPurpose.perakitan,
      biayaTambahan: 5000,
    ),
    Stock(
      productId: 'p1',
      warehouseId: 'w2',
      quantity: 20,
      purpose: StockPurpose.maintenance,
    ),
    // Pulpen - sebagian besar maintenance, sedikit perakitan
    Stock(
      productId: 'p2',
      warehouseId: 'w1',
      quantity: 100,
      purpose: StockPurpose.maintenance,
    ),
    Stock(
      productId: 'p2',
      warehouseId: 'w1',
      quantity: 20,
      purpose: StockPurpose.perakitan,
      biayaTambahan: 1500,
    ),
    // Mouse Wireless - kebanyakan untuk perakitan PC kit
    Stock(
      productId: 'p3',
      warehouseId: 'w1',
      quantity: 4,
      purpose: StockPurpose.maintenance,
    ),
    Stock(
      productId: 'p3',
      warehouseId: 'w1',
      quantity: 10,
      purpose: StockPurpose.perakitan,
      biayaTambahan: 25000,
    ),
    // Tinta Printer - maintenance saja
    Stock(
      productId: 'p4',
      warehouseId: 'w1',
      quantity: 6,
      purpose: StockPurpose.maintenance,
    ),
    // Sabun cuci tangan - maintenance
    Stock(
      productId: 'p5',
      warehouseId: 'w1',
      quantity: 30,
      purpose: StockPurpose.maintenance,
    ),
  ];

  final List<PurchaseOrder> purchaseOrders = [
    PurchaseOrder(
      id: 'po1',
      code: 'PO/2026/0001',
      supplierId: 's1',
      warehouseId: 'w1',
      items: [POItem(productId: 'p1', quantity: 50, receivedQty: 50)],
      status: DocStatus.received,
      createdAt: DateTime.now().subtract(const Duration(days: 12)),
      createdBy: 'u2',
    ),
    PurchaseOrder(
      id: 'po2',
      code: 'PO/2026/0002',
      supplierId: 's2',
      warehouseId: 'w1',
      items: [
        POItem(productId: 'p3', quantity: 20),
        POItem(productId: 'p4', quantity: 30),
      ],
      status: DocStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      createdBy: 'u2',
    ),
    PurchaseOrder(
      id: 'po3',
      code: 'PO/2026/0003',
      supplierId: 's3',
      warehouseId: 'w1',
      items: [POItem(productId: 'p5', quantity: 40)],
      status: DocStatus.approved,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      createdBy: 'u2',
    ),
  ];

  final List<StockRequest> requests = [
    StockRequest(
      id: 'r1',
      code: 'REQ/2026/0001',
      requesterId: 'u3',
      warehouseId: 'w1',
      purpose: 'Distribusi internal divisi marketing',
      items: [StockRequestItem(productId: 'p1', quantity: 2, approvedQty: 2)],
      status: DocStatus.approved,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      filePath: 'spk_marketing_2026_001.pdf',
    ),
    StockRequest(
      id: 'r2',
      code: 'REQ/2026/0002',
      requesterId: 'u3',
      warehouseId: 'w1',
      purpose: 'Kebutuhan harian kantor',
      items: [
        StockRequestItem(productId: 'p2', quantity: 10),
        StockRequestItem(productId: 'p5', quantity: 3),
      ],
      status: DocStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      filePath: null,
    ),
  ];

  final List<StockTransfer> transfers = [
    StockTransfer(
      id: 't1',
      code: 'TRF/2026/0001',
      fromWarehouseId: 'w1',
      toWarehouseId: 'w2',
      items: [TransferItem(productId: 'p1', quantity: 20)],
      status: DocStatus.received,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
    StockTransfer(
      id: 't2',
      code: 'TRF/2026/0002',
      fromWarehouseId: 'w1',
      toWarehouseId: 'w3',
      items: [TransferItem(productId: 'p2', quantity: 30)],
      status: DocStatus.inTransit,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  final List<ProductSubmission> submissions = [
    ProductSubmission(
      id: 'ps1',
      code: 'PSB/2026/0001',
      name: 'Mouse Wireless Logitech',
      sku: 'SKU-00010',
      unit: 'pcs',
      categoryId: 'c2',
      warehouseId: 'w1',
      initialStock: 10,
      hargaPokok: 175000,
      submittedBy: 'u2',
      status: DocStatus.approved,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    ProductSubmission(
      id: 'ps2',
      code: 'PSB/2026/0002',
      name: 'Keyboard Mekanik',
      sku: 'SKU-00011',
      unit: 'pcs',
      categoryId: 'c2',
      warehouseId: 'w1',
      initialStock: 8,
      hargaPokok: 320000,
      submittedBy: 'u2',
      status: DocStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(hours: 18)),
    ),
  ];

  final List<StockOpname> opnames = [
    StockOpname(
      id: 'op1',
      code: 'OPN/2026/0001',
      warehouseId: 'w1',
      items: [
        OpnameItem(productId: 'p1', systemQty: 28, physicalQty: 25),
        OpnameItem(productId: 'p2', systemQty: 120, physicalQty: 120),
      ],
      status: DocStatus.completed,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      createdBy: 'u2',
    ),
  ];

  final List<StockMovement> movements = [
    StockMovement(
      id: 'm1',
      productId: 'p1',
      warehouseId: 'w1',
      type: MovementType.inbound,
      quantity: 50,
      qtyBefore: 0,
      qtyAfter: 50,
      note: 'Penerimaan PO/2026/0001',
      date: DateTime.now().subtract(const Duration(days: 12)),
      reference: 'PO/2026/0001',
    ),
    StockMovement(
      id: 'm2',
      productId: 'p1',
      warehouseId: 'w1',
      type: MovementType.outbound,
      quantity: 2,
      qtyBefore: 50,
      qtyAfter: 48,
      note: 'Request user (REQ/2026/0001)',
      date: DateTime.now().subtract(const Duration(days: 3)),
      reference: 'REQ/2026/0001',
    ),
    StockMovement(
      id: 'm3',
      productId: 'p1',
      warehouseId: 'w1',
      type: MovementType.transferOut,
      quantity: 20,
      qtyBefore: 48,
      qtyAfter: 28,
      note: 'Transfer keluar ke Gudang Cabang A',
      date: DateTime.now().subtract(const Duration(days: 7)),
      reference: 'TRF/2026/0001',
    ),
    StockMovement(
      id: 'm4',
      productId: 'p1',
      warehouseId: 'w2',
      type: MovementType.transferIn,
      quantity: 20,
      qtyBefore: 0,
      qtyAfter: 20,
      note: 'Transfer masuk dari Gudang Utama',
      date: DateTime.now().subtract(const Duration(days: 7)),
      reference: 'TRF/2026/0001',
    ),
    StockMovement(
      id: 'm5',
      productId: 'p1',
      warehouseId: 'w1',
      type: MovementType.adjustment,
      quantity: 3,
      qtyBefore: 28,
      qtyAfter: 25,
      note: 'Penyesuaian opname OPN/2026/0001',
      date: DateTime.now().subtract(const Duration(days: 2)),
      reference: 'OPN/2026/0001',
    ),
  ];

  final List<BarcodeLog> barcodeLogs = [
    BarcodeLog(
      id: 'bl1',
      productId: 'p1',
      warehouseId: 'w1',
      userId: 'u2',
      scannedAt: DateTime.now().subtract(const Duration(hours: 2)),
      device: 'Scanner Mobile A',
    ),
  ];

  final List<FinanceSyncLog> financeSyncLogs = [
    FinanceSyncLog(
      id: 'fs1',
      reference: 'PO/2026/0001',
      movementType: MovementType.inbound,
      amount: 50 * 45000,
      syncedAt: DateTime.now().subtract(const Duration(days: 12)),
      status: FinanceSyncStatus.synced,
      note: 'Penerimaan PO ke jurnal pembelian',
    ),
    FinanceSyncLog(
      id: 'fs2',
      reference: 'REQ/2026/0001',
      movementType: MovementType.outbound,
      amount: 2 * 45000,
      syncedAt: DateTime.now().subtract(const Duration(days: 3)),
      status: FinanceSyncStatus.synced,
      note: 'Pengeluaran request marketing',
    ),
    FinanceSyncLog(
      id: 'fs3',
      reference: 'OPN/2026/0001',
      movementType: MovementType.adjustment,
      amount: 3 * 45000,
      syncedAt: DateTime.now().subtract(const Duration(days: 2)),
      status: FinanceSyncStatus.pending,
      note: 'Penyesuaian opname menunggu sinkron',
    ),
    FinanceSyncLog(
      id: 'fs4',
      reference: 'TRF/2026/0001',
      movementType: MovementType.transferOut,
      amount: 20 * 45000,
      syncedAt: DateTime.now().subtract(const Duration(days: 7)),
      status: FinanceSyncStatus.failed,
      note: 'Sinkron gagal: koneksi finance API timeout',
    ),
  ];

  final List<StockReportSnapshot> stockReports = [
    StockReportSnapshot(
      id: 'sr1',
      snapshotDate: DateTime.now().subtract(const Duration(days: 3)),
      warehouseId: 'w1',
      productId: 'p1',
      quantity: 50,
    ),
    StockReportSnapshot(
      id: 'sr2',
      snapshotDate: DateTime.now().subtract(const Duration(days: 3)),
      warehouseId: 'w1',
      productId: 'p2',
      quantity: 120,
    ),
    StockReportSnapshot(
      id: 'sr3',
      snapshotDate: DateTime.now().subtract(const Duration(days: 1)),
      warehouseId: 'w1',
      productId: 'p1',
      quantity: 48,
    ),
    StockReportSnapshot(
      id: 'sr4',
      snapshotDate: DateTime.now().subtract(const Duration(days: 1)),
      warehouseId: 'w2',
      productId: 'p1',
      quantity: 20,
    ),
    StockReportSnapshot(
      id: 'sr5',
      snapshotDate: DateTime.now().subtract(const Duration(days: 1)),
      warehouseId: 'w1',
      productId: 'p4',
      quantity: 6,
    ),
  ];

  final List<RoleRequest> roleRequests = [
    RoleRequest(
      id: 'rr1',
      name: 'Andi Pratama',
      email: 'andi@warehouse.id',
      reason: 'Bertanggung jawab atas operasional Gudang Cabang B',
      requestedRole: UserRole.admin,
      status: DocStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    RoleRequest(
      id: 'rr2',
      name: 'Yuni Sari',
      email: 'yuni@warehouse.id',
      reason: 'Pindah dari divisi keuangan ke gudang Solo',
      requestedRole: UserRole.admin,
      status: DocStatus.approved,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      approvedBy: 'u1',
    ),
  ];

  /// Mock data chat. Asumsinya pengguna yg login adalah u2 (Bagas Admin),
  /// jadi pesan dengan senderId == 'u2' diset isMe = true.
  final List<ChatThread> chats = [
    ChatThread(
      id: 'ch1',
      participantId: 'u1',
      unread: 2,
      pinned: true,
      messages: [
        ChatMessage(
          id: 'ch1-m1',
          senderId: 'u1',
          text: 'Halo Bagas, tolong cek PO/2026/0002 ya. Sudah saya approve.',
          sentAt: DateTime.now().subtract(const Duration(hours: 5)),
          isMe: false,
        ),
        ChatMessage(
          id: 'ch1-m2',
          senderId: 'u2',
          text: 'Siap Bu Salma, saya proses penerimaan barang sekarang.',
          sentAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 50)),
          isMe: true,
        ),
        ChatMessage(
          id: 'ch1-m3',
          senderId: 'u1',
          text: 'Untuk stok perakitan PC, jangan lupa input biaya tambahannya.',
          sentAt: DateTime.now().subtract(const Duration(minutes: 35)),
          isMe: false,
        ),
        ChatMessage(
          id: 'ch1-m4',
          senderId: 'u1',
          text: 'Kalau ada selisih opname tolong info juga.',
          sentAt: DateTime.now().subtract(const Duration(minutes: 32)),
          isMe: false,
        ),
      ],
    ),
    ChatThread(
      id: 'ch2',
      participantId: 'u3',
      unread: 0,
      messages: [
        ChatMessage(
          id: 'ch2-m1',
          senderId: 'u3',
          text: 'Bang, request REQ/2026/0002 udah dikirim, mohon dicek.',
          sentAt: DateTime.now().subtract(const Duration(hours: 6)),
          isMe: false,
        ),
        ChatMessage(
          id: 'ch2-m2',
          senderId: 'u2',
          text: 'Oke Dwi, lampirannya menyusul ya?',
          sentAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 55)),
          isMe: true,
        ),
        ChatMessage(
          id: 'ch2-m3',
          senderId: 'u3',
          text: 'Iya, lagi minta TTD ke supervisor. Maks sore ini.',
          sentAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 52)),
          isMe: false,
        ),
        ChatMessage(
          id: 'ch2-m4',
          senderId: 'u2',
          text: 'Siap, saya tahan dulu approve-nya sampai lampiran masuk.',
          sentAt: DateTime.now().subtract(const Duration(hours: 5, minutes: 40)),
          isMe: true,
          attachmentName: 'REQ-2026-0002.pdf',
        ),
      ],
    ),
    ChatThread(
      id: 'ch3',
      participantId: 'u1',
      unread: 0,
      messages: [
        ChatMessage(
          id: 'ch3-m1',
          senderId: 'u2',
          text: 'Bu, saya notice stok perakitan mouse menipis di gudang utama.',
          sentAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
          isMe: true,
        ),
        ChatMessage(
          id: 'ch3-m2',
          senderId: 'u1',
          text: 'Buatkan PO baru ya, tambahkan biaya rakit Rp25.000/pcs.',
          sentAt: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
          isMe: false,
        ),
      ],
    ),
  ];

  final AboutUs aboutUs = AboutUs(
    appName: 'Warehouse Admin',
    version: '1.0.0',
    description:
        'Aplikasi manajemen gudang untuk admin & super admin yang mengelola PO, request, transfer, opname, dan sinkronisasi keuangan dalam satu alur terpadu.',
    company: 'PT Warehouse Solusi Indonesia',
    email: 'support@warehouse.id',
    phone: '+62 274 555-1234',
    address: 'Jl. Magelang KM 7, Yogyakarta 55284, Indonesia',
  );

  Product? findProductByBarcode(String code) {
    for (final p in products) {
      if (p.barcode == code || p.sku == code) return p;
    }
    return null;
  }

  Stock? stockOf(String productId, String warehouseId) {
    for (final s in stocks) {
      if (s.productId == productId && s.warehouseId == warehouseId) return s;
    }
    return null;
  }

  /// Total stok produk (semua peruntukan, semua gudang).
  int totalStockOf(String productId) {
    return stocks
        .where((s) => s.productId == productId)
        .fold(0, (sum, s) => sum + s.quantity);
  }

  /// Total stok produk untuk peruntukan tertentu (mis. perakitan saja).
  int totalStockByPurpose(String productId, StockPurpose purpose) {
    return stocks
        .where((s) => s.productId == productId && s.purpose == purpose)
        .fold(0, (sum, s) => sum + s.quantity);
  }

  /// Rata-rata biaya tambahan untuk stok perakitan suatu produk.
  /// Dipakai untuk preview di UI dan kalkulasi jurnal.
  double avgAssemblyCost(String productId) {
    final assembly = stocks
        .where((s) =>
            s.productId == productId &&
            s.purpose == StockPurpose.perakitan &&
            s.quantity > 0)
        .toList();
    if (assembly.isEmpty) return 0;
    final totalQty = assembly.fold<int>(0, (sum, s) => sum + s.quantity);
    final totalBiaya = assembly.fold<double>(
        0, (sum, s) => sum + s.biayaTambahan * s.quantity);
    return totalQty == 0 ? 0 : totalBiaya / totalQty;
  }

  Warehouse? warehouseById(String id) {
    for (final w in warehouses) {
      if (w.id == id) return w;
    }
    return null;
  }

  Supplier? supplierById(String id) {
    for (final s in suppliers) {
      if (s.id == id) return s;
    }
    return null;
  }

  Product? productById(String id) {
    for (final p in products) {
      if (p.id == id) return p;
    }
    return null;
  }

  Category? categoryById(String id) {
    for (final c in categories) {
      if (c.id == id) return c;
    }
    return null;
  }

  AppUser? userById(String id) {
    for (final u in users) {
      if (u.id == id) return u;
    }
    return null;
  }

  ChatThread? chatById(String id) {
    for (final c in chats) {
      if (c.id == id) return c;
    }
    return null;
  }

  /// Total chat yang masih unread (dipakai untuk badge di navbar).
  int totalUnreadChats() {
    return chats.fold<int>(0, (sum, c) => sum + c.unread);
  }
}
