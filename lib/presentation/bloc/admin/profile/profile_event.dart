part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started()                                   = _Started;
  const factory ProfileEvent.loadRequested()                             = _LoadRequested;
  const factory ProfileEvent.updateRequested({
    required String name,
    required String phone,
  }) = _UpdateRequested;
  const factory ProfileEvent.notificationToggled(bool enabled)           = _NotificationToggled;
  const factory ProfileEvent.darkModeToggled(bool enabled)               = _DarkModeToggled;
  const factory ProfileEvent.passwordChangeRequested({
    required String currentPassword,
    required String newPassword,
  }) = _PasswordChangeRequested;
  const factory ProfileEvent.avatarUploadRequested({
    required List<int> bytes,
    required String    extension,
  }) = _AvatarUploadRequested;
  const factory ProfileEvent.signOutRequested()                          = _SignOutRequested;
}