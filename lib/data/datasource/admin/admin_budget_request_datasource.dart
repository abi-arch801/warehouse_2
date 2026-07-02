import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';

class AdminBudgetRequestDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/admin/budget-requests
  Future<Either<String, BudgetRequestListResponseModel>> getAll({
    int page = 1,
    String? status,
    String? jenis,
    String? urgensi,
    String? divisi,
    String? dateFrom,
    String? dateTo,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;
      if (jenis != null && jenis.isNotEmpty) params['jenis'] = jenis;
      if (urgensi != null && urgensi.isNotEmpty) params['urgensi'] = urgensi;
      if (divisi != null && divisi.isNotEmpty) params['divisi'] = divisi;
      if (dateFrom != null) params['date_from'] = dateFrom;
      if (dateTo != null) params['date_to'] = dateTo;

      final url =
          Uri.parse('${Variables.baseUrl}/api/admin/budget-requests')
              .replace(queryParameters: params);

      dev.log('GET $url', name: 'AdminBudgetRequestDatasource');

      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(BudgetRequestListResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat RAB (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/admin/budget-requests/{id}
  Future<Either<String, BudgetRequestResponseModel>> getDetail(int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/admin/budget-requests/$id');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left('Gagal memuat detail (${response.statusCode})');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/admin/budget-requests/{id}/approve → forward ke SA
  Future<Either<String, BudgetRequestResponseModel>> approve(
      int id, ApproveBudgetRequestModel request) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/admin/budget-requests/$id/approve');

      dev.log('POST $url', name: 'AdminBudgetRequestDatasource');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal approve RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/admin/budget-requests/{id}/reject
  Future<Either<String, BudgetRequestResponseModel>> reject(
      int id, RejectBudgetRequestModel request) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/admin/budget-requests/$id/reject');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal reject RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/admin/budget-requests/{id}/tunda
  Future<Either<String, BudgetRequestResponseModel>> tunda(
      int id, TundaBudgetRequestModel request) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/admin/budget-requests/$id/tunda');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(BudgetRequestResponseModel.fromJson(response.body));
      }
      return Left(
          'Gagal tunda RAB (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}


