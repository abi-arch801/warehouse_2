// lib/data/model/request/chat/chat_request_model.dart
import 'dart:convert';

/// POST /api/chats — mulai chat baru
class CreateChatRequestModel {
  final int receiverId;
  final String message;

  CreateChatRequestModel({
    required this.receiverId,
    required this.message,
  });

  String toJson() => jsonEncode({
        'receiver_id': receiverId,
        'message': message,
      });
}

/// POST /api/chats/{chat}/messages — kirim pesan
class SendMessageRequestModel {
  final String message;

  SendMessageRequestModel({required this.message});

  String toJson() => jsonEncode({'message': message});
}


