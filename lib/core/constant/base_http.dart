import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import '../../core/constant/variables.dart';

class BaseHttp {
  final _local = AuthLocalDatasource();

  Future<Map<String, String>> headers({bool withAuth = true}) async {
    final h = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (withAuth) {
      final token = await _local.getToken();
      if (token != null) h['Authorization'] = 'Bearer $token';
    }
    return h;
  }

  Uri url(String path, [Map<String, String>? params]) {
    final uri = Uri.parse('${Variables.baseUrl}$path');
    return params != null ? uri.replace(queryParameters: params) : uri;
  }

  Either<String, T> _handleResponse<T>(
    http.Response res,
    T Function(String body) parse,
  ) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      try {
        return Right(parse(res.body));
      } catch (e) {
        return Left('Gagal parse response: $e');
      }
    }
    try {
      final m = jsonDecode(res.body) as Map;
      return Left(m['message']?.toString() ?? 'Error ${res.statusCode}');
    } catch (_) {
      return Left('Error ${res.statusCode}');
    }
  }

  Future<Either<String, T>> get<T>(
    String path,
    T Function(String body) parse, {
    Map<String, String>? params,
  }) async {
    try {
      final res = await http.get(url(path, params), headers: await headers());
      return _handleResponse(res, parse);
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, T>> post<T>(
    String path,
    T Function(String body) parse, {
    String? body,
    bool withAuth = true,
  }) async {
    try {
      final res = await http.post(
        url(path),
        headers: await headers(withAuth: withAuth),
        body: body,
      );
      return _handleResponse(res, parse);
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, T>> put<T>(
    String path,
    T Function(String body) parse, {
    String? body,
  }) async {
    try {
      final res = await http.put(
        url(path),
        headers: await headers(),
        body: body,
      );
      return _handleResponse(res, parse);
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, T>> delete<T>(
    String path,
    T Function(String body) parse,
  ) async {
    try {
      final res = await http.delete(url(path), headers: await headers());
      return _handleResponse(res, parse);
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, T>> patch<T>(
  String path,
  T Function(String body) parse, {
  String? body,
}) async {
  try {
    final res = await http.patch(
      url(path),
      headers: await headers(),
      body: body,
    );

    return _handleResponse(res, parse);
  } catch (e) {
    return Left('Koneksi gagal: $e');
  }
}
}