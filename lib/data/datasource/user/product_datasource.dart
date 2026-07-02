import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/product_request_model.dart';
import 'package:warehouse/data/model/response/product_response_model.dart';

class ProductDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/products
  Future<Either<String, ProductListResponseModel>> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
    bool? isActive,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (search != null && search.isNotEmpty) params['search'] = search;
      if (categoryId != null) params['category_id'] = '$categoryId';
      if (isActive != null) params['is_active'] = isActive ? '1' : '0';

      final url = Uri.parse('${Variables.baseUrl}/api/products')
          .replace(queryParameters: params);
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(ProductListResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memuat produk (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/products/{id}
  Future<Either<String, ProductResponseModel>> getProductDetail(
      int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/products/$id');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(ProductResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/products (admin)
  Future<Either<String, ProductResponseModel>> storeProduct(
      StoreProductRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/products');
      final response = await http.post(url,
          headers: await _headers(), body: request.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ProductResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal membuat produk (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/products/{id}
  Future<Either<String, ProductResponseModel>> updateProduct(
      int id, UpdateProductRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/products/$id');
      final response = await http.put(url,
          headers: await _headers(), body: request.toJson());

      if (response.statusCode == 200) {
        return Right(ProductResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal mengupdate produk (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // DELETE /api/products/{id}
  Future<Either<String, String>> deleteProduct(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/products/$id');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('Produk berhasil dihapus.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}