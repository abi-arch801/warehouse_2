import 'dart:convert';

// ─────────────────────────────────────────────────────────────
//  Item dalam RAB (untuk store/update)
//  Sesuai validasi Laravel:
//  items.*.nama_item      required
//  items.*.qty            nullable numeric
//  items.*.satuan         nullable string
//  items.*.estimasi_biaya required numeric
//  items.*.keterangan     nullable string
// ─────────────────────────────────────────────────────────────
class BudgetItemRequestModel {
  final String namaItem;
  final double qty;
  final String? satuan;
  final double estimasiBiaya;
  final String? keterangan;

  BudgetItemRequestModel({
    required this.namaItem,
    required this.qty,
    this.satuan,
    required this.estimasiBiaya,
    this.keterangan,
  });

  Map<String, dynamic> toMap() => {
        'nama_item': namaItem,
        'qty': qty,
        if (satuan != null && satuan!.isNotEmpty) 'satuan': satuan,
        'estimasi_biaya': estimasiBiaya,
        if (keterangan != null && keterangan!.isNotEmpty)
          'keterangan': keterangan,
      };
}

// ─────────────────────────────────────────────────────────────
//  Store / Update RAB (user)
//  Sesuai validasi Laravel UserBudgetRequestController@store:
//  divisi             required string
//  tanggal_pengajuan  required date
//  jenis              required in:rab,luar_rab
//  kode_akun          nullable string
//  nama_akun          nullable string
//  keterangan         nullable string
//  alasan_luar_rab    required_if jenis=luar_rab
//  urgensi            nullable in:normal,mendesak
//  dampak_jika_tidak  nullable string
//  sumber_dana        nullable in:realokasi,tambahan,lainnya
//  items              required array min:1
// ─────────────────────────────────────────────────────────────
class StoreBudgetRequestModel {
  final String divisi;
  final String tanggalPengajuan; // format: yyyy-MM-dd
  final String jenis; // rab | luar_rab
  final String? kodeAkun;
  final String? namaAkun;
  final String? keterangan;
  final String? alasanLuarRab; // wajib jika jenis == luar_rab
  final String urgensi; // normal | mendesak
  final String? dampakJikaTidak;
  final String? sumberDana; // realokasi | tambahan | lainnya
  final List<BudgetItemRequestModel> items;

  StoreBudgetRequestModel({
    required this.divisi,
    required this.tanggalPengajuan,
    required this.jenis,
    this.kodeAkun,
    this.namaAkun,
    this.keterangan,
    this.alasanLuarRab,
    this.urgensi = 'normal',
    this.dampakJikaTidak,
    this.sumberDana,
    required this.items,
  });

  String toJson() => jsonEncode({
        'divisi': divisi,
        'tanggal_pengajuan': tanggalPengajuan,
        'jenis': jenis,
        if (kodeAkun != null && kodeAkun!.isNotEmpty) 'kode_akun': kodeAkun,
        if (namaAkun != null && namaAkun!.isNotEmpty) 'nama_akun': namaAkun,
        if (keterangan != null && keterangan!.isNotEmpty)
          'keterangan': keterangan,
        if (jenis == 'luar_rab') 'alasan_luar_rab': alasanLuarRab ?? '',
        'urgensi': urgensi,
        if (dampakJikaTidak != null && dampakJikaTidak!.isNotEmpty)
          'dampak_jika_tidak': dampakJikaTidak,
        if (sumberDana != null && sumberDana!.isNotEmpty)
          'sumber_dana': sumberDana,
        'items': items.map((e) => e.toMap()).toList(),
      });
}

// ─────────────────────────────────────────────────────────────
//  Approve oleh Admin → forward ke Super Admin
// ─────────────────────────────────────────────────────────────
class ApproveBudgetRequestModel {
  final String? catatan;

  ApproveBudgetRequestModel({this.catatan});

  String toJson() => jsonEncode({
        if (catatan != null && catatan!.isNotEmpty) 'catatan': catatan,
      });
}

// ─────────────────────────────────────────────────────────────
//  Reject (admin atau super admin)
// ─────────────────────────────────────────────────────────────
class RejectBudgetRequestModel {
  final String catatan;

  RejectBudgetRequestModel({required this.catatan});

  String toJson() => jsonEncode({'catatan': catatan});
}

// ─────────────────────────────────────────────────────────────
//  Tunda oleh Admin
// ─────────────────────────────────────────────────────────────
class TundaBudgetRequestModel {
  final String catatan;

  TundaBudgetRequestModel({required this.catatan});

  String toJson() => jsonEncode({'catatan': catatan});
}

// ─────────────────────────────────────────────────────────────
//  Catat realisasi (super admin)
// ─────────────────────────────────────────────────────────────
class RealisasiBudgetRequestModel {
  final double jumlah;
  final String keterangan;
  final String tanggal;

  RealisasiBudgetRequestModel({
    required this.jumlah,
    required this.keterangan,
    required this.tanggal,
  });

  String toJson() => jsonEncode({
        'jumlah': jumlah,
        'keterangan': keterangan,
        'tanggal': tanggal,
      });
}