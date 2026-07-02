part of 'admin_user_bloc.dart';

@freezed
class AdminUserState with _$AdminUserState {
  const factory AdminUserState.initial() = _Initial;
  const factory AdminUserState.loading() = _Loading;
  const factory AdminUserState.listLoaded(UserListResponseModel result) = _ListLoaded;
  const factory AdminUserState.actionSuccess(String message) = _ActionSuccess;
  const factory AdminUserState.error(String message) = _Error;
}