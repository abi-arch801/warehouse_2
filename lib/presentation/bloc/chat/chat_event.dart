part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  /// Load daftar semua user (untuk pilih kontak)
  const factory ChatEvent.loadUsers({String? search}) = _LoadUsers;

  /// Load daftar chat user yang sedang login
  const factory ChatEvent.loadChats() = _LoadChats;

  /// Load detail chat + messages + subscribe Reverb
  const factory ChatEvent.loadDetail(int chatId) = _LoadDetail;

  /// Kirim pesan ke chat yang ada
  const factory ChatEvent.sendMessage({
    required int chatId,
    required String message,
  }) = _SendMessage;

  /// Buat chat baru dengan user tertentu
  const factory ChatEvent.createChat({
    required int receiverId,
    required String message,
  }) = _CreateChat;

  /// Tandai chat sudah dibaca
  const factory ChatEvent.markAsRead(int chatId) = _MarkAsRead;

  /// Pesan baru masuk via Reverb (realtime)
  const factory ChatEvent.newRealtimeMessage(ChatMessageModel message) =
      _NewRealtimeMessage;

  /// Disconnect dari Reverb
  const factory ChatEvent.disconnectRealtime() = _DisconnectRealtime;
}