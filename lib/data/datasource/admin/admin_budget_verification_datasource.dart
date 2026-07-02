import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/budget_vverification_request_model.dart';
import 'package:warehouse/data/model/response/budget_verification_response_model.dart';

class AdminBudgetVerificationDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/budget-verifications
  Future<Either<String, BudgetVerificationListResponseModel>> getAll({
    int page = 1,
    String? status, // rekomendasi: setuju | tunda | tolak
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;

      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-verifications')
              .replace(queryParameters: params);

      dev.log('GET $url', name: 'AdminBudgetVerificationDatasource');

      final response = await http.get(url, headers: await _headers());
      if (response.statusCode == 200) {
        return Right(
            BudgetVerificationListResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat verifikasi (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/budget-verifications/{id}
  Future<Either<String, BudgetVerificationResponseModel>> getDetail(
      int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-verifications/$id');
      final response = await http.get(url, headers: await _headers());
      if (response.statusCode == 200) {
        return Right(BudgetVerificationResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat detail (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/budget-verifications
  Future<Either<String, BudgetVerificationResponseModel>> store(
      StoreBudgetVerificationModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-verifications');

      dev.log('POST $url', name: 'AdminBudgetVerificationDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(BudgetVerificationResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal menyimpan verifikasi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/budget-verifications/{id}
  Future<Either<String, BudgetVerificationResponseModel>> update(
      int id, StoreBudgetVerificationModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-verifications/$id');

      dev.log('PUT $url', name: 'AdminBudgetVerificationDatasource');

      final response = await http.put(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(BudgetVerificationResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal update verifikasi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}