import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

// import '../common/pagination_meta.dart';

class NotificationModel {
  final int id;
  final int userId;
  final String type;
  final String title;
  final String body;
  final Map<String, dynamic>? data;
  final bool isRead;
  final String? readAt;
  final String createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.body,
    this.data,
    required this.isRead,
    this.readAt,
    required this.createdAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) =>
      NotificationModel(
        id: map['id'] ?? 0,
        userId: map['user_id'] ?? 0,
        type: map['type'] ?? '',
        title: map['title'] ?? '',
        body: map['body'] ?? '',
        data:
            map['data'] is Map ? Map<String, dynamic>.from(map['data']) : null,
        isRead: map['is_read'] ?? false,
        readAt: map['read_at'],
        createdAt: map['created_at'] ?? '',
      );
}

class NotificationListResponseModel {
  final bool success;
  final List<NotificationModel> data;
  final PaginationMeta? meta;

  NotificationListResponseModel({
    required this.success,
    required this.data,
    this.meta,
  });

  factory NotificationListResponseModel.fromJson(String str) =>
      NotificationListResponseModel.fromMap(jsonDecode(str));

  factory NotificationListResponseModel.fromMap(Map<String, dynamic> map) {
    final rawData = map['data'];
    List<NotificationModel> items = [];
    PaginationMeta? meta;

    if (rawData is Map) {
      items = (rawData['data'] as List? ?? [])
          .map((e) => NotificationModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(rawData));
    } else if (rawData is List) {
      items = rawData.map((e) => NotificationModel.fromMap(e)).toList();
    }

    return NotificationListResponseModel(
        success: map['success'] ?? false, data: items, meta: meta);
  }
}

class UnreadCountResponseModel {
  final bool success;
  final int unreadCount;

  UnreadCountResponseModel({required this.success, required this.unreadCount});

  factory UnreadCountResponseModel.fromJson(String str) =>
      UnreadCountResponseModel.fromMap(jsonDecode(str));

  factory UnreadCountResponseModel.fromMap(Map<String, dynamic> map) =>
      UnreadCountResponseModel(
        success: map['success'] ?? false,
        unreadCount: map['data']?['unread_count'] ?? 0,
      );
}


