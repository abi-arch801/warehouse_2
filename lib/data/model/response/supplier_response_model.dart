import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

class SupplierModel {
  final int id;
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
  final bool isActive;
  final String? createdAt;

  const SupplierModel({
    required this.id,
    required this.name,
    required this.code,
    this.contactPerson,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.province,
    this.npwp,
    this.bankName,
    this.bankAccount,
    this.bankAccountName,
    this.notes,
    required this.isActive,
    this.createdAt,
  });

  factory SupplierModel.fromMap(Map<String, dynamic> m) => SupplierModel(
        id: m['id'] ?? 0,
        name: m['name'] ?? '',
        code: m['code'] ?? '',
        contactPerson: m['contact_person'],
        phone: m['phone'],
        email: m['email'],
        address: m['address'],
        city: m['city'],
        province: m['province'],
        npwp: m['npwp'],
        bankName: m['bank_name'],
        bankAccount: m['bank_account'],
        bankAccountName: m['bank_account_name'],
        notes: m['notes'],
        isActive: m['is_active'] ?? true,
        createdAt: m['created_at'],
      );
}

class SupplierListResponse {
  final bool success;
  final List<SupplierModel> data;
  final PaginationMeta? meta;

  const SupplierListResponse(
      {required this.success, required this.data, this.meta});

  factory SupplierListResponse.fromJson(String s) =>
      SupplierListResponse.fromMap(jsonDecode(s));

  factory SupplierListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<SupplierModel> items = [];
    PaginationMeta? meta;
    if (raw is Map) {
      items = (raw['data'] as List? ?? [])
          .map((e) => SupplierModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
    } else if (raw is List) {
      items = raw.map((e) => SupplierModel.fromMap(e)).toList();
    }
    return SupplierListResponse(
        success: m['success'] ?? false, data: items, meta: meta);
  }
}

class SupplierSingleResponse {
  final bool success;
  final String? message;
  final SupplierModel? data;

  const SupplierSingleResponse(
      {required this.success, this.message, this.data});

  factory SupplierSingleResponse.fromJson(String s) =>
      SupplierSingleResponse.fromMap(jsonDecode(s));

  factory SupplierSingleResponse.fromMap(Map<String, dynamic> m) =>
      SupplierSingleResponse(
        success: m['success'] ?? false,
        message: m['message'],
        data: m['data'] != null ? SupplierModel.fromMap(m['data']) : null,
      );
}





