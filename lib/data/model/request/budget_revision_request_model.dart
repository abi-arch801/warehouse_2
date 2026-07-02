import 'dart:convert';

class StoreBudgetRevisionModel {
  final int? budgetRequestId;
  final String akunTerdampak;
  final String? kodeAkun;
  final double anggaranAwal;
  final double realisasi;
  final String jenisPerubahan; // tambahan | pengurangan
  final double nominalPerubahan;
  final String alasanRevisi;

  StoreBudgetRevisionModel({
    this.budgetRequestId,
    required this.akunTerdampak,
    this.kodeAkun,
    required this.anggaranAwal,
    required this.realisasi,
    required this.jenisPerubahan,
    required this.nominalPerubahan,
    required this.alasanRevisi,
  });

  String toJson() => jsonEncode({
        if (budgetRequestId != null) 'budget_request_id': budgetRequestId,
        'akun_terdampak': akunTerdampak,
        if (kodeAkun != null) 'kode_akun': kodeAkun,
        'anggaran_awal': anggaranAwal,
        'realisasi': realisasi,
        'jenis_perubahan': jenisPerubahan,
        'nominal_perubahan': nominalPerubahan,
        'alasan_revisi': alasanRevisi,
      });
}

class ApproveRejectRevisionModel {
  final String? catatan;

  ApproveRejectRevisionModel({this.catatan});

  String toJson() => jsonEncode({
        if (catatan != null) 'catatan': catatan,
      });
}