import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/shared/chat_response_model.dart';
import 'package:warehouse/data/model/response/userresponsemodel.dart';

class ChatRemoteDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // ── GET /api/users — daftar semua user untuk dichat ──────────────────────
// ── GET /api/chats/users — daftar semua user untuk dichat ────────────────
  Future<Either<String, UserListResponse>> getUsers({String? search}) async {
    try {
      final params = <String, String>{};
      if (search != null && search.isNotEmpty) params['search'] = search;
      final uri = Uri.parse('${Variables.baseUrl}/api/chats/users')
          .replace(queryParameters: params.isEmpty ? null : params);
      final res = await http.get(uri, headers: await _headers());
      debugPrint('[ChatDS] getUsers ${res.statusCode}');
      if (res.statusCode == 200)
        return Right(UserListResponse.fromJson(res.body));
      return Left('getUsers failed (${res.statusCode})');
    } catch (e) {
      return Left('getUsers exception: $e');
    }
  }

  // ── GET /api/chats ────────────────────────────────────────────────────────
  Future<Either<String, ChatListResponseModel>> getChats() async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/chats');
      final res = await http.get(uri, headers: await _headers());
      debugPrint('[ChatDS] getChats ${res.statusCode}');
      if (res.statusCode == 200)
        return Right(ChatListResponseModel.fromJson(res.body));
      return Left('getChats failed (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('getChats exception: $e');
    }
  }

  // ── GET /api/chats/{chatId} ───────────────────────────────────────────────
  Future<Either<String, ChatDetailResponseModel>> getChatDetail(
      int chatId) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/chats/$chatId');
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200)
        return Right(ChatDetailResponseModel.fromJson(res.body));
      return Left('getChatDetail failed (${res.statusCode})');
    } catch (e) {
      return Left('getChatDetail exception: $e');
    }
  }

  // ── POST /api/chats — buat chat baru sekaligus kirim pesan pertama ────────
  Future<Either<String, ChatActionResponseModel>> createChat({
    required int receiverId,
    required String message,
  }) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/chats');
      final res = await http.post(
        uri,
        headers: await _headers(),
        body: jsonEncode({'receiver_id': receiverId, 'message': message}),
      );
      debugPrint('[ChatDS] createChat ${res.statusCode}: ${res.body}');
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(ChatActionResponseModel.fromJson(res.body));
      }
      return Left('createChat failed (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('createChat exception: $e');
    }
  }

  // ── POST /api/chats/{chatId}/messages ─────────────────────────────────────
  Future<Either<String, ChatActionResponseModel>> sendMessage({
    required int chatId,
    required String message,
  }) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/chats/$chatId/messages');
      final res = await http.post(
        uri,
        headers: await _headers(),
        body: jsonEncode({'message': message}),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(ChatActionResponseModel.fromJson(res.body));
      }
      return Left('sendMessage failed (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('sendMessage exception: $e');
    }
  }

  // ── PUT /api/chats/{chatId}/read ──────────────────────────────────────────
  Future<Either<String, bool>> markAsRead(int chatId) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/chats/$chatId/read');
      final res = await http.put(uri, headers: await _headers());
      return Right(res.statusCode == 200);
    } catch (e) {
      return Left('markAsRead exception: $e');
    }
  }
}
