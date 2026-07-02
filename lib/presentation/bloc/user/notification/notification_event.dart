part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadNotifications({bool? isRead, String? type}) = _LoadNotifications;
  const factory NotificationEvent.loadMore() = _LoadMore;
  const factory NotificationEvent.loadUnreadCount() = _LoadUnreadCount;
  const factory NotificationEvent.markAsRead(int id) = _MarkAsRead;
  const factory NotificationEvent.markAllAsRead() = _MarkAllAsRead;
  const factory NotificationEvent.deleteNotification(int id) = _DeleteNotification;
}



