// lib/data/model/response/activity/activity_response_model.dart
import 'dart:convert';

int? _safeInt(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

/// Model satu entri activity log (GET /api/activity-logs)
class ActivityLogModel {
  final int id;
  final int? userId;
  final String? userName;
  final String description;
  final String? subjectType;
  final int? subjectId;
  final Map<String, dynamic>? properties;
  final String? createdAt;

  ActivityLogModel({
    required this.id,
    this.userId,
    this.userName,
    required this.description,
    this.subjectType,
    this.subjectId,
    this.properties,
    this.createdAt,
  });

  factory ActivityLogModel.fromMap(Map<String, dynamic> json) {
    // user bisa nested di json['user']
    final user = json['user'];
    return ActivityLogModel(
      id: _safeInt(json['id']) ?? 0,
      userId: _safeInt(json['user_id']),
      userName: user is Map ? user['name']?.toString() : null,
      description: json['description']?.toString() ?? '',
      subjectType: json['subject_type']?.toString(),
      subjectId: _safeInt(json['subject_id']),
      properties: json['properties'] is Map
          ? Map<String, dynamic>.from(json['properties'] as Map)
          : null,
      createdAt: json['created_at']?.toString(),
    );
  }
}

/// Wrapper paginated response GET /api/activity-logs
class ActivityLogListResponseModel {
  final bool success;
  final List<ActivityLogModel> data;
  final int? currentPage;
  final int? lastPage;
  final int? total;

  ActivityLogListResponseModel({
    required this.success,
    required this.data,
    this.currentPage,
    this.lastPage,
    this.total,
  });

  factory ActivityLogListResponseModel.fromJson(String str) =>
      ActivityLogListResponseModel.fromMap(jsonDecode(str));

  factory ActivityLogListResponseModel.fromMap(Map<String, dynamic> json) {
    // Backend return: { data: { data: [...], current_page, last_page, total } }
    final outer = json['data'];
    List<ActivityLogModel> logs = [];
    int? currentPage, lastPage, total;

    if (outer is Map<String, dynamic>) {
      final list = outer['data'];
      if (list is List) {
        logs = list
            .whereType<Map<String, dynamic>>()
            .map(ActivityLogModel.fromMap)
            .toList();
      }
      currentPage = _safeInt(outer['current_page']);
      lastPage = _safeInt(outer['last_page']);
      total = _safeInt(outer['total']);
    } else if (outer is List) {
      // fallback jika tidak paginated
      logs = outer.whereType<Map<String, dynamic>>().map(ActivityLogModel.fromMap).toList();
    }

    return ActivityLogListResponseModel(
      success: json['success'] == true || json['data'] != null,
      data: logs,
      currentPage: currentPage,
      lastPage: lastPage,
      total: total,
    );
  }
}


