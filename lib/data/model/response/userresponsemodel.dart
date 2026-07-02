import 'dart:convert';

import 'package:warehouse/data/model/response/auth/auth_response_model.dart';

int? _safeInt(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

class UserListResponse {
  final bool success;
  final List<UserModel> data;

  UserListResponse({required this.success, required this.data});

  factory UserListResponse.fromJson(String str) =>
      UserListResponse.fromMap(jsonDecode(str));

  factory UserListResponse.fromMap(Map<String, dynamic> json) {
    final raw = json['data'];
    List<UserModel> users = [];
    if (raw is List) {
      users = raw.whereType<Map<String, dynamic>>().map(UserModel.fromMap).toList();
    }
    return UserListResponse(
      success: json['success'] == true,
      data: users,
    );
  }
}