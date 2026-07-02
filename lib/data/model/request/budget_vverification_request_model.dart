import 'dart:convert';

class StoreBudgetVerificationModel {
  final int budgetRequestId;
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

  StoreBudgetVerificationModel({
    required this.budgetRequestId,
    this.docFormLengkap = false,
    this.docSuratJustifikasi = false,
    this.docEstimasiVendor = false,
    this.docSpesifikasiTeknis = false,
    this.docLainnya,
    this.cekAnggaran,
    this.analisaCashflow,
    required this.rekomendasi,
    this.nominalRekomendasi,
    this.catatanFinance,
  });

  String toJson() => jsonEncode({
        'budget_request_id': budgetRequestId,
        'doc_form_lengkap': docFormLengkap,
        'doc_surat_justifikasi': docSuratJustifikasi,
        'doc_estimasi_vendor': docEstimasiVendor,
        'doc_spesifikasi_teknis': docSpesifikasiTeknis,
        if (docLainnya != null) 'doc_lainnya': docLainnya,
        if (cekAnggaran != null) 'cek_anggaran': cekAnggaran,
        if (analisaCashflow != null) 'analisa_cashflow': analisaCashflow,
        'rekomendasi': rekomendasi,
        if (nominalRekomendasi != null)
          'nominal_rekomendasi': nominalRekomendasi,
        if (catatanFinance != null) 'catatan_finance': catatanFinance,
      });
}