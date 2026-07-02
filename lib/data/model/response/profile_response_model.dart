// lib/features/profile/models/admin_profile.dart

enum AdminRole { superAdmin, warehouseAdmin, finance, viewer }

extension AdminRoleX on AdminRole {
  String get label {
    switch (this) {
      case AdminRole.superAdmin:      return 'Super Admin';
      case AdminRole.warehouseAdmin:  return 'Admin Gudang';
      case AdminRole.finance:         return 'Keuangan';
      case AdminRole.viewer:          return 'Viewer';
    }
  }

  bool get canEditStock      => this == AdminRole.superAdmin || this == AdminRole.warehouseAdmin;
  bool get canViewFinance    => this == AdminRole.superAdmin || this == AdminRole.finance;
  bool get canManageUsers    => this == AdminRole.superAdmin;
}

class AdminProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final AdminRole role;
  final String? warehouseId;
  final String? warehouseName;
  final String? avatarUrl;
  final DateTime joinedAt;
  final bool isActive;
  final bool notificationsEnabled;
  final bool darkModeEnabled;

  const AdminProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.warehouseId,
    this.warehouseName,
    this.avatarUrl,
    required this.joinedAt,
    this.isActive = true,
    this.notificationsEnabled = true,
    this.darkModeEnabled = false,
  });

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  AdminProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    AdminRole? role,
    String? warehouseId,
    String? warehouseName,
    String? avatarUrl,
    DateTime? joinedAt,
    bool? isActive,
    bool? notificationsEnabled,
    bool? darkModeEnabled,
  }) {
    return AdminProfile(
      id:                    id                    ?? this.id,
      name:                  name                  ?? this.name,
      email:                 email                 ?? this.email,
      phone:                 phone                 ?? this.phone,
      role:                  role                  ?? this.role,
      warehouseId:           warehouseId           ?? this.warehouseId,
      warehouseName:         warehouseName         ?? this.warehouseName,
      avatarUrl:             avatarUrl             ?? this.avatarUrl,
      joinedAt:              joinedAt              ?? this.joinedAt,
      isActive:              isActive              ?? this.isActive,
      notificationsEnabled:  notificationsEnabled  ?? this.notificationsEnabled,
      darkModeEnabled:       darkModeEnabled       ?? this.darkModeEnabled,
    );
  }

  Map<String, dynamic> toJson() => {
        'id':                   id,
        'name':                 name,
        'email':                email,
        'phone':                phone,
        'role':                 role.name,
        'warehouseId':          warehouseId,
        'warehouseName':        warehouseName,
        'avatarUrl':            avatarUrl,
        'joinedAt':             joinedAt.toIso8601String(),
        'isActive':             isActive,
        'notificationsEnabled': notificationsEnabled,
        'darkModeEnabled':      darkModeEnabled,
      };

  factory AdminProfile.fromJson(Map<String, dynamic> json) => AdminProfile(
        id:           json['id'] as String,
        name:         json['name'] as String,
        email:        json['email'] as String,
        phone:        json['phone'] as String,
        role:         AdminRole.values.firstWhere((r) => r.name == json['role']),
        warehouseId:  json['warehouseId'] as String?,
        warehouseName: json['warehouseName'] as String?,
        avatarUrl:    json['avatarUrl'] as String?,
        joinedAt:     DateTime.parse(json['joinedAt'] as String),
        isActive:             json['isActive'] as bool? ?? true,
        notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
        darkModeEnabled:      json['darkModeEnabled'] as bool? ?? false,
      );
}