import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/request_request_model.dart';
import 'package:warehouse/data/model/response/request_response_model.dart';

class StockRequestDatasource {
  // ─────────────────────────────────────────────────────────
  // Headers
  // ─────────────────────────────────────────────────────────
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    // 🔍 DEBUG: Print headers (sembunyikan token sebagian)
    final debugHeaders = Map<String, String>.from(headers);
    if (debugHeaders.containsKey('Authorization')) {
      final raw = debugHeaders['Authorization']!;
      debugHeaders['Authorization'] =
          raw.length > 20 ? '${raw.substring(0, 20)}...[TRUNCATED]' : raw;
    }
    dev.log('📋 [HEADERS] $debugHeaders', name: 'StockRequestDatasource');

    return headers;
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/requests (my requests)
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestListResponseModel>> getMyRequests({
    int page = 1,
    String? status,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;

      final url = Uri.parse('${Variables.baseUrl}/api/requests')
          .replace(queryParameters: params);

      dev.log('🌐 [GET] $url', name: 'StockRequestDatasource');

      final response = await http.get(url, headers: await _headers());

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body.length > 500 ? '${response.body.substring(0, 500)}...' : response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200) {
        return Right(StockRequestListResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal memuat permintaan saya (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] getMyRequests: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/admin/requests (all requests - admin)
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestListResponseModel>> getAllRequests({
    int page = 1,
    String? status,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (status != null && status.isNotEmpty) params['status'] = status;

      final url = Uri.parse('${Variables.baseUrl}/api/admin/requests')
          .replace(queryParameters: params);

      dev.log('🌐 [GET] $url', name: 'StockRequestDatasource');

      final response = await http.get(url, headers: await _headers());

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body.length > 500 ? '${response.body.substring(0, 500)}...' : response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200) {
        return Right(StockRequestListResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal memuat semua permintaan (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] getAllRequests: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/requests/{id}
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> getRequestDetail(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/requests/$id');

      dev.log('🌐 [GET] $url', name: 'StockRequestDatasource');

      final response = await http.get(url, headers: await _headers());

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body.length > 500 ? '${response.body.substring(0, 500)}...' : response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memuat detail (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] getRequestDetail: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // POST /api/requests  ← INI YANG ERROR 422
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> storeRequest(
      StoreStockRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/requests');

      // 🔍 DEBUG: Print payload sebelum dikirim
      final payload = request.toMap();
      final jsonBody = request.toJson();

      dev.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
          name: 'StockRequestDatasource');
      dev.log('🚀 [POST] $url', name: 'StockRequestDatasource');
      dev.log('📦 [PAYLOAD MAP] ${jsonEncode(payload)}',
          name: 'StockRequestDatasource');
      dev.log('📦 [PAYLOAD JSON] $jsonBody',
          name: 'StockRequestDatasource');
      dev.log('📦 [ITEMS COUNT] ${payload['items']?.length ?? 0}',
          name: 'StockRequestDatasource');

      // 🔍 DEBUG: Print setiap item
      final items = payload['items'] as List?;
      if (items != null) {
        for (int i = 0; i < items.length; i++) {
          dev.log('📦 [ITEM $i] ${jsonEncode(items[i])}',
              name: 'StockRequestDatasource');
        }
      }
      dev.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
          name: 'StockRequestDatasource');

      final headers = await _headers();
      final response = await http.post(url, headers: headers, body: jsonBody);

      // 🔍 DEBUG: Print response lengkap
      dev.log('📥 [STATUS] ${response.statusCode}',
          name: 'StockRequestDatasource');
      dev.log('📥 [RESPONSE BODY] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        // 🔍 DEBUG: Parse error detail dari response body
        String errorDetail = '';
        try {
          final errorJson = jsonDecode(response.body);
          dev.log('❗ [ERROR JSON] ${jsonEncode(errorJson)}',
              name: 'StockRequestDatasource');

          // Laravel validation errors biasanya di field 'errors' atau 'message'
          if (errorJson is Map) {
            final errors = errorJson['errors'];
            final message = errorJson['message'];
            dev.log('❗ [MESSAGE] $message', name: 'StockRequestDatasource');
            dev.log('❗ [ERRORS DETAIL] ${jsonEncode(errors)}',
                name: 'StockRequestDatasource');
            errorDetail = '\nMessage: $message\nErrors: ${jsonEncode(errors)}';
          }
        } catch (_) {
          dev.log('❗ [RAW ERROR] ${response.body}',
              name: 'StockRequestDatasource');
        }

        return Left(
            'Gagal membuat permintaan (${response.statusCode})$errorDetail');
      }
    } catch (e, st) {
      dev.log('❌ [EXCEPTION] storeRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // PUT /api/requests/{id}
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> updateRequest(
      int id, UpdateStockRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/requests/$id');
      final jsonBody = request.toJson();

      dev.log('🌐 [PUT] $url', name: 'StockRequestDatasource');
      dev.log('📦 [PAYLOAD] $jsonBody', name: 'StockRequestDatasource');

      final response =
          await http.put(url, headers: await _headers(), body: jsonBody);

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal mengupdate permintaan (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] updateRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // DELETE /api/requests/{id}
  // ─────────────────────────────────────────────────────────
  Future<Either<String, String>> deleteRequest(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/requests/$id');

      dev.log('🌐 [DELETE] $url', name: 'StockRequestDatasource');

      final response = await http.delete(url, headers: await _headers());

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200) {
        return const Right('Permintaan berhasil dihapus.');
      } else {
        return Left(
            'Gagal menghapus (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] deleteRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // POST /api/admin/requests/{id}/approve
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> approveRequest(
      int id, ApproveRequestModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/admin/requests/$id/approve');
      final jsonBody = request.toJson();

      dev.log('🌐 [POST] $url', name: 'StockRequestDatasource');
      dev.log('📦 [PAYLOAD] $jsonBody', name: 'StockRequestDatasource');

      final response =
          await http.post(url, headers: await _headers(), body: jsonBody);

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal menyetujui (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] approveRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // POST /api/admin/requests/{id}/reject
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> rejectRequest(
      int id, RejectRequestModel request) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/admin/requests/$id/reject');
      final jsonBody = request.toJson();

      dev.log('🌐 [POST] $url', name: 'StockRequestDatasource');
      dev.log('📦 [PAYLOAD] $jsonBody', name: 'StockRequestDatasource');

      final response =
          await http.post(url, headers: await _headers(), body: jsonBody);

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal menolak (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] rejectRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }

  // ─────────────────────────────────────────────────────────
  // POST /api/admin/requests/{id}/complete
  // ─────────────────────────────────────────────────────────
  Future<Either<String, StockRequestResponseModel>> completeRequest(int id) async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/admin/requests/$id/complete');

      dev.log('🌐 [POST] $url', name: 'StockRequestDatasource');

      final response = await http.post(url, headers: await _headers());

      dev.log('📥 [RESPONSE ${response.statusCode}] ${response.body}',
          name: 'StockRequestDatasource');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(StockRequestResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Gagal menyelesaikan (${response.statusCode}): ${response.body}');
      }
    } catch (e, st) {
      dev.log('❌ [ERROR] completeRequest: $e\n$st',
          name: 'StockRequestDatasource');
      return Left('Koneksi gagal: $e');
    }
  }
}


