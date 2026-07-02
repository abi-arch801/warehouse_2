import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/warehouse_request_model.dart';
import 'package:warehouse/data/model/response/warehouse_response_model.dart' hide UpdateWarehouseRequestModel, StoreWarehouseRequestModel;

class WarehouseDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/warehouses
  Future<Either<String, WarehouseListResponseModel>> getWarehouses({
    int page = 1,
    String? search,
    bool? isActive,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (search != null && search.isNotEmpty) params['search'] = search;
      if (isActive != null) params['is_active'] = isActive ? '1' : '0';

      final url = Uri.parse('${Variables.baseUrl}/api/warehouses')
          .replace(queryParameters: params);
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(WarehouseListResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memuat gudang (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/warehouses/{id}
  Future<Either<String, WarehouseResponseModel>> getWarehouseDetail(
      int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/warehouses/$id');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(WarehouseResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/warehouses
  Future<Either<String, WarehouseResponseModel>> storeWarehouse(
      StoreWarehouseRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/warehouses');
      final response = await http.post(url,
          headers: await _headers(), body: request.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal membuat gudang (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/warehouses/{id}
  Future<Either<String, WarehouseResponseModel>> updateWarehouse(
      int id, UpdateWarehouseRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/warehouses/$id');
      final response = await http.put(url,
          headers: await _headers(), body: request.toJson());

      if (response.statusCode == 200) {
        return Right(WarehouseResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal mengupdate gudang (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // DELETE /api/warehouses/{id}
  Future<Either<String, String>> deleteWarehouse(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/warehouses/$id');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('Gudang berhasil dihapus.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}


