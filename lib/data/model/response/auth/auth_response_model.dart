import 'dart:convert';

// ─── User Profile ──────────────────────────────────────────────────────────
class UserProfileModel {
  final String? phone;
  final String? address;
  final String? photo;

  UserProfileModel({this.phone, this.address, this.photo});

  factory UserProfileModel.fromMap(Map<String, dynamic> map) =>
      UserProfileModel(
        phone: map['phone'],
        address: map['address'],
        photo: map['photo'],
      );

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'address': address,
        'photo': photo,
      };
}

// ─── User ──────────────────────────────────────────────────────────────────
class UserModel {
  final int id;
  final String name;
  final String email;
  final String role; // 'user', 'admin', 'super_admin'
  final bool isActive;
  final UserProfileModel? profile;
  final String? createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
    this.profile,
    this.createdAt,
  });

  bool get isAdmin => role == 'admin' || role == 'super_admin';
  bool get isSuperAdmin => role == 'super_admin';

  // ── tambahan dari userresponsemodel.dart ──
  String? get avatar => profile?.photo;

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  String get roleLabel {
    switch (role) {
      case 'super_admin':
      case 'superadmin':
        return 'Super Admin';
      case 'admin':
        return 'Admin';
      default:
        return 'User';
    }
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        role: map['role'] ?? 'user',
        isActive: map['is_active'] == true || map['is_active'] == 1,
        profile: map['profile'] != null
            ? UserProfileModel.fromMap(map['profile'])
            : null,
        createdAt: map['created_at'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'is_active': isActive,
        'profile': profile?.toMap(),
        'created_at': createdAt,
      };

  String toRawJson() => jsonEncode(toMap());
  factory UserModel.fromRawJson(String str) =>
      UserModel.fromMap(jsonDecode(str));
}

// ─── Auth Local Storage ────────────────────────────────────────────────────
class AuthResponseModel {
  final String token;
  final UserModel? user;

  AuthResponseModel({required this.token, this.user});

  Map<String, dynamic> toMap() => {'token': token, 'user': user?.toMap()};
  String toRawJson() => jsonEncode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) =>
      AuthResponseModel(
        token: map['token'] ?? '',
        user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      );

  factory AuthResponseModel.fromRawJson(String str) =>
      AuthResponseModel.fromMap(jsonDecode(str));
}

// ─── Login / Register API Response ────────────────────────────────────────
class AuthActionResponseModel {
  final bool success;
  final String message;
  final AuthDataModel? data;

  AuthActionResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory AuthActionResponseModel.fromJson(String str) =>
      AuthActionResponseModel.fromMap(jsonDecode(str));

  factory AuthActionResponseModel.fromMap(Map<String, dynamic> map) =>
      AuthActionResponseModel(
        success: map['success'] ?? false,
        message: map['message'] ?? '',
        data: map['data'] != null ? AuthDataModel.fromMap(map['data']) : null,
      );
}

class AuthDataModel {
  final UserModel user;
  final String token;
  final String tokenType;

  AuthDataModel({
    required this.user,
    required this.token,
    required this.tokenType,
  });

  factory AuthDataModel.fromMap(Map<String, dynamic> map) => AuthDataModel(
        user: UserModel.fromMap(map['user'] ?? {}),
        token: map['token'] ?? '',
        tokenType: map['token_type'] ?? 'Bearer',
      );
}

// ─── Me Response ───────────────────────────────────────────────────────────
class MeResponseModel {
  final bool success;
  final UserModel? data;

  MeResponseModel({required this.success, this.data});

  factory MeResponseModel.fromJson(String str) =>
      MeResponseModel.fromMap(jsonDecode(str));

  factory MeResponseModel.fromMap(Map<String, dynamic> map) => MeResponseModel(
        success: map['success'] ?? false,
        data: map['data'] != null ? UserModel.fromMap(map['data']) : null,
      );
}

// ─── Generic Message Response ──────────────────────────────────────────────
class MessageResponseModel {
  final bool success;
  final String message;

  MessageResponseModel({required this.success, required this.message});

  factory MessageResponseModel.fromJson(String str) =>
      MessageResponseModel.fromMap(jsonDecode(str));

  factory MessageResponseModel.fromMap(Map<String, dynamic> map) =>
      MessageResponseModel(
        success: map['success'] ?? false,
        message: map['message'] ?? '',
      );
}
