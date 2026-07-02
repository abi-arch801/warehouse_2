// lib/data/datasource/admin/admin_warehouse_remote_datasource.dart

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/admin_warehouse_model.dart';


class AdminWarehouseRemoteDatasource {
  // ── Header builder (sama persis pola AuthRemoteDatasource) ──────────────────
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // ── GET /api/warehouses ───────────────────────────────────────────────
  Future<Either<String, AdminWarehouseListResponse>> getWarehouses({
    int page = 1,
    String? search,
    bool? isActive,
  }) async {
    final params = {
      'page': page.toString(),
      if (search != null && search.isNotEmpty) 'search': search,
      if (isActive != null) 'is_active': isActive ? '1' : '0',
    };

    final url = Uri.parse('${Variables.baseUrl}/api/warehouses')
        .replace(queryParameters: params);

    final response = await http.get(url, headers: await _headers());

    debugPrint('=== GET WAREHOUSES ===');
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    if (response.statusCode == 200) {
      return Right(AdminWarehouseListResponse.fromJson(response.body));
    } else {
      return Left('Gagal memuat gudang (${response.statusCode})');
    }
  }

  // ── POST /api/warehouses ──────────────────────────────────────────────
  Future<Either<String, AdminWarehouseSingleResponse>> storeWarehouse(
    AdminStoreWarehouseRequest request,
  ) async {
    final url = Uri.parse('${Variables.baseUrl}/api/warehouses');

    final response = await http.post(
      url,
      headers: await _headers(),
      body: request.toJson(),
    );

    debugPrint('=== STORE WAREHOUSE ===');
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(AdminWarehouseSingleResponse.fromJson(response.body));
    } else {
      return Left('Gagal membuat gudang (${response.statusCode}): ${response.body}');
    }
  }

  // ── PUT /api/warehouses/{id} ──────────────────────────────────────────
  Future<Either<String, AdminWarehouseSingleResponse>> updateWarehouse(
    int id,
    AdminUpdateWarehouseRequest request,
  ) async {
    final url = Uri.parse('${Variables.baseUrl}/api/warehouses/$id');

    final response = await http.put(
      url,
      headers: await _headers(),
      body: request.toJson(),
    );

    debugPrint('=== UPDATE WAREHOUSE id=$id ===');
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    if (response.statusCode == 200) {
      return Right(AdminWarehouseSingleResponse.fromJson(response.body));
    } else {
      return Left('Gagal mengupdate gudang (${response.statusCode}): ${response.body}');
    }
  }

  // ── DELETE /api/warehouses/{id} ───────────────────────────────────────
  Future<Either<String, String>> deleteWarehouse(int id) async {
    final url = Uri.parse('${Variables.baseUrl}/api/warehouses/$id');

    final response = await http.delete(url, headers: await _headers());

    debugPrint('=== DELETE WAREHOUSE id=$id ===');
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    if (response.statusCode == 200) {
      final res = AdminWarehouseDeleteResponse.fromJson(response.body);
      return res.success
          ? Right(res.message)
          : Left(res.message);
    } else {
      return Left('Gagal menghapus gudang (${response.statusCode}): ${response.body}');
    }
  }
}



