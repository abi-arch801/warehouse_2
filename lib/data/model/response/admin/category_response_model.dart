// import 'dart:convert';

// int? _safeInt(dynamic v) {
//   if (v == null) return null;
//   if (v is num) return v.toInt();
//   if (v is String) return int.tryParse(v);
//   return null;
// }

// bool? _safeBool(dynamic v) {
//   if (v == null) return null;
//   if (v is bool) return v;
//   if (v is int) return v == 1;
//   if (v is String) return v == '1' || v.toLowerCase() == 'true';
//   return null;
// }

// class CategoryListResponseModel {
//   final bool status;
//   final List<CategoryModel> data;

//   CategoryListResponseModel({required this.status, required this.data});

//   factory CategoryListResponseModel.fromJson(String str) =>
//       CategoryListResponseModel.fromMap(jsonDecode(str));

//   factory CategoryListResponseModel.fromMap(Map<String, dynamic> json) {
//     final raw = json['data'] as List<dynamic>? ?? [];
//     return CategoryListResponseModel(
//       status: json['status'] == true,
//       data: raw
//           .map((e) => CategoryModel.fromMap(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

// class CategoryDetailResponseModel {
//   final bool status;
//   final CategoryModel? data;

//   CategoryDetailResponseModel({required this.status, this.data});

//   factory CategoryDetailResponseModel.fromJson(String str) =>
//       CategoryDetailResponseModel.fromMap(jsonDecode(str));

//   factory CategoryDetailResponseModel.fromMap(Map<String, dynamic> json) {
//     return CategoryDetailResponseModel(
//       status: json['status'] == true,
//       data: json['data'] == null
//           ? null
//           : CategoryModel.fromMap(json['data'] as Map<String, dynamic>),
//     );
//   }
// }

// class CategoryMessageResponseModel {
//   final bool status;
//   final String message;

//   CategoryMessageResponseModel({required this.status, required this.message});

//   factory CategoryMessageResponseModel.fromJson(String str) =>
//       CategoryMessageResponseModel.fromMap(jsonDecode(str));

//   factory CategoryMessageResponseModel.fromMap(Map<String, dynamic> json) {
//     return CategoryMessageResponseModel(
//       status: json['status'] == true,
//       message: (json['message'] ?? '').toString(),
//     );
//   }
// }

// class CategoryModel {
//   final int id;
//   final String name;
//   final String? description;
//   final bool? isActive;
//   final String? createdAt;
//   final String? updatedAt;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     this.description,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory CategoryModel.fromMap(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: _safeInt(json['id']) ?? 0,
//       name: (json['name'] ?? '').toString(),
//       description: json['description']?.toString(),
//       isActive: _safeBool(json['is_active']),
//       createdAt: json['created_at']?.toString(),
//       updatedAt: json['updated_at']?.toString(),
//     );
//   }

//   Map<String, dynamic> toMap() => {
//         'id': id,
//         'name': name,
//         'description': description,
//         'is_active': isActive,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//       };
// }

import 'dart:convert';

int? _safeInt(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

bool? _safeBool(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v;
  if (v is int) return v == 1;
  if (v is String) return v == '1' || v.toLowerCase() == 'true';
  return null;
}

class CategoryListResponseModel {
  final bool status;
  final List<CategoryModel> data;

  CategoryListResponseModel({required this.status, required this.data});

  factory CategoryListResponseModel.fromJson(String str) =>
      CategoryListResponseModel.fromMap(jsonDecode(str));

  factory CategoryListResponseModel.fromMap(Map<String, dynamic> json) {
    final dataField = json['data'];
    List<dynamic> raw = [];
    if (dataField is Map<String, dynamic> && dataField['data'] is List) {
      raw = dataField['data'] as List<dynamic>;
    } else if (dataField is List) {
      raw = dataField;
    }

    return CategoryListResponseModel(
      status: json['success'] == true ||
          json['success'] == true ||
          json['status'] == true,
      data: raw
          .map((e) => CategoryModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CategoryDetailResponseModel {
  final bool status;
  final CategoryModel? data;

  CategoryDetailResponseModel({required this.status, this.data});

  factory CategoryDetailResponseModel.fromJson(String str) =>
      CategoryDetailResponseModel.fromMap(jsonDecode(str));

  factory CategoryDetailResponseModel.fromMap(Map<String, dynamic> json) {
    return CategoryDetailResponseModel(
      status: json['success'] == true || json['status'] == true,
      data: json['data'] == null
          ? null
          : CategoryModel.fromMap(json['data'] as Map<String, dynamic>),
    );
  }
}

class CategoryMessageResponseModel {
  final bool status;
  final String message;

  CategoryMessageResponseModel({required this.status, required this.message});

  factory CategoryMessageResponseModel.fromJson(String str) =>
      CategoryMessageResponseModel.fromMap(jsonDecode(str));

  factory CategoryMessageResponseModel.fromMap(Map<String, dynamic> json) {
    return CategoryMessageResponseModel(
      status: json['success'] == true || json['status'] == true,
      message: (json['message'] ?? '').toString(),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String? description;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      id: _safeInt(json['id']) ?? 0,
      name: (json['name'] ?? '').toString(),
      description: json['description']?.toString(),
      isActive: _safeBool(json['is_active']),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'is_active': isActive,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
