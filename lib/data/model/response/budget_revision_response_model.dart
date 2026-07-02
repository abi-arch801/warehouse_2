import 'dart:convert';

class BudgetRevisionModel {
  final int id;
  final int? budgetRequestId;
  final String? budgetRequestNomorForm;
  final double? budgetRequestTotalEstimasi;
  final String akunTerdampak;
  final String? kodeAkun;
  final double anggaranAwal;
  final double realisasi;
  final String jenisPerubahan;
  final double nominalPerubahan;
  final double anggaranBaru;
  final String alasanRevisi;
  final String status; // pending | approved | approved_revisi | ditunda | ditolak
  final int? createdBy;
  final String? createdByName;
  final int? approvedBy;
  final String? approvedByName;
  final String? catatanApprover;
  final String? approvedAt;
  final String? createdAt;

  BudgetRevisionModel({
    required this.id,
    this.budgetRequestId,
    this.budgetRequestNomorForm,
    this.budgetRequestTotalEstimasi,
    required this.akunTerdampak,
    this.kodeAkun,
    required this.anggaranAwal,
    required this.realisasi,
    required this.jenisPerubahan,
    required this.nominalPerubahan,
    required this.anggaranBaru,
    required this.alasanRevisi,
    required this.status,
    this.createdBy,
    this.createdByName,
    this.approvedBy,
    this.approvedByName,
    this.catatanApprover,
    this.approvedAt,
    this.createdAt,
  });

  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'approved':
        return 'Approved';
      case 'approved_revisi':
        return 'Approved Revisi';
      case 'ditunda':
        return 'Ditunda';
      case 'ditolak':
        return 'Ditolak';
      default:
        return status;
    }
  }

  factory BudgetRevisionModel.fromMap(Map<String, dynamic> map) {
    final brMap = map['budget_request'] is Map
        ? map['budget_request'] as Map<String, dynamic>
        : null;
    final createdByMap =
        map['created_by'] is Map ? map['created_by'] as Map<String, dynamic> : null;
    final approvedByMap =
        map['approved_by'] is Map ? map['approved_by'] as Map<String, dynamic> : null;

    return BudgetRevisionModel(
      id: map['id'] ?? 0,
      budgetRequestId: map['budget_request_id'],
      budgetRequestNomorForm: brMap?['nomor_form'],
      budgetRequestTotalEstimasi:
          brMap?['total_estimasi'] != null ? _toDouble(brMap!['total_estimasi']) : null,
      akunTerdampak: map['akun_terdampak'] ?? '',
      kodeAkun: map['kode_akun'],
      anggaranAwal: _toDouble(map['anggaran_awal']),
      realisasi: _toDouble(map['realisasi']),
      jenisPerubahan: map['jenis_perubahan'] ?? 'tambahan',
      nominalPerubahan: _toDouble(map['nominal_perubahan']),
      anggaranBaru: _toDouble(map['anggaran_baru']),
      alasanRevisi: map['alasan_revisi'] ?? '',
      status: map['status'] ?? 'pending',
      createdBy: map['created_by_id'] ?? (createdByMap == null ? map['created_by'] : null),
      createdByName: createdByMap?['name'],
      approvedBy: map['approved_by_id'],
      approvedByName: approvedByMap?['name'],
      catatanApprover: map['catatan_approver'],
      approvedAt: map['approved_at'],
      createdAt: map['created_at'],
    );
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

class BudgetRevisionResponseModel {
  final bool success;
  final String? message;
  final BudgetRevisionModel? data;

  BudgetRevisionResponseModel({required this.success, this.message, this.data});

  factory BudgetRevisionResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
    return BudgetRevisionResponseModel(
      success: map['success'] ?? false,
      message: map['message'],
      data: map['data'] != null
          ? BudgetRevisionModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class BudgetRevisionListResponseModel {
  final bool success;
  final List<BudgetRevisionModel> data;
  final int currentPage;
  final int lastPage;
  final int total;

  BudgetRevisionListResponseModel({
    required this.success,
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory BudgetRevisionListResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
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

    return BudgetRevisionListResponseModel(
      success: map['success'] ?? false,
      data: items
          .whereType<Map<String, dynamic>>()
          .map((e) => BudgetRevisionModel.fromMap(e))
          .toList(),
      currentPage: currentPage,
      lastPage: lastPage,
      total: total,
    );
  }
}