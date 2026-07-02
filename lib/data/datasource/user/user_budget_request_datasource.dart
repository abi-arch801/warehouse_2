import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';

class UserBudgetRequestDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/user/budget-requests
  Future<Either<String, BudgetRequestListResponseModel>> getAll({
    int page = 1,
    String? status,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;

      final url =
          Uri.parse('${Variables.baseUrl}/api/user/budget-requests')
              .replace(queryParameters: params);

      dev.log('GET $url', name: 'UserBudgetRequestDatasource');

      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(BudgetRequestListResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat RAB (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/user/budget-requests/{id}
  Future<Either<String, BudgetRequestResponseModel>> getDetail(int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/user/budget-requests/$id');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat detail (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/user/budget-requests  — simpan sebagai draft
  Future<Either<String, BudgetRequestResponseModel>> store(
      StoreBudgetRequestModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/user/budget-requests');

      dev.log('POST $url', name: 'UserBudgetRequestDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left('Gagal membuat RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/user/budget-requests/{id}  — update draft
  Future<Either<String, BudgetRequestResponseModel>> update(
      int id, StoreBudgetRequestModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/user/budget-requests/$id');

      final response = await http.put(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left('Gagal update RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // DELETE /api/user/budget-requests/{id}  — hapus draft
  Future<Either<String, String>> delete(int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/user/budget-requests/$id');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('RAB berhasil dihapus.');
      }
      return Left('Gagal hapus RAB (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/user/budget-requests/{id}/submit  — kirim ke admin
  Future<Either<String, BudgetRequestResponseModel>> submit(int id) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/user/budget-requests/$id/submit');

      dev.log('POST $url', name: 'UserBudgetRequestDatasource');

      final response = await http.post(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left('Gagal submit RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}