// ════════════════════════════════════════════════════════════════
//  user_list_response_model.dart  — FIXED
//  Error: Map<dynamic, dynamic> can't be assigned to Map<String, dynamic>
//  Fix: cast eksplisit .cast<String, dynamic>()
// ════════════════════════════════════════════════════════════════

import 'dart:convert';

class UserListResponseModel {
  final bool success;
  final UserListData? data;

  const UserListResponseModel({
    required this.success,
    this.data,
  });

  factory UserListResponseModel.fromJson(String str) =>
      UserListResponseModel.fromMap(jsonDecode(str) as Map<String, dynamic>);

  factory UserListResponseModel.fromMap(Map<String, dynamic> json) {
    return UserListResponseModel(
      success: json['success'] == true,
      data: json['data'] == null
          ? null
          : UserListData.fromMap(
              // ✅ FIXED: cast dulu sebelum di-pass ke fromMap
              (json['data'] as Map).cast<String, dynamic>(),
            ),
    );
  }
}

class UserListData {
  final List<UserListItem> data;
  final int currentPage;
  final int lastPage;
  final int total;
  final int perPage;

  const UserListData({
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.perPage,
  });

  factory UserListData.fromMap(Map<String, dynamic> json) {
    final rawList = json['data'] as List? ?? [];
    return UserListData(
      data: rawList
          .map((e) => UserListItem.fromMap(
                (e as Map).cast<String, dynamic>(), // ✅ cast tiap item
              ))
          .toList(),
      currentPage: (json['current_page'] ?? 1) as int,
      lastPage:    (json['last_page']    ?? 1) as int,
      total:       (json['total']        ?? 0) as int,
      perPage:     (json['per_page']     ?? 15) as int,
    );
  }
}

class UserListItem {
  final int id;
  final String name;
  final String email;
  final String role;
  final bool isActive;
  final UserProfile? profile;
  final String? createdAt;

  const UserListItem({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
    this.profile,
    this.createdAt,
  });

  factory UserListItem.fromMap(Map<String, dynamic> json) {
    return UserListItem(
      id:        (json['id']        ?? 0)    as int,
      name:       json['name']?.toString()   ?? '',
      email:      json['email']?.toString()  ?? '',
      role:       json['role']?.toString()   ?? 'user',
      isActive:   json['is_active'] == true  || json['is_active'] == 1,
      createdAt:  json['created_at']?.toString(),
      profile: json['profile'] == null
          ? null
          : UserProfile.fromMap(
              (json['profile'] as Map).cast<String, dynamic>(), // ✅ cast
            ),
    );
  }

  /// Huruf pertama nama untuk avatar
  String get initial =>
      name.isNotEmpty ? name[0].toUpperCase() : '?';

  /// Badge warna berdasarkan role
  bool get isSuperAdmin => role == 'super_admin';
  bool get isAdmin      => role == 'admin';
  bool get isUser       => role == 'user';
}

class UserProfile {
  final String? phone;
  final String? address;
  final String? photo;

  const UserProfile({this.phone, this.address, this.photo});

  factory UserProfile.fromMap(Map<String, dynamic> json) {
    return UserProfile(
      phone:   json['phone']?.toString(),
      address: json['address']?.toString(),
      photo:   json['photo']?.toString(),
    );
  }
}

// ── MODEL CLASSES (tambahkan di luar class AdminRemoteDatasource) ─────────────

class AdminUserModel {
  final int id;
  final String name;
  final String email;
  final String role;
  final String phone;
  final bool isActive;

  AdminUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.isActive,
  });

  factory AdminUserModel.fromJson(Map<String, dynamic> json) {
    return AdminUserModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? 'user',
      phone: json['phone'] as String? ?? '',
      isActive: json['is_active'] == true || json['is_active'] == 1,
    );
  }
}

class AdminUserListResponse {
  final List<AdminUserModel> data;
  AdminUserListResponse({required this.data});
}

class CreateUserRequestModel {
  final String name;
  final String email;
  final String password;
  final String role;

  CreateUserRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'role': role,
      };
}

class UpdateUserRequestModel {
  final String name;
  final String email;
  final String role;

  UpdateUserRequestModel({
    required this.name,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };
}

class ResetPasswordAdminRequestModel {
  final String password;
  final String passwordConfirmation;

  ResetPasswordAdminRequestModel({
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}