import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/user_list_response_model.dart';
import '../../../core/constant/variables.dart';
import '../../model/response/auth/auth_response_model.dart' hide UserListResponseModel;

class AdminUserDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/admin/users
  Future<Either<String, UserListResponseModel>> getUsers({
    int page = 1,
    String? search,
    String? role,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (search != null && search.isNotEmpty) params['search'] = search;
      if (role != null) params['role'] = role;

      final url = Uri.parse('${Variables.baseUrl}/api/admin/users')
          .replace(queryParameters: params);
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        return Right(UserListResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memuat user (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // POST /api/admin/users
  Future<Either<String, UserModel>> storeUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/admin/users');
      final response = await http.post(
        url,
        headers: await _headers(),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'role': role,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final map = jsonDecode(response.body);
        final userData = map['data'];
        if (userData != null) {
          return Right(UserModel.fromMap(userData));
        }
        return Left('Data user tidak valid');
      } else {
        final map = jsonDecode(response.body);
        return Left(map['message'] ?? 'Gagal menambah user');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/admin/users/{id}
  Future<Either<String, UserModel>> updateUser({
    required int id,
    String? name,
    String? email,
    String? role,
    bool? isActive,
  }) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/admin/users/$id');
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (email != null) body['email'] = email;
      if (role != null) body['role'] = role;
      if (isActive != null) body['is_active'] = isActive;

      final response = await http.put(url,
          headers: await _headers(), body: jsonEncode(body));
      if (response.statusCode == 200) {
        final map = jsonDecode(response.body);
        return Right(UserModel.fromMap(map['data'] ?? {}));
      } else {
        return Left('Gagal update user (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // DELETE /api/admin/users/{id}
  Future<Either<String, String>> deleteUser(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/admin/users/$id');
      final response = await http.delete(url, headers: await _headers());
      if (response.statusCode == 200) {
        return const Right('User berhasil dihapus.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/admin/users/{id}/toggle-active
  Future<Either<String, String>> toggleActive(int id) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/admin/users/$id/toggle-active');
      final response = await http.put(url, headers: await _headers());
      if (response.statusCode == 200) {
        return const Right('Status user diubah.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}