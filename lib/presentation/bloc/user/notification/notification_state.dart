part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.loaded({
    required List<NotificationModel> notifications,
    required int unreadCount,
    required bool hasMore,
  }) = _Loaded;
  const factory NotificationState.actionSuccess(String message) = _ActionSuccess;
  const factory NotificationState.error(String message) = _Error;
}



