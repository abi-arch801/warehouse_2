import 'dart:convert';

// ─────────────────────────────────────────────────────────────
//  BudgetRequestItem  (satu baris di rincian RAB)
//  Sesuai kolom tabel budget_request_items di Laravel:
//  nama_item, qty, satuan, estimasi_biaya, total, keterangan
// ─────────────────────────────────────────────────────────────
class BudgetRequestItem {
  final int id;
  final int budgetRequestId;
  final String namaItem;
  final double qty;
  final String? satuan;
  final double estimasiBiaya;
  final double total;
  final String? keterangan;

  BudgetRequestItem({
    required this.id,
    required this.budgetRequestId,
    required this.namaItem,
    required this.qty,
    this.satuan,
    required this.estimasiBiaya,
    required this.total,
    this.keterangan,
  });

  factory BudgetRequestItem.fromMap(Map<String, dynamic> map) {
    return BudgetRequestItem(
      id: map['id'] ?? 0,
      budgetRequestId: map['budget_request_id'] ?? 0,
      namaItem: map['nama_item'] ?? '',
      qty: _toDouble(map['qty']),
      satuan: map['satuan'],
      estimasiBiaya: _toDouble(map['estimasi_biaya']),
      total: _toDouble(map['total']),
      keterangan: map['keterangan'],
    );
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

// ─────────────────────────────────────────────────────────────
//  BudgetRequestModel  (satu RAB)
//  Sesuai kolom tabel budget_requests di Laravel:
//  nomor_form, user_id, divisi, tanggal_pengajuan, jenis,
//  kode_akun, nama_akun, keterangan, alasan_luar_rab, urgensi,
//  dampak_jika_tidak, sumber_dana, status, total_estimasi
// ─────────────────────────────────────────────────────────────
class BudgetRequestModel {
  final int id;
  final String nomorForm;
  final int userId;
  final String? userName;
  final String? userEmail;
  final String divisi;
  final String? tanggalPengajuan;
  final String jenis; // rab | luar_rab
  final String? kodeAkun;
  final String? namaAkun;
  final String? keterangan;
  final String? alasanLuarRab;
  final String urgensi; // normal | mendesak
  final String? dampakJikaTidak;
  final String? sumberDana; // realokasi | tambahan | lainnya
  final String status;
  final double totalEstimasi;
  final double totalRealisasi;

  // Admin approver
  final int? adminApproverId;
  final String? adminApproverName;
  final String? catatanAdmin;

  // Super admin approver
  final int? superAdminApproverId;
  final String? superAdminApproverName;

  final List<BudgetRequestItem> items;
  final String? createdAt;
  final String? updatedAt;

  BudgetRequestModel({
    required this.id,
    required this.nomorForm,
    required this.userId,
    this.userName,
    this.userEmail,
    required this.divisi,
    this.tanggalPengajuan,
    required this.jenis,
    this.kodeAkun,
    this.namaAkun,
    this.keterangan,
    this.alasanLuarRab,
    required this.urgensi,
    this.dampakJikaTidak,
    this.sumberDana,
    required this.status,
    required this.totalEstimasi,
    required this.totalRealisasi,
    this.adminApproverId,
    this.adminApproverName,
    this.catatanAdmin,
    this.superAdminApproverId,
    this.superAdminApproverName,
    required this.items,
    this.createdAt,
    this.updatedAt,
  });

  double get sisaAnggaran => totalEstimasi - totalRealisasi;

  /// Perihal ditampilkan dari nama_akun, atau fallback ke kode_akun / jenis
  String get perihal => namaAkun ?? kodeAkun ?? jenisLabel;

  String get jenisLabel => jenis == 'luar_rab' ? 'Luar RAB' : 'RAB';

  String get statusLabel {
    switch (status) {
      case 'draft':
        return 'Draft';
      case 'pending':
        return 'Menunggu Admin';
      case 'pending_sa':
        return 'Menunggu Super Admin';
      case 'approved':
        return 'Disetujui';
      case 'ditolak':
        return 'Ditolak';
      case 'ditunda':
        return 'Ditunda';
      default:
        return status;
    }
  }

  factory BudgetRequestModel.fromMap(Map<String, dynamic> map) {
    final userMap =
        map['user'] is Map ? map['user'] as Map<String, dynamic> : null;
    final adminMap = map['admin_approver'] is Map
        ? map['admin_approver'] as Map<String, dynamic>
        : null;
    final saMap = map['super_admin_approver'] is Map
        ? map['super_admin_approver'] as Map<String, dynamic>
        : null;

    final rawItems = map['items'];
    List<BudgetRequestItem> items = [];
    if (rawItems is List) {
      items = rawItems
          .whereType<Map<String, dynamic>>()
          .map((e) => BudgetRequestItem.fromMap(e))
          .toList();
    }

    return BudgetRequestModel(
      id: map['id'] ?? 0,
      nomorForm: map['nomor_form'] ?? '',
      userId: map['user_id'] ?? 0,
      userName: userMap?['name'] ?? map['user_name'],
      userEmail: userMap?['email'],
      divisi: map['divisi'] ?? '',
      tanggalPengajuan: map['tanggal_pengajuan'],
      jenis: map['jenis'] ?? 'rab',
      kodeAkun: map['kode_akun'],
      namaAkun: map['nama_akun'],
      keterangan: map['keterangan'],
      alasanLuarRab: map['alasan_luar_rab'],
      urgensi: map['urgensi'] ?? 'normal',
      dampakJikaTidak: map['dampak_jika_tidak'],
      sumberDana: map['sumber_dana'],
      status: map['status'] ?? 'draft',
      totalEstimasi: _toDouble(map['total_estimasi']),
      totalRealisasi: _toDouble(map['total_realisasi']),
      adminApproverId: map['admin_approver_id'],
      adminApproverName: adminMap?['name'],
      catatanAdmin: map['catatan_admin'],
      superAdminApproverId: map['super_admin_approver_id'],
      superAdminApproverName: saMap?['name'],
      items: items,
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

// ─────────────────────────────────────────────────────────────
//  Wrapper: satu item
// ─────────────────────────────────────────────────────────────
class BudgetRequestResponseModel {
  final bool success;
  final String? message;
  final BudgetRequestModel? data;

  BudgetRequestResponseModel({
    required this.success,
    this.message,
    this.data,
  });

  factory BudgetRequestResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
    return BudgetRequestResponseModel(
      success: map['success'] ?? false,
      message: map['message'],
      data: map['data'] != null
          ? BudgetRequestModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Wrapper: list + pagination
// ─────────────────────────────────────────────────────────────
class BudgetRequestListResponseModel {
  final bool success;
  final List<BudgetRequestModel> data;
  final int currentPage;
  final int lastPage;
  final int total;

  BudgetRequestListResponseModel({
    required this.success,
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory BudgetRequestListResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;

    // Laravel paginate() nesting: data.data
    final raw = map['data'];
    List<dynamic> items = [];
    int currentPage = 1, lastPage = 1, total = 0;

    if (raw is Map<String, dynamic>) {
      items = raw['data'] is List ? raw['data'] as List : [];
      currentPage = raw['current_page'] ?? 1;
      lastPage = raw['last_page'] ?? 1;
      total = raw['total'] ?? 0;
    } else if (raw is List) {
      items = raw;
    }

    return BudgetRequestListResponseModel(
      success: map['success'] ?? false,
      data: items
          .whereType<Map<String, dynamic>>()
          .map((e) => BudgetRequestModel.fromMap(e))
          .toList(),
      currentPage: currentPage,
      lastPage: lastPage,
      total: total,
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Summary keuangan (dari endpoint /summary, super admin)
// ─────────────────────────────────────────────────────────────
class BudgetSummaryModel {
  final int menungguAdmin;
  final int menungguSa;
  final int totalDisetujui;
  final int totalDitolak;
  final double totalAnggaran;
  final double totalRealisasi;
  final double sisaAnggaran;
  final int mendesakPending;

  BudgetSummaryModel({
    required this.menungguAdmin,
    required this.menungguSa,
    required this.totalDisetujui,
    required this.totalDitolak,
    required this.totalAnggaran,
    required this.totalRealisasi,
    required this.sisaAnggaran,
    required this.mendesakPending,
  });

  factory BudgetSummaryModel.fromMap(Map<String, dynamic> map) {
    return BudgetSummaryModel(
      menungguAdmin: map['menunggu_admin'] ?? 0,
      menungguSa: map['menunggu_sa'] ?? 0,
      totalDisetujui: map['total_disetujui'] ?? 0,
      totalDitolak: map['total_ditolak'] ?? 0,
      totalAnggaran: _toDouble(map['total_anggaran']),
      totalRealisasi: _toDouble(map['total_realisasi']),
      sisaAnggaran: _toDouble(map['sisa_anggaran']),
      mendesakPending: map['mendesak_pending'] ?? 0,
    );
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

class BudgetSummaryResponseModel {
  final bool success;
  final BudgetSummaryModel? data;

  BudgetSummaryResponseModel({required this.success, this.data});

  factory BudgetSummaryResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
    return BudgetSummaryResponseModel(
      success: map['success'] ?? false,
      data: map['data'] != null
          ? BudgetSummaryModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }
}