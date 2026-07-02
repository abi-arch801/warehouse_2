import 'dart:convert';

class BudgetVerificationModel {
  final int id;
  final int budgetRequestId;
  final String? budgetRequestNomorForm;
  final double? budgetRequestTotalEstimasi;
  final bool docFormLengkap;
  final bool docSuratJustifikasi;
  final bool docEstimasiVendor;
  final bool docSpesifikasiTeknis;
  final String? docLainnya;
  final String? cekAnggaran;
  final String? analisaCashflow;
  final String rekomendasi; // setuju | tunda | tolak
  final double? nominalRekomendasi;
  final String? catatanFinance;
  final int? verifiedBy;
  final String? verifiedByName;
  final String? verifiedAt;

  BudgetVerificationModel({
    required this.id,
    required this.budgetRequestId,
    this.budgetRequestNomorForm,
    this.budgetRequestTotalEstimasi,
    required this.docFormLengkap,
    required this.docSuratJustifikasi,
    required this.docEstimasiVendor,
    required this.docSpesifikasiTeknis,
    this.docLainnya,
    this.cekAnggaran,
    this.analisaCashflow,
    required this.rekomendasi,
    this.nominalRekomendasi,
    this.catatanFinance,
    this.verifiedBy,
    this.verifiedByName,
    this.verifiedAt,
  });

  String get rekomendasiLabel {
    switch (rekomendasi) {
      case 'setuju':
        return 'Setuju';
      case 'tunda':
        return 'Tunda';
      case 'tolak':
        return 'Tolak';
      default:
        return rekomendasi;
    }
  }

  factory BudgetVerificationModel.fromMap(Map<String, dynamic> map) {
    final brMap = map['budget_request'] is Map
        ? map['budget_request'] as Map<String, dynamic>
        : null;
    final verifierMap =
        map['verified_by'] is Map ? map['verified_by'] as Map<String, dynamic> : null;

    return BudgetVerificationModel(
      id: map['id'] ?? 0,
      budgetRequestId: map['budget_request_id'] ?? 0,
      budgetRequestNomorForm: brMap?['nomor_form'],
      budgetRequestTotalEstimasi:
          brMap?['total_estimasi'] != null ? _toDouble(brMap!['total_estimasi']) : null,
      docFormLengkap: map['doc_form_lengkap'] == true || map['doc_form_lengkap'] == 1,
      docSuratJustifikasi:
          map['doc_surat_justifikasi'] == true || map['doc_surat_justifikasi'] == 1,
      docEstimasiVendor:
          map['doc_estimasi_vendor'] == true || map['doc_estimasi_vendor'] == 1,
      docSpesifikasiTeknis:
          map['doc_spesifikasi_teknis'] == true || map['doc_spesifikasi_teknis'] == 1,
      docLainnya: map['doc_lainnya'],
      cekAnggaran: map['cek_anggaran'],
      analisaCashflow: map['analisa_cashflow'],
      rekomendasi: map['rekomendasi'] ?? 'tunda',
      nominalRekomendasi: map['nominal_rekomendasi'] != null
          ? _toDouble(map['nominal_rekomendasi'])
          : null,
      catatanFinance: map['catatan_finance'],
      verifiedBy: map['verified_by_id'],
      verifiedByName: verifierMap?['name'],
      verifiedAt: map['verified_at'],
    );
  }

  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }
}

class BudgetVerificationResponseModel {
  final bool success;
  final String? message;
  final BudgetVerificationModel? data;

  BudgetVerificationResponseModel({required this.success, this.message, this.data});

  factory BudgetVerificationResponseModel.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
    return BudgetVerificationResponseModel(
      success: map['success'] ?? false,
      message: map['message'],
      data: map['data'] != null
          ? BudgetVerificationModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class BudgetVerificationListResponseModel {
  final bool success;
  final List<BudgetVerificationModel> data;
  final int currentPage;
  final int lastPage;
  final int total;

  BudgetVerificationListResponseModel({
    required this.success,
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory BudgetVerificationListResponseModel.fromJson(String source) {
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

    return BudgetVerificationListResponseModel(
      success: map['success'] ?? false,
      data: items
          .whereType<Map<String, dynamic>>()
          .map((e) => BudgetVerificationModel.fromMap(e))
          .toList(),
      currentPage: currentPage,
      lastPage: lastPage,
      total: total,
    );
  }
}