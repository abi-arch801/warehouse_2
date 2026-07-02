import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/budget_revision_request_model.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';

class AdminBudgetRevisionDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/budget-revisions
  Future<Either<String, BudgetRevisionListResponseModel>> getAll({
    int page = 1,
    String? status,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;

      final url = Uri.parse('${Variables.baseUrl}/api/budget-revisions')
          .replace(queryParameters: params);

      dev.log('GET $url', name: 'AdminBudgetRevisionDatasource');

      final response = await http.get(url, headers: await _headers());
      if (response.statusCode == 200) {
        return Right(BudgetRevisionListResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat revisi (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/budget-revisions/{id}
  Future<Either<String, BudgetRevisionResponseModel>> getDetail(int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-revisions/$id');
      final response = await http.get(url, headers: await _headers());
      if (response.statusCode == 200) {
        return Right(BudgetRevisionResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat detail (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/budget-revisions
  Future<Either<String, BudgetRevisionResponseModel>> store(
      StoreBudgetRevisionModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-revisions');

      dev.log('POST $url', name: 'AdminBudgetRevisionDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(BudgetRevisionResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal membuat revisi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/budget-revisions/{id}
  Future<Either<String, BudgetRevisionResponseModel>> update(
      int id, StoreBudgetRevisionModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/budget-revisions/$id');

      dev.log('PUT $url', name: 'AdminBudgetRevisionDatasource');

      final response = await http.put(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(BudgetRevisionResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal update revisi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/budget-revisions/{id}/approve
  Future<Either<String, BudgetRevisionResponseModel>> approve(
      int id, ApproveRejectRevisionModel request) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/budget-revisions/$id/approve');

      dev.log('POST $url', name: 'AdminBudgetRevisionDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(BudgetRevisionResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal approve revisi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/budget-revisions/{id}/reject
  Future<Either<String, BudgetRevisionResponseModel>> reject(
      int id, ApproveRejectRevisionModel request) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/budget-revisions/$id/reject');

      dev.log('POST $url', name: 'AdminBudgetRevisionDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(BudgetRevisionResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal reject revisi (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}