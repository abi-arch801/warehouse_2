import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/notification_datasource.dart';
import 'package:warehouse/data/model/response/notification_response_model.dart';
part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationDatasource _datasource = NotificationDatasource();

  int _currentPage = 1;
  List<NotificationModel> _notifications = [];
  int _unreadCount = 0;
  bool? _filterIsRead;
  String? _filterType;

  NotificationBloc() : super(const NotificationState.initial()) {
    on<_LoadNotifications>(_onLoad);
    on<_LoadMore>(_onLoadMore);
    on<_LoadUnreadCount>(_onLoadUnreadCount);
    on<_MarkAsRead>(_onMarkAsRead);
    on<_MarkAllAsRead>(_onMarkAllAsRead);
    on<_DeleteNotification>(_onDelete);
  }

  Future<void> _onLoad(
      _LoadNotifications event, Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());
    _currentPage = 1;
    _filterIsRead = event.isRead;
    _filterType = event.type;

    final result = await _datasource.getNotifications(
        isRead: event.isRead, type: event.type, page: 1);
    final countResult = await _datasource.getUnreadCount();

    countResult.fold((_) {}, (c) => _unreadCount = c);

    result.fold(
      (err) => emit(NotificationState.error(err)),
      (res) {
        _notifications = res.data;
        emit(NotificationState.loaded(
          notifications: _notifications,
          unreadCount: _unreadCount,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }

  Future<void> _onLoadMore(
      _LoadMore event, Emitter<NotificationState> emit) async {
    _currentPage++;
    final result = await _datasource.getNotifications(
        isRead: _filterIsRead, type: _filterType, page: _currentPage);

    result.fold(
      (_) => _currentPage--,
      (res) {
        _notifications = [..._notifications, ...res.data];
        emit(NotificationState.loaded(
          notifications: _notifications,
          unreadCount: _unreadCount,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }

  // Future<void> _onLoadUnreadCount(
  //     _LoadUnreadCount event, Emitter<NotificationState> emit) async {
  //   final result = await _datasource.getUnreadCount();
  //   result.fold((_) {}, (count) {
  //     _unreadCount = count;
  //     if (state is _Loaded) {
  //       final s = state as _Loaded;
  //       emit(s.copyWith(unreadCount: count));
  //     }
  //   });
  // }

  Future<void> _onMarkAsRead(
      _MarkAsRead event, Emitter<NotificationState> emit) async {
    final result = await _datasource.markAsRead(event.id);
    result.fold(
      (err) => emit(NotificationState.error(err)),
      (msg) {
        _notifications = _notifications.map((n) {
          if (n.id == event.id) {
            return NotificationModel(
              id: n.id,
              userId: n.userId,
              type: n.type,
              title: n.title,
              body: n.body,
              data: n.data,
              isRead: true,
              readAt: DateTime.now().toIso8601String(),
              createdAt: n.createdAt,
            );
          }
          return n;
        }).toList();
        _unreadCount = _unreadCount > 0 ? _unreadCount - 1 : 0;
        emit(NotificationState.loaded(
          notifications: _notifications,
          unreadCount: _unreadCount,
          hasMore: false,
        ));
      },
    );
  }

  Future<void> _onMarkAllAsRead(
      _MarkAllAsRead event, Emitter<NotificationState> emit) async {
    final result = await _datasource.markAllAsRead();
    result.fold(
      (err) => emit(NotificationState.error(err)),
      (msg) {
        _notifications = _notifications
            .map((n) => NotificationModel(
                  id: n.id,
                  userId: n.userId,
                  type: n.type,
                  title: n.title,
                  body: n.body,
                  data: n.data,
                  isRead: true,
                  readAt: DateTime.now().toIso8601String(),
                  createdAt: n.createdAt,
                ))
            .toList();
        _unreadCount = 0;
        emit(NotificationState.loaded(
          notifications: _notifications,
          unreadCount: 0,
          hasMore: false,
        ));
      },
    );
  }

  Future<void> _onDelete(
      _DeleteNotification event, Emitter<NotificationState> emit) async {
    final result = await _datasource.deleteNotification(event.id);
    result.fold(
      (err) => emit(NotificationState.error(err)),
      (msg) {
        final deleted = _notifications.firstWhere((n) => n.id == event.id,
            orElse: () => _notifications.first);
        if (!deleted.isRead) {
          _unreadCount = _unreadCount > 0 ? _unreadCount - 1 : 0;
        }
        _notifications =
            _notifications.where((n) => n.id != event.id).toList();
        emit(NotificationState.loaded(
          notifications: _notifications,
          unreadCount: _unreadCount,
          hasMore: false,
        ));
      },
    );
  }

Future<void> _onLoadUnreadCount(
    _LoadUnreadCount event, Emitter<NotificationState> emit) async {
  final result = await _datasource.getUnreadCount();
  result.fold((_) {}, (count) {
    _unreadCount = count;
    if (state is _Loaded) {
      final s = state as _Loaded;
      emit(s.copyWith(unreadCount: count));
    } else {
      // ← tambahan: tetap emit walau belum pernah load list-nya
      emit(NotificationState.loaded(
        notifications: _notifications,
        unreadCount: count,
        hasMore: false,
      ));
    }
  });
}
}



