import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/supplier_response_model.dart';

class SupplierDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Either<String, List<SupplierModel>>> getSuppliers() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/suppliers');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final raw = body['data'];

        List<dynamic> items = [];
        if (raw is List) {
          // data langsung array
          items = raw;
        } else if (raw is Map) {
          // data terbungkus pagination: { "data": [...], "total": ... }
          items = (raw['data'] as List?) ?? [];
        }

        return Right(
          items
              .map((e) => SupplierModel.fromMap(e as Map<String, dynamic>))
              .toList(),
        );
      }
      return Left('Gagal memuat supplier: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SupplierModel>> getSupplierDetail(
      String supplierId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/suppliers/$supplierId');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return Right(
          SupplierModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal memuat detail supplier: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SupplierModel>> createSupplier(
      Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/suppliers');
      final response = await http.post(
        url,
        headers: await _headers(),
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        return Right(
          SupplierModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal membuat supplier: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SupplierModel>> updateSupplier(
    String supplierId,
    Map<String, dynamic> data,
  ) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/suppliers/$supplierId');
      final response = await http.put(
        url,
        headers: await _headers(),
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return Right(
          SupplierModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal mengupdate supplier: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> deleteSupplier(String supplierId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/suppliers/$supplierId');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right('Supplier berhasil dihapus');
      }
      return Left('Gagal menghapus supplier: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
