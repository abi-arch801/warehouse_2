import 'dart:async';
import 'dart:convert';

import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/shared/chat_response_model.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

/// Samakan dengan .env REVERB_APP_KEY dan IP backend
const _reverbHost = '192.168.1.241';
const _reverbPort = 8080;
const _reverbAppKey = 'my-app-key';
const _reverbScheme = 'http'; // ganti 'https' kalau pakai TLS

class ReverbService {
  static final ReverbService _instance = ReverbService._internal();
  factory ReverbService() => _instance;
  ReverbService._internal();

  PusherChannelsFlutter? _pusher;
  bool _connected = false;

  final Map<int, StreamController<ChatMessageModel>> _msgCtrl = {};
  final Map<int, StreamController<List<int>>> _readCtrl = {};
  final Map<int, StreamController<int>> _deletedCtrl = {};

  // =========================
  // CONNECT ke Laravel Reverb
  // =========================
  Future<void> connect() async {
    if (_connected) return;

    final token = await AuthLocalDatasource().getToken();

    _pusher = PusherChannelsFlutter.getInstance();

    await _pusher!.init(
      apiKey: _reverbAppKey,
      cluster: 'mt1',
      // wsHost: _reverbHost,
      // wsPort: _reverbPort,
      // wssPort: _reverbPort,
      useTLS: _reverbScheme == 'https',
      // Endpoint auth untuk private channel (Laravel Sanctum)
      authEndpoint: '$_reverbScheme://$_reverbHost:8000/broadcasting/auth',
      authParams: {
        'headers': {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      },
      onConnectionStateChange: (current, previous) {
        _connected = current == 'CONNECTED';
      },
      onError: (message, code, error) {
        // ignore: avoid_print
        print('[ReverbService] Error: $message ($code)');
      },
    );

    await _pusher!.connect();
  }

  // =========================
  // SUBSCRIBE ke channel chat
  // Channel name: private-chat.{id}
  // (sesuai routes/channels.php warehouse)
  // =========================
  Future<void> subscribe(int chatId) async {
    await connect();

    _msgCtrl.putIfAbsent(chatId, () => StreamController.broadcast());
    _readCtrl.putIfAbsent(chatId, () => StreamController.broadcast());
    _deletedCtrl.putIfAbsent(chatId, () => StreamController.broadcast());

    await _pusher!.subscribe(
      // PENTING: nama channel harus sama persis dengan di channels.php
      // channels.php: Broadcast::channel('chat.{chatId}', ...)
      channelName: 'private-chat.$chatId',
      onEvent: (event) => _handleEvent(chatId, event),
      onSubscriptionSucceeded: (channelName, data) {
        // ignore: avoid_print
        print('[ReverbService] Subscribed to $channelName');
      },
      onSubscriptionError: (message, error) {
        // ignore: avoid_print
        print('[ReverbService] Subscribe error: $message');
      },
    );
  }

  void _handleEvent(int chatId, PusherEvent event) {
    try {
      final data = event.data != null
          ? jsonDecode(event.data!) as Map<String, dynamic>
          : <String, dynamic>{};

      switch (event.eventName) {
        // Event dari NewChatMessage::broadcastAs() → default: 'App\Events\NewChatMessage'
        // Atau bisa override di Event class dengan broadcastAs() → 'message.sent'
        case 'App\\Events\\NewChatMessage':
        case 'message.sent':
          _msgCtrl[chatId]?.add(ChatMessageModel.fromMap(data));
          break;

        case 'App\\Events\\ChatMessageRead':
        case 'messages.read':
          // Backend broadcast: { message_id, reader_id, chat_id }
          // Kita treat sebagai list (1 item per event)
          final msgId = data['message_id'] as int?;
          if (msgId != null) {
            _readCtrl[chatId]?.add([msgId]);
          }
          break;

        case 'App\\Events\\ChatMessageDeleted':
        case 'message.deleted':
          final msgId = data['message_id'] as int?;
          if (msgId != null) {
            _deletedCtrl[chatId]?.add(msgId);
          }
          break;
      }
    } catch (e) {
      // ignore: avoid_print
      print('[ReverbService] handleEvent error: $e');
    }
  }

  Stream<ChatMessageModel> messageStream(int chatId) {
    _msgCtrl.putIfAbsent(chatId, () => StreamController.broadcast());
    return _msgCtrl[chatId]!.stream;
  }

  Stream<List<int>> readStream(int chatId) {
    _readCtrl.putIfAbsent(chatId, () => StreamController.broadcast());
    return _readCtrl[chatId]!.stream;
  }

  Stream<int> deletedStream(int chatId) {
    _deletedCtrl.putIfAbsent(chatId, () => StreamController.broadcast());
    return _deletedCtrl[chatId]!.stream;
  }

  // Kompatibilitas dengan nama lama (kalau masih dipanggil di UI)
  Stream<ChatMessageModel> subscribeToChat(int chatId) {
    // tetap pastikan subscribe terjalankan
    subscribe(chatId);
    return messageStream(chatId);
  }

  Future<void> unsubscribe(int chatId) async {
    await _pusher?.unsubscribe(channelName: 'private-chat.$chatId');
    _msgCtrl[chatId]?.close();
    _msgCtrl.remove(chatId);
    _readCtrl[chatId]?.close();
    _readCtrl.remove(chatId);
    _deletedCtrl[chatId]?.close();
    _deletedCtrl.remove(chatId);
  }

  // Kompatibilitas dengan nama lama
  void unsubscribeFromChat(int chatId) {
    unsubscribe(chatId);
  }

  Future<void> disconnect() async {
    await _pusher?.disconnect();
    _connected = false;
    _pusher = null;
    for (final c in _msgCtrl.values) c.close();
    for (final c in _readCtrl.values) c.close();
    for (final c in _deletedCtrl.values) c.close();
    _msgCtrl.clear();
    _readCtrl.clear();
    _deletedCtrl.clear();
  }
}
