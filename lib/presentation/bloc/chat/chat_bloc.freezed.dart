// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadUsersImplCopyWith<$Res> {
  factory _$$LoadUsersImplCopyWith(
          _$LoadUsersImpl value, $Res Function(_$LoadUsersImpl) then) =
      __$$LoadUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$LoadUsersImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadUsersImpl>
    implements _$$LoadUsersImplCopyWith<$Res> {
  __$$LoadUsersImplCopyWithImpl(
      _$LoadUsersImpl _value, $Res Function(_$LoadUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$LoadUsersImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadUsersImpl implements _LoadUsers {
  const _$LoadUsersImpl({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'ChatEvent.loadUsers(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUsersImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUsersImplCopyWith<_$LoadUsersImpl> get copyWith =>
      __$$LoadUsersImplCopyWithImpl<_$LoadUsersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return loadUsers(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return loadUsers?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return loadUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return loadUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(this);
    }
    return orElse();
  }
}

abstract class _LoadUsers implements ChatEvent {
  const factory _LoadUsers({final String? search}) = _$LoadUsersImpl;

  String? get search;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUsersImplCopyWith<_$LoadUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadChatsImplCopyWith<$Res> {
  factory _$$LoadChatsImplCopyWith(
          _$LoadChatsImpl value, $Res Function(_$LoadChatsImpl) then) =
      __$$LoadChatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChatsImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadChatsImpl>
    implements _$$LoadChatsImplCopyWith<$Res> {
  __$$LoadChatsImplCopyWithImpl(
      _$LoadChatsImpl _value, $Res Function(_$LoadChatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadChatsImpl implements _LoadChats {
  const _$LoadChatsImpl();

  @override
  String toString() {
    return 'ChatEvent.loadChats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return loadChats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return loadChats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadChats != null) {
      return loadChats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return loadChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return loadChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadChats != null) {
      return loadChats(this);
    }
    return orElse();
  }
}

abstract class _LoadChats implements ChatEvent {
  const factory _LoadChats() = _$LoadChatsImpl;
}

/// @nodoc
abstract class _$$LoadDetailImplCopyWith<$Res> {
  factory _$$LoadDetailImplCopyWith(
          _$LoadDetailImpl value, $Res Function(_$LoadDetailImpl) then) =
      __$$LoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$LoadDetailImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$LoadDetailImpl(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailImpl implements _LoadDetail {
  const _$LoadDetailImpl(this.chatId);

  @override
  final int chatId;

  @override
  String toString() {
    return 'ChatEvent.loadDetail(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return loadDetail(chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return loadDetail?.call(chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements ChatEvent {
  const factory _LoadDetail(final int chatId) = _$LoadDetailImpl;

  int get chatId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chatId, String message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? message = null,
  }) {
    return _then(_$SendMessageImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl({required this.chatId, required this.message});

  @override
  final int chatId;
  @override
  final String message;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(chatId: $chatId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId, message);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return sendMessage(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return sendMessage?.call(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(chatId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatEvent {
  const factory _SendMessage(
      {required final int chatId,
      required final String message}) = _$SendMessageImpl;

  int get chatId;
  String get message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateChatImplCopyWith<$Res> {
  factory _$$CreateChatImplCopyWith(
          _$CreateChatImpl value, $Res Function(_$CreateChatImpl) then) =
      __$$CreateChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int receiverId, String message});
}

/// @nodoc
class __$$CreateChatImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$CreateChatImpl>
    implements _$$CreateChatImplCopyWith<$Res> {
  __$$CreateChatImplCopyWithImpl(
      _$CreateChatImpl _value, $Res Function(_$CreateChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? message = null,
  }) {
    return _then(_$CreateChatImpl(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateChatImpl implements _CreateChat {
  const _$CreateChatImpl({required this.receiverId, required this.message});

  @override
  final int receiverId;
  @override
  final String message;

  @override
  String toString() {
    return 'ChatEvent.createChat(receiverId: $receiverId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiverId, message);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatImplCopyWith<_$CreateChatImpl> get copyWith =>
      __$$CreateChatImplCopyWithImpl<_$CreateChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return createChat(receiverId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return createChat?.call(receiverId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (createChat != null) {
      return createChat(receiverId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return createChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return createChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (createChat != null) {
      return createChat(this);
    }
    return orElse();
  }
}

abstract class _CreateChat implements ChatEvent {
  const factory _CreateChat(
      {required final int receiverId,
      required final String message}) = _$CreateChatImpl;

  int get receiverId;
  String get message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateChatImplCopyWith<_$CreateChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsReadImplCopyWith<$Res> {
  factory _$$MarkAsReadImplCopyWith(
          _$MarkAsReadImpl value, $Res Function(_$MarkAsReadImpl) then) =
      __$$MarkAsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$MarkAsReadImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$MarkAsReadImpl>
    implements _$$MarkAsReadImplCopyWith<$Res> {
  __$$MarkAsReadImplCopyWithImpl(
      _$MarkAsReadImpl _value, $Res Function(_$MarkAsReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$MarkAsReadImpl(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MarkAsReadImpl implements _MarkAsRead {
  const _$MarkAsReadImpl(this.chatId);

  @override
  final int chatId;

  @override
  String toString() {
    return 'ChatEvent.markAsRead(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      __$$MarkAsReadImplCopyWithImpl<_$MarkAsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return markAsRead(chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return markAsRead?.call(chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return markAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return markAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAsRead implements ChatEvent {
  const factory _MarkAsRead(final int chatId) = _$MarkAsReadImpl;

  int get chatId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewRealtimeMessageImplCopyWith<$Res> {
  factory _$$NewRealtimeMessageImplCopyWith(_$NewRealtimeMessageImpl value,
          $Res Function(_$NewRealtimeMessageImpl) then) =
      __$$NewRealtimeMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatMessageModel message});
}

/// @nodoc
class __$$NewRealtimeMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$NewRealtimeMessageImpl>
    implements _$$NewRealtimeMessageImplCopyWith<$Res> {
  __$$NewRealtimeMessageImplCopyWithImpl(_$NewRealtimeMessageImpl _value,
      $Res Function(_$NewRealtimeMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NewRealtimeMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageModel,
    ));
  }
}

/// @nodoc

class _$NewRealtimeMessageImpl implements _NewRealtimeMessage {
  const _$NewRealtimeMessageImpl(this.message);

  @override
  final ChatMessageModel message;

  @override
  String toString() {
    return 'ChatEvent.newRealtimeMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewRealtimeMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewRealtimeMessageImplCopyWith<_$NewRealtimeMessageImpl> get copyWith =>
      __$$NewRealtimeMessageImplCopyWithImpl<_$NewRealtimeMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return newRealtimeMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return newRealtimeMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (newRealtimeMessage != null) {
      return newRealtimeMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return newRealtimeMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return newRealtimeMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (newRealtimeMessage != null) {
      return newRealtimeMessage(this);
    }
    return orElse();
  }
}

abstract class _NewRealtimeMessage implements ChatEvent {
  const factory _NewRealtimeMessage(final ChatMessageModel message) =
      _$NewRealtimeMessageImpl;

  ChatMessageModel get message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewRealtimeMessageImplCopyWith<_$NewRealtimeMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectRealtimeImplCopyWith<$Res> {
  factory _$$DisconnectRealtimeImplCopyWith(_$DisconnectRealtimeImpl value,
          $Res Function(_$DisconnectRealtimeImpl) then) =
      __$$DisconnectRealtimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectRealtimeImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$DisconnectRealtimeImpl>
    implements _$$DisconnectRealtimeImplCopyWith<$Res> {
  __$$DisconnectRealtimeImplCopyWithImpl(_$DisconnectRealtimeImpl _value,
      $Res Function(_$DisconnectRealtimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectRealtimeImpl implements _DisconnectRealtime {
  const _$DisconnectRealtimeImpl();

  @override
  String toString() {
    return 'ChatEvent.disconnectRealtime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectRealtimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) loadUsers,
    required TResult Function() loadChats,
    required TResult Function(int chatId) loadDetail,
    required TResult Function(int chatId, String message) sendMessage,
    required TResult Function(int receiverId, String message) createChat,
    required TResult Function(int chatId) markAsRead,
    required TResult Function(ChatMessageModel message) newRealtimeMessage,
    required TResult Function() disconnectRealtime,
  }) {
    return disconnectRealtime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? loadUsers,
    TResult? Function()? loadChats,
    TResult? Function(int chatId)? loadDetail,
    TResult? Function(int chatId, String message)? sendMessage,
    TResult? Function(int receiverId, String message)? createChat,
    TResult? Function(int chatId)? markAsRead,
    TResult? Function(ChatMessageModel message)? newRealtimeMessage,
    TResult? Function()? disconnectRealtime,
  }) {
    return disconnectRealtime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? loadUsers,
    TResult Function()? loadChats,
    TResult Function(int chatId)? loadDetail,
    TResult Function(int chatId, String message)? sendMessage,
    TResult Function(int receiverId, String message)? createChat,
    TResult Function(int chatId)? markAsRead,
    TResult Function(ChatMessageModel message)? newRealtimeMessage,
    TResult Function()? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (disconnectRealtime != null) {
      return disconnectRealtime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUsers value) loadUsers,
    required TResult Function(_LoadChats value) loadChats,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_CreateChat value) createChat,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_NewRealtimeMessage value) newRealtimeMessage,
    required TResult Function(_DisconnectRealtime value) disconnectRealtime,
  }) {
    return disconnectRealtime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUsers value)? loadUsers,
    TResult? Function(_LoadChats value)? loadChats,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_CreateChat value)? createChat,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult? Function(_DisconnectRealtime value)? disconnectRealtime,
  }) {
    return disconnectRealtime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUsers value)? loadUsers,
    TResult Function(_LoadChats value)? loadChats,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_CreateChat value)? createChat,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_NewRealtimeMessage value)? newRealtimeMessage,
    TResult Function(_DisconnectRealtime value)? disconnectRealtime,
    required TResult orElse(),
  }) {
    if (disconnectRealtime != null) {
      return disconnectRealtime(this);
    }
    return orElse();
  }
}

abstract class _DisconnectRealtime implements ChatEvent {
  const factory _DisconnectRealtime() = _$DisconnectRealtimeImpl;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UsersLoadedImplCopyWith<$Res> {
  factory _$$UsersLoadedImplCopyWith(
          _$UsersLoadedImpl value, $Res Function(_$UsersLoadedImpl) then) =
      __$$UsersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserModel> users});
}

/// @nodoc
class __$$UsersLoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$UsersLoadedImpl>
    implements _$$UsersLoadedImplCopyWith<$Res> {
  __$$UsersLoadedImplCopyWithImpl(
      _$UsersLoadedImpl _value, $Res Function(_$UsersLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UsersLoadedImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$UsersLoadedImpl implements _UsersLoaded {
  const _$UsersLoadedImpl(final List<UserModel> users) : _users = users;

  final List<UserModel> _users;
  @override
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'ChatState.usersLoaded(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersLoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersLoadedImplCopyWith<_$UsersLoadedImpl> get copyWith =>
      __$$UsersLoadedImplCopyWithImpl<_$UsersLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return usersLoaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return usersLoaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (usersLoaded != null) {
      return usersLoaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return usersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return usersLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (usersLoaded != null) {
      return usersLoaded(this);
    }
    return orElse();
  }
}

abstract class _UsersLoaded implements ChatState {
  const factory _UsersLoaded(final List<UserModel> users) = _$UsersLoadedImpl;

  List<UserModel> get users;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersLoadedImplCopyWith<_$UsersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatsLoadedImplCopyWith<$Res> {
  factory _$$ChatsLoadedImplCopyWith(
          _$ChatsLoadedImpl value, $Res Function(_$ChatsLoadedImpl) then) =
      __$$ChatsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatModel> chats});
}

/// @nodoc
class __$$ChatsLoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatsLoadedImpl>
    implements _$$ChatsLoadedImplCopyWith<$Res> {
  __$$ChatsLoadedImplCopyWithImpl(
      _$ChatsLoadedImpl _value, $Res Function(_$ChatsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsLoadedImpl(
      null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ));
  }
}

/// @nodoc

class _$ChatsLoadedImpl implements _ChatsLoaded {
  const _$ChatsLoadedImpl(final List<ChatModel> chats) : _chats = chats;

  final List<ChatModel> _chats;
  @override
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatState.chatsLoaded(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsLoadedImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsLoadedImplCopyWith<_$ChatsLoadedImpl> get copyWith =>
      __$$ChatsLoadedImplCopyWithImpl<_$ChatsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return chatsLoaded(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return chatsLoaded?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (chatsLoaded != null) {
      return chatsLoaded(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return chatsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return chatsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (chatsLoaded != null) {
      return chatsLoaded(this);
    }
    return orElse();
  }
}

abstract class _ChatsLoaded implements ChatState {
  const factory _ChatsLoaded(final List<ChatModel> chats) = _$ChatsLoadedImpl;

  List<ChatModel> get chats;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatsLoadedImplCopyWith<_$ChatsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
          _$DetailLoadedImpl value, $Res Function(_$DetailLoadedImpl) then) =
      __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatModel chat, List<ChatMessageModel> messages});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
    Object? messages = null,
  }) {
    return _then(_$DetailLoadedImpl(
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageModel>,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(
      {required this.chat, required final List<ChatMessageModel> messages})
      : _messages = messages;

  @override
  final ChatModel chat;
  final List<ChatMessageModel> _messages;
  @override
  List<ChatMessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatState.detailLoaded(chat: $chat, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            (identical(other.chat, chat) || other.chat == chat) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chat, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      __$$DetailLoadedImplCopyWithImpl<_$DetailLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return detailLoaded(chat, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return detailLoaded?.call(chat, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(chat, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return detailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return detailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(this);
    }
    return orElse();
  }
}

abstract class _DetailLoaded implements ChatState {
  const factory _DetailLoaded(
      {required final ChatModel chat,
      required final List<ChatMessageModel> messages}) = _$DetailLoadedImpl;

  ChatModel get chat;
  List<ChatMessageModel> get messages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageSentImplCopyWith<$Res> {
  factory _$$MessageSentImplCopyWith(
          _$MessageSentImpl value, $Res Function(_$MessageSentImpl) then) =
      __$$MessageSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatMessageModel message});
}

/// @nodoc
class __$$MessageSentImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$MessageSentImpl>
    implements _$$MessageSentImplCopyWith<$Res> {
  __$$MessageSentImplCopyWithImpl(
      _$MessageSentImpl _value, $Res Function(_$MessageSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MessageSentImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageModel,
    ));
  }
}

/// @nodoc

class _$MessageSentImpl implements _MessageSent {
  const _$MessageSentImpl(this.message);

  @override
  final ChatMessageModel message;

  @override
  String toString() {
    return 'ChatState.messageSent(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSentImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSentImplCopyWith<_$MessageSentImpl> get copyWith =>
      __$$MessageSentImplCopyWithImpl<_$MessageSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return messageSent(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return messageSent?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (messageSent != null) {
      return messageSent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return messageSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return messageSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (messageSent != null) {
      return messageSent(this);
    }
    return orElse();
  }
}

abstract class _MessageSent implements ChatState {
  const factory _MessageSent(final ChatMessageModel message) =
      _$MessageSentImpl;

  ChatMessageModel get message;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageSentImplCopyWith<_$MessageSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatCreatedImplCopyWith<$Res> {
  factory _$$ChatCreatedImplCopyWith(
          _$ChatCreatedImpl value, $Res Function(_$ChatCreatedImpl) then) =
      __$$ChatCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$ChatCreatedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatCreatedImpl>
    implements _$$ChatCreatedImplCopyWith<$Res> {
  __$$ChatCreatedImplCopyWithImpl(
      _$ChatCreatedImpl _value, $Res Function(_$ChatCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$ChatCreatedImpl(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChatCreatedImpl implements _ChatCreated {
  const _$ChatCreatedImpl(this.chatId);

  @override
  final int chatId;

  @override
  String toString() {
    return 'ChatState.chatCreated(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCreatedImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCreatedImplCopyWith<_$ChatCreatedImpl> get copyWith =>
      __$$ChatCreatedImplCopyWithImpl<_$ChatCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return chatCreated(chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return chatCreated?.call(chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (chatCreated != null) {
      return chatCreated(chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return chatCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return chatCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (chatCreated != null) {
      return chatCreated(this);
    }
    return orElse();
  }
}

abstract class _ChatCreated implements ChatState {
  const factory _ChatCreated(final int chatId) = _$ChatCreatedImpl;

  int get chatId;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatCreatedImplCopyWith<_$ChatCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkedAsReadImplCopyWith<$Res> {
  factory _$$MarkedAsReadImplCopyWith(
          _$MarkedAsReadImpl value, $Res Function(_$MarkedAsReadImpl) then) =
      __$$MarkedAsReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkedAsReadImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$MarkedAsReadImpl>
    implements _$$MarkedAsReadImplCopyWith<$Res> {
  __$$MarkedAsReadImplCopyWithImpl(
      _$MarkedAsReadImpl _value, $Res Function(_$MarkedAsReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkedAsReadImpl implements _MarkedAsRead {
  const _$MarkedAsReadImpl();

  @override
  String toString() {
    return 'ChatState.markedAsRead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkedAsReadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return markedAsRead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return markedAsRead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (markedAsRead != null) {
      return markedAsRead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return markedAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return markedAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (markedAsRead != null) {
      return markedAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkedAsRead implements ChatState {
  const factory _MarkedAsRead() = _$MarkedAsReadImpl;
}

/// @nodoc
abstract class _$$RealtimeMessageImplCopyWith<$Res> {
  factory _$$RealtimeMessageImplCopyWith(_$RealtimeMessageImpl value,
          $Res Function(_$RealtimeMessageImpl) then) =
      __$$RealtimeMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatMessageModel message});
}

/// @nodoc
class __$$RealtimeMessageImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$RealtimeMessageImpl>
    implements _$$RealtimeMessageImplCopyWith<$Res> {
  __$$RealtimeMessageImplCopyWithImpl(
      _$RealtimeMessageImpl _value, $Res Function(_$RealtimeMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RealtimeMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageModel,
    ));
  }
}

/// @nodoc

class _$RealtimeMessageImpl implements _RealtimeMessage {
  const _$RealtimeMessageImpl(this.message);

  @override
  final ChatMessageModel message;

  @override
  String toString() {
    return 'ChatState.realtimeMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeMessageImplCopyWith<_$RealtimeMessageImpl> get copyWith =>
      __$$RealtimeMessageImplCopyWithImpl<_$RealtimeMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return realtimeMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return realtimeMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (realtimeMessage != null) {
      return realtimeMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return realtimeMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return realtimeMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (realtimeMessage != null) {
      return realtimeMessage(this);
    }
    return orElse();
  }
}

abstract class _RealtimeMessage implements ChatState {
  const factory _RealtimeMessage(final ChatMessageModel message) =
      _$RealtimeMessageImpl;

  ChatMessageModel get message;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeMessageImplCopyWith<_$RealtimeMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserModel> users) usersLoaded,
    required TResult Function(List<ChatModel> chats) chatsLoaded,
    required TResult Function(ChatModel chat, List<ChatMessageModel> messages)
        detailLoaded,
    required TResult Function(ChatMessageModel message) messageSent,
    required TResult Function(int chatId) chatCreated,
    required TResult Function() markedAsRead,
    required TResult Function(ChatMessageModel message) realtimeMessage,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserModel> users)? usersLoaded,
    TResult? Function(List<ChatModel> chats)? chatsLoaded,
    TResult? Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult? Function(ChatMessageModel message)? messageSent,
    TResult? Function(int chatId)? chatCreated,
    TResult? Function()? markedAsRead,
    TResult? Function(ChatMessageModel message)? realtimeMessage,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserModel> users)? usersLoaded,
    TResult Function(List<ChatModel> chats)? chatsLoaded,
    TResult Function(ChatModel chat, List<ChatMessageModel> messages)?
        detailLoaded,
    TResult Function(ChatMessageModel message)? messageSent,
    TResult Function(int chatId)? chatCreated,
    TResult Function()? markedAsRead,
    TResult Function(ChatMessageModel message)? realtimeMessage,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UsersLoaded value) usersLoaded,
    required TResult Function(_ChatsLoaded value) chatsLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_MessageSent value) messageSent,
    required TResult Function(_ChatCreated value) chatCreated,
    required TResult Function(_MarkedAsRead value) markedAsRead,
    required TResult Function(_RealtimeMessage value) realtimeMessage,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UsersLoaded value)? usersLoaded,
    TResult? Function(_ChatsLoaded value)? chatsLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_MessageSent value)? messageSent,
    TResult? Function(_ChatCreated value)? chatCreated,
    TResult? Function(_MarkedAsRead value)? markedAsRead,
    TResult? Function(_RealtimeMessage value)? realtimeMessage,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UsersLoaded value)? usersLoaded,
    TResult Function(_ChatsLoaded value)? chatsLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_MessageSent value)? messageSent,
    TResult Function(_ChatCreated value)? chatCreated,
    TResult Function(_MarkedAsRead value)? markedAsRead,
    TResult Function(_RealtimeMessage value)? realtimeMessage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ChatState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
