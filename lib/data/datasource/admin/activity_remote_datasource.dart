// lib/data/datasource/activity_remote_datasource.dart
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/activity_response_model.dart';

class ActivityRemoteDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  /// GET /api/activity-logs — super_admin only, paginate 50
  Future<Either<String, ActivityLogListResponseModel>> getActivityLogs({
    int page = 1,
  }) async {
    try {
      final url = Uri.parse(
          '${Variables.baseUrl}/api/activity-logs?page=$page');
      final response = await http.get(url, headers: await _headers());
      debugPrint('[ActivityDS] getActivityLogs ${response.statusCode}');
      if (response.statusCode == 200) {
        return Right(ActivityLogListResponseModel.fromJson(response.body));
      }
      return Left(
          'getActivityLogs failed (${response.statusCode}): ${response.body}');
    } catch (e) {
      return Left('getActivityLogs exception: $e');
    }
  }
}



