import 'dart:convert';

int? _safeInt(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

bool _safeBool(dynamic v) {
  if (v is bool) return v;
  if (v is int) return v == 1;
  return false;
}

// ── ChatUserModel ─────────────────────────────────────────────────────────────
class ChatUserModel {
  final int id;
  final String name;
  final String? role;
  final String? avatar;

  ChatUserModel({
    required this.id,
    required this.name,
    this.role,
    this.avatar,
  });

  factory ChatUserModel.fromMap(Map<String, dynamic> json) => ChatUserModel(
        id: _safeInt(json['id']) ?? 0,
        name: json['name']?.toString() ?? '',
        role: json['role']?.toString(),
        avatar: json['avatar']?.toString(),
      );

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  String get roleLabel {
    switch (role) {
      case 'superadmin': return 'Super Admin';
      case 'admin':      return 'Admin';
      default:           return 'User';
    }
  }
}

// ── ChatMessageModel ──────────────────────────────────────────────────────────
class ChatMessageModel {
  final int id;
  final int chatId;
  final int senderId;
  final String message;
  final bool isRead;
  final String? readAt;
  final String? createdAt;
  final ChatUserModel? sender;

  ChatMessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.message,
    required this.isRead,
    this.readAt,
    this.createdAt,
    this.sender,
  });

  factory ChatMessageModel.fromMap(Map<String, dynamic> json) => ChatMessageModel(
        id: _safeInt(json['id']) ?? 0,
        chatId: _safeInt(json['chat_id']) ?? 0,
        senderId: _safeInt(json['sender_id']) ?? 0,
        message: json['message']?.toString() ?? '',
        isRead: _safeBool(json['is_read']),
        readAt: json['read_at']?.toString(),
        createdAt: json['created_at']?.toString(),
        sender: json['sender'] == null
            ? null
            : ChatUserModel.fromMap(json['sender'] as Map<String, dynamic>),
      );
}

// ── ChatModel ─────────────────────────────────────────────────────────────────
class ChatModel {
  final int id;
  final int userOneId;
  final int userTwoId;
  final ChatUserModel? partner;
  final ChatMessageModel? latestMessage;
  final int unreadCount;
  final String? lastMessageAt;

  ChatModel({
    required this.id,
    required this.userOneId,
    required this.userTwoId,
    this.partner,
    this.latestMessage,
    required this.unreadCount,
    this.lastMessageAt,
  });

  factory ChatModel.fromMap(Map<String, dynamic> json) => ChatModel(
        id: _safeInt(json['id']) ?? 0,
        userOneId: _safeInt(json['user_one_id']) ?? 0,
        userTwoId: _safeInt(json['user_two_id']) ?? 0,
        partner: json['partner'] == null
            ? null
            : ChatUserModel.fromMap(json['partner'] as Map<String, dynamic>),
        latestMessage: json['latest_message'] == null
            ? null
            : ChatMessageModel.fromMap(json['latest_message'] as Map<String, dynamic>),
        unreadCount: _safeInt(json['unread_count']) ?? 0,
        lastMessageAt: json['last_message_at']?.toString(),
      );
}

// ── Response Wrappers ─────────────────────────────────────────────────────────
class ChatListResponseModel {
  final bool success;
  final List<ChatModel> data;

  ChatListResponseModel({required this.success, required this.data});

  factory ChatListResponseModel.fromJson(String str) =>
      ChatListResponseModel.fromMap(jsonDecode(str));

  factory ChatListResponseModel.fromMap(Map<String, dynamic> json) {
    final raw = json['data'];
    List<ChatModel> chats = [];
    if (raw is List) {
      chats = raw.whereType<Map<String, dynamic>>().map(ChatModel.fromMap).toList();
    }
    return ChatListResponseModel(success: json['success'] == true, data: chats);
  }
}

class ChatDetailData {
  final ChatModel chat;
  final List<ChatMessageModel> messages;

  ChatDetailData({required this.chat, required this.messages});

  factory ChatDetailData.fromMap(Map<String, dynamic> json) {
    final rawPagination = json['messages'];
    List<ChatMessageModel> msgs = [];
    if (rawPagination is Map && rawPagination['data'] is List) {
      msgs = (rawPagination['data'] as List)
          .whereType<Map<String, dynamic>>()
          .map(ChatMessageModel.fromMap)
          .toList();
    } else if (rawPagination is List) {
      msgs = rawPagination
          .whereType<Map<String, dynamic>>()
          .map(ChatMessageModel.fromMap)
          .toList();
    }
    return ChatDetailData(
      chat: ChatModel.fromMap(json['chat'] as Map<String, dynamic>),
      messages: msgs,
    );
  }
}

class ChatDetailResponseModel {
  final bool success;
  final ChatDetailData? data;

  ChatDetailResponseModel({required this.success, this.data});

  factory ChatDetailResponseModel.fromJson(String str) =>
      ChatDetailResponseModel.fromMap(jsonDecode(str));

  factory ChatDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      ChatDetailResponseModel(
        success: json['success'] == true,
        data: json['data'] == null
            ? null
            : ChatDetailData.fromMap(json['data'] as Map<String, dynamic>),
      );
}

class ChatActionResponseModel {
  final bool success;
  final String message;
  final ChatMessageModel? sentMessage;
  final int? chatId;

  ChatActionResponseModel({
    required this.success,
    required this.message,
    this.sentMessage,
    this.chatId,
  });

  factory ChatActionResponseModel.fromJson(String str) =>
      ChatActionResponseModel.fromMap(jsonDecode(str));

  factory ChatActionResponseModel.fromMap(Map<String, dynamic> json) {
    final data = json['data'];
    ChatMessageModel? msg;
    int? chatId;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('chat') && data['chat'] is Map) {
        chatId = _safeInt((data['chat'] as Map)['id']);
      }
      if (data.containsKey('message') && data['message'] is Map) {
        msg = ChatMessageModel.fromMap(data['message'] as Map<String, dynamic>);
      } else if (data.containsKey('id')) {
        msg = ChatMessageModel.fromMap(data);
        chatId ??= _safeInt(data['chat_id']);
      }
    }
    return ChatActionResponseModel(
      success: json['success'] == true,
      message: json['message']?.toString() ?? '',
      sentMessage: msg,
      chatId: chatId,
    );
  }
}