import 'dart:convert';

class SubjectModel {
  final int? id;
  final String? name;
  final String? description;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  SubjectModel({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory SubjectModel.fromJson(String str) =>
      SubjectModel.fromMap(jsonDecode(str));

  factory SubjectModel.fromMap(Map<String, dynamic> json) => SubjectModel(
        id: json['id'] as int?,
        name: json['name']?.toString(),
        description: json['description']?.toString(),
        isActive: json['is_active'] == true || json['is_active'] == 1,
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'is_active': isActive,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}