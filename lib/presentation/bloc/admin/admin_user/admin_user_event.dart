part of 'admin_user_bloc.dart';

@freezed
class AdminUserEvent with _$AdminUserEvent {
  const factory AdminUserEvent.load({
    @Default(1) int page,
    String? search,
    String? role,
  }) = _Load;
  const factory AdminUserEvent.search(String query) = _Search;
  const factory AdminUserEvent.store({
    required String name,
    required String email,
    required String password,
    required String role,
  }) = _Store;
  const factory AdminUserEvent.update({
    required int id,
    String? name,
    String? email,
    String? role,
    bool? isActive,
  }) = _Update;
  const factory AdminUserEvent.delete(int id) = _Delete;
  const factory AdminUserEvent.toggleActive(int id) = _ToggleActive;
}