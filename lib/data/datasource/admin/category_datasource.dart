import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/category_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Either<String, List<CategoryModel>>> getCategories({
    String? search,
  }) async {
    var url = '${Variables.baseUrl}/api/categories';
    if (search != null && search.isNotEmpty) {
      url += '?search=$search';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: await _headers(),
    );

    if (response.statusCode == 200) {
      final res = CategoryListResponseModel.fromJson(response.body);
      return Right(res.data);
    } else {
      return Left(
        'getCategories failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<Either<String, CategoryModel>> getCategoryDetail(
    String categoryId,
  ) async {
    final url = Uri.parse(
      '${Variables.baseUrl}/api/categories/$categoryId',
    );
    final response = await http.get(url, headers: await _headers());

    if (response.statusCode == 200) {
      final res = CategoryDetailResponseModel.fromJson(response.body);
      if (res.data != null) {
        return Right(res.data!);
      }
      return Left('getCategoryDetail failed: data null');
    } else {
      return Left(
        'getCategoryDetail failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<Either<String, String>> createCategory(
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('${Variables.baseUrl}/api/categories');
    final response = await http.post(
      url,
      headers: await _headers(),
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = CategoryMessageResponseModel.fromJson(response.body);
      return Right(
        res.message.isNotEmpty ? res.message : 'Kategori berhasil ditambahkan',
      );
    } else {
      return Left(
        'createCategory failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<Either<String, String>> updateCategory(
    String categoryId,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse(
      '${Variables.baseUrl}/api/categories/$categoryId',
    );
    final response = await http.put(
      url,
      headers: await _headers(),
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final res = CategoryMessageResponseModel.fromJson(response.body);
      return Right(
        res.message.isNotEmpty ? res.message : 'Kategori berhasil diupdate',
      );
    } else {
      return Left(
        'updateCategory failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  Future<Either<String, String>> deleteCategory(String categoryId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}/api/categories/$categoryId',
    );
    final response = await http.delete(url, headers: await _headers());

    if (response.statusCode == 200) {
      final res = CategoryMessageResponseModel.fromJson(response.body);
      return Right(
        res.message.isNotEmpty ? res.message : 'Kategori berhasil dihapus',
      );
    } else {
      return Left(
        'deleteCategory failed (${response.statusCode}): ${response.body}',
      );
    }
  }
}
