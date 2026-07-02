part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial()                               = _Initial;
  const factory ProfileState.loading()                               = _Loading;
  const factory ProfileState.loaded({required AdminProfile profile}) = _Loaded;
  const factory ProfileState.actionLoading({
    required AdminProfile profile,
  }) = _ActionLoading;
  const factory ProfileState.actionSuccess({
    required AdminProfile profile,
    required String       message,
  }) = _ActionSuccess;
  const factory ProfileState.actionError({
    required AdminProfile profile,
    required String       message,
  }) = _ActionError;
  const factory ProfileState.error({required String message})        = _Error;
  const factory ProfileState.signedOut()                             = _SignedOut;
}