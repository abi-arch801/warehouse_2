import 'dart:convert';
import 'package:warehouse/data/model/response/pagination_meta.dart';

// ── Chat (migration: chats) ────────────────────────────────────────────────
// user_one_id SELALU user ID lebih kecil
class ChatModel {
  final int id;
  final int userOneId;
  final int userTwoId;
  final String? lastMessageAt;
  final Map<String, dynamic>? partner; // user lawan bicara
  final ChatMessageModel? latestMessage;
  final int unreadCount;

  const ChatModel({
    required this.id,
    required this.userOneId,
    required this.userTwoId,
    this.lastMessageAt,
    this.partner,
    this.latestMessage,
    this.unreadCount = 0,
  });

  factory ChatModel.fromMap(Map<String, dynamic> m) => ChatModel(
        id: m['id'] ?? 0,
        userOneId: m['user_one_id'] ?? 0,
        userTwoId: m['user_two_id'] ?? 0,
        lastMessageAt: m['last_message_at'],
        partner: m['partner'] is Map
            ? Map<String, dynamic>.from(m['partner'])
            : null,
        latestMessage: m['latest_message'] != null
            ? ChatMessageModel.fromMap(m['latest_message'])
            : null,
        unreadCount: m['unread_count'] ?? 0,
      );
}

// ── ChatMessage (migration: chat_messages) ─────────────────────────────────
class ChatMessageModel {
  final int id;
  final int chatId;
  final int senderId;
  final String message;
  final bool isRead;
  final String? readAt;
  final String createdAt;
  final Map<String, dynamic>? sender;

  const ChatMessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.message,
    required this.isRead,
    this.readAt,
    required this.createdAt,
    this.sender,
  });

  factory ChatMessageModel.fromMap(Map<String, dynamic> m) => ChatMessageModel(
        id: m['id'] ?? 0,
        chatId: m['chat_id'] ?? 0,
        senderId: m['sender_id'] ?? 0,
        message: m['message'] ?? '',
        isRead: m['is_read'] ?? false,
        readAt: m['read_at'],
        createdAt: m['created_at'] ?? '',
        sender:
            m['sender'] is Map ? Map<String, dynamic>.from(m['sender']) : null,
      );
}

class ChatListResponse {
  final bool success;
  final List<ChatModel> data;
  const ChatListResponse({required this.success, required this.data});

  factory ChatListResponse.fromJson(String s) =>
      ChatListResponse.fromMap(jsonDecode(s));
  factory ChatListResponse.fromMap(Map<String, dynamic> m) => ChatListResponse(
        success: m['success'] ?? false,
        data: (m['data'] as List? ?? [])
            .map((e) => ChatModel.fromMap(e))
            .toList(),
      );
}

class ChatDetailResponse {
  final bool success;
  final ChatModel? chat;
  final List<ChatMessageModel> messages;
  final PaginationMeta? meta;
  const ChatDetailResponse(
      {required this.success, this.chat, required this.messages, this.meta});

  factory ChatDetailResponse.fromJson(String s) =>
      ChatDetailResponse.fromMap(jsonDecode(s));
  factory ChatDetailResponse.fromMap(Map<String, dynamic> m) {
    final d = m['data'] ?? {};
    final rawMsgs = d['messages'];
    List<ChatMessageModel> msgs = [];
    PaginationMeta? meta;
    if (rawMsgs is Map) {
      msgs = (rawMsgs['data'] as List? ?? [])
          .map((e) => ChatMessageModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(rawMsgs));
    } else if (rawMsgs is List) {
      msgs = rawMsgs.map((e) => ChatMessageModel.fromMap(e)).toList();
    }
    return ChatDetailResponse(
      success: m['success'] ?? false,
      chat: d['chat'] != null ? ChatModel.fromMap(d['chat']) : null,
      messages: msgs,
      meta: meta,
    );
  }
}

class SendMessageResponse {
  final bool success;
  final String message;
  final ChatMessageModel? data;
  const SendMessageResponse(
      {required this.success, required this.message, this.data});

  factory SendMessageResponse.fromJson(String s) =>
      SendMessageResponse.fromMap(jsonDecode(s));
  factory SendMessageResponse.fromMap(Map<String, dynamic> m) =>
      SendMessageResponse(
        success: m['success'] ?? false,
        message: m['message'] ?? '',
        data: m['data'] != null ? ChatMessageModel.fromMap(m['data']) : null,
      );
}

// ── Notification (migration: notifications) ────────────────────────────────
class NotificationModel {
  final int id;
  final int userId;
  final String? type;
  final String title;
  final String body;
  final Map<String, dynamic>? data;
  final bool isRead;
  final String? readAt;
  final String createdAt;

  const NotificationModel({
    required this.id,
    required this.userId,
    this.type,
    required this.title,
    required this.body,
    this.data,
    required this.isRead,
    this.readAt,
    required this.createdAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> m) =>
      NotificationModel(
        id: m['id'] ?? 0,
        userId: m['user_id'] ?? 0,
        type: m['type'],
        title: m['title'] ?? '',
        body: m['body'] ?? '',
        data: m['data'] is Map ? Map<String, dynamic>.from(m['data']) : null,
        isRead: m['is_read'] ?? false,
        readAt: m['read_at'],
        createdAt: m['created_at'] ?? '',
      );
}

class NotificationListResponse {
  final bool success;
  final List<NotificationModel> data;
  final PaginationMeta? meta;
  const NotificationListResponse(
      {required this.success, required this.data, this.meta});

  factory NotificationListResponse.fromJson(String s) =>
      NotificationListResponse.fromMap(jsonDecode(s));

  factory NotificationListResponse.fromMap(Map<String, dynamic> m) {
    final raw = m['data'];
    List<NotificationModel> items = [];
    PaginationMeta? meta;
    if (raw is Map) {
      items = (raw['data'] as List? ?? [])
          .map((e) => NotificationModel.fromMap(e))
          .toList();
      meta = PaginationMeta.fromMap(Map<String, dynamic>.from(raw));
    } else if (raw is List) {
      items = raw.map((e) => NotificationModel.fromMap(e)).toList();
    }
    return NotificationListResponse(
        success: m['success'] ?? false, data: items, meta: meta);
  }
}

class UnreadCountResponse {
  final bool success;
  final int unreadCount;
  const UnreadCountResponse({required this.success, required this.unreadCount});

  factory UnreadCountResponse.fromJson(String s) =>
      UnreadCountResponse.fromMap(jsonDecode(s));
  factory UnreadCountResponse.fromMap(Map<String, dynamic> m) =>
      UnreadCountResponse(
        success: m['success'] ?? false,
        unreadCount: m['data']?['unread_count'] ?? 0,
      );
}



