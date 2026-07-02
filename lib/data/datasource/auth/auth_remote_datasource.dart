// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:warehouse/core/constant/variables.dart';
// import 'package:warehouse/data/model/request/auth/auth_request_model.dart';
// import 'package:warehouse/data/model/response/auth/auth_response_model.dart';
// import 'auth_local_datasource.dart';

// class AuthRemoteDatasource {
//   Future<Map<String, String>> _headers({bool withAuth = false}) async {
//     final h = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//     if (withAuth) {
//       final token = await AuthLocalDatasource().getToken();
//       if (token != null) h['Authorization'] = 'Bearer $token';
//     }
//     return h;
//   }

//   // POST /api/auth/login
//   Future<Either<String, AuthActionResponseModel>> login(
//       LoginRequestModel request) async {
//     try {
//       final url = Uri.parse('${Variables.baseUrl}/api/auth/login');
//       final response = await http.post(url,
//           headers: await _headers(), body: request.toJson());

//       if (response.statusCode == 200) {
//         final res = AuthActionResponseModel.fromJson(response.body);
//         if (res.success && res.data != null) {
//           await AuthLocalDatasource().saveAuthData(
//             AuthResponseModel(token: res.data!.token, user: res.data!.user),
//           );
//         }
//         return Right(res);
//       } else {
//         final res = AuthActionResponseModel.fromJson(response.body);
//         return Left(res.message);
//       }
//     } catch (e) {
//       return Left('Koneksi gagal: $e');
//     }
//   }

//   // POST /api/auth/register
//   Future<Either<String, AuthActionResponseModel>> register(
//       RegisterRequestModel request) async {
//     try {
//       final url = Uri.parse('${Variables.baseUrl}/api/auth/register');
//       final response = await http.post(url,
//           headers: await _headers(), body: request.toJson());

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final res = AuthActionResponseModel.fromJson(response.body);
//         if (res.success && res.data != null) {
//           await AuthLocalDatasource().saveAuthData(
//             AuthResponseModel(token: res.data!.token, user: res.data!.user),
//           );
//         }
//         return Right(res);
//       } else {
//         final res = AuthActionResponseModel.fromJson(response.body);
//         return Left(res.message);
//       }
//     } catch (e) {
//       return Left('Koneksi gagal: $e');
//     }
//   }

//   // POST /api/auth/logout
//   Future<Either<String, String>> logout() async {
//     try {
//       final url = Uri.parse('${Variables.baseUrl}/api/auth/logout');
//       final response =
//           await http.post(url, headers: await _headers(withAuth: true));

//       if (response.statusCode == 200) {
//         await AuthLocalDatasource().removeAuthData();
//         final res = MessageResponseModel.fromJson(response.body);
//         return Right(res.message);
//       } else {
//         return Left('Logout gagal (${response.statusCode})');
//       }
//     } catch (e) {
//       return Left('Koneksi gagal: $e');
//     }
//   }

//   // GET /api/auth/me
//   Future<Either<String, MeResponseModel>> me() async {
//     try {
//       final url = Uri.parse('${Variables.baseUrl}/api/auth/me');
//       final response =
//           await http.get(url, headers: await _headers(withAuth: true));

//       if (response.statusCode == 200) {
//         return Right(MeResponseModel.fromJson(response.body));
//       } else {
//         return Left('Gagal mengambil data user (${response.statusCode})');
//       }
//     } catch (e) {
//       return Left('Koneksi gagal: $e');
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/model/request/auth/auth_request_model.dart';
import 'package:warehouse/data/model/response/auth/auth_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Map<String, String>> _headers({bool withAuth = false}) async {
    final h = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (withAuth) {
      final token = await AuthLocalDatasource().getToken();
      if (token != null) h['Authorization'] = 'Bearer $token';
    }
    return h;
  }

  Future<Either<String, AuthActionResponseModel>> login(
      LoginRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/auth/login');
      debugPrint('>>> [Remote] POST $url body=${request.toJson()}');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      debugPrint(
          '>>> [Remote] login status=${response.statusCode} body=${response.body}');

      if (response.statusCode == 200) {
        final res = AuthActionResponseModel.fromJson(response.body);
        if (res.success && res.data != null) {
          await AuthLocalDatasource().saveAuthData(
            AuthResponseModel(token: res.data!.token, user: res.data!.user),
          );
          debugPrint('>>> [Remote] auth data saved, token=${res.data!.token}');
        }
        return Right(res);
      } else {
        final res = AuthActionResponseModel.fromJson(response.body);
        return Left(res.message);
      }
    } catch (e) {
      debugPrint('>>> [Remote] login exception: $e');
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, AuthActionResponseModel>> register(
      RegisterRequestModel request) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/auth/register');
      debugPrint('>>> [Remote] POST $url');

      final response = await http.post(
        url,
        headers: await _headers(),
        body: request.toJson(),
      );

      debugPrint(
          '>>> [Remote] register status=${response.statusCode} body=${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = AuthActionResponseModel.fromJson(response.body);
        if (res.success && res.data != null) {
          await AuthLocalDatasource().saveAuthData(
            AuthResponseModel(token: res.data!.token, user: res.data!.user),
          );
        }
        return Right(res);
      } else {
        final res = AuthActionResponseModel.fromJson(response.body);
        return Left(res.message);
      }
    } catch (e) {
      debugPrint('>>> [Remote] register exception: $e');
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/auth/logout');
      final response =
          await http.post(url, headers: await _headers(withAuth: true));

      if (response.statusCode == 200) {
        await AuthLocalDatasource().removeAuthData();
        final res = MessageResponseModel.fromJson(response.body);
        return Right(res.message);
      } else {
        return Left('Logout gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  Future<Either<String, MeResponseModel>> me() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/auth/me');
      final response =
          await http.get(url, headers: await _headers(withAuth: true));

      if (response.statusCode == 200) {
        return Right(MeResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal mengambil data user (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}
