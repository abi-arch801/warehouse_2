part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial()  = _Initial;
  const factory ChatState.loading()  = _Loading;

  /// Daftar user berhasil dimuat
  const factory ChatState.usersLoaded(List<UserModel> users) = _UsersLoaded;

  /// Daftar chat berhasil dimuat
  const factory ChatState.chatsLoaded(List<ChatModel> chats) = _ChatsLoaded;

  /// Detail chat + history messages
  const factory ChatState.detailLoaded({
    required ChatModel chat,
    required List<ChatMessageModel> messages,
  }) = _DetailLoaded;

  /// Pesan berhasil terkirim (konfirmasi server)
  const factory ChatState.messageSent(ChatMessageModel message) = _MessageSent;

  /// Chat baru berhasil dibuat
  const factory ChatState.chatCreated(int chatId) = _ChatCreated;

  /// Mark as read berhasil
  const factory ChatState.markedAsRead() = _MarkedAsRead;

  /// Pesan realtime masuk via Reverb
  const factory ChatState.realtimeMessage(ChatMessageModel message) =
      _RealtimeMessage;

  const factory ChatState.error(String message) = _Error;
}