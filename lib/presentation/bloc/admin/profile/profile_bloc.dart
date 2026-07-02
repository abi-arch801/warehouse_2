import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/profile_datasource.dart';
import 'package:warehouse/data/model/response/profile_response_model.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileDataSource _dataSource;

  ProfileBloc({required ProfileDataSource dataSource})
      : _dataSource = dataSource,
        super(const ProfileState.initial()) {
    on<_Started>                (_onStarted);
    on<_LoadRequested>          (_onLoad);
    on<_UpdateRequested>        (_onUpdate);
    on<_NotificationToggled>    (_onNotificationToggle);
    on<_DarkModeToggled>        (_onDarkModeToggle);
    on<_PasswordChangeRequested>(_onPasswordChange);
    on<_AvatarUploadRequested>  (_onAvatarUpload);
    on<_SignOutRequested>       (_onSignOut);
  }

  void _onStarted(_Started event, Emitter<ProfileState> emit) {
    emit(const ProfileState.initial());
  }

  AdminProfile? get _currentProfile => switch (state) {
        _Loaded(:final profile)        => profile,
        _ActionLoading(:final profile) => profile,
        _ActionSuccess(:final profile) => profile,
        _ActionError(:final profile)   => profile,
        _                              => null,
      };

  Future<void> _onLoad(_LoadRequested event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    final res = await _dataSource.fetchCurrent();
    res.fold(
      (l) => emit(ProfileState.error(message: l)),
      (r) => emit(ProfileState.loaded(profile: r)),
    );
  }

  Future<void> _onUpdate(_UpdateRequested event, Emitter<ProfileState> emit) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.update(
      profile.copyWith(name: event.name, phone: event.phone),
    );
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(ProfileState.actionSuccess(
        profile: r,
        message: 'Profil berhasil diperbarui',
      )),
    );
  }

  Future<void> _onNotificationToggle(
    _NotificationToggled event,
    Emitter<ProfileState> emit,
  ) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.setNotifications(profile.id, event.enabled);
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(ProfileState.actionSuccess(
        profile: r,
        message: event.enabled ? 'Notifikasi diaktifkan' : 'Notifikasi dimatikan',
      )),
    );
  }

  Future<void> _onDarkModeToggle(
    _DarkModeToggled event,
    Emitter<ProfileState> emit,
  ) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.setDarkMode(profile.id, event.enabled);
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(ProfileState.actionSuccess(
        profile: r,
        message: event.enabled ? 'Mode gelap aktif' : 'Mode terang aktif',
      )),
    );
  }

  Future<void> _onPasswordChange(
    _PasswordChangeRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.changePassword(
      userId:          profile.id,
      currentPassword: event.currentPassword,
      newPassword:     event.newPassword,
    );
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(ProfileState.actionSuccess(
        profile: profile,
        message: 'Password berhasil diubah',
      )),
    );
  }

  Future<void> _onAvatarUpload(
    _AvatarUploadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.uploadAvatar(
      profile.id,
      event.bytes,
      event.extension,
    );
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(ProfileState.actionSuccess(
        profile: r,
        message: 'Foto profil berhasil diperbarui',
      )),
    );
  }

  Future<void> _onSignOut(_SignOutRequested event, Emitter<ProfileState> emit) async {
    final profile = _currentProfile;
    if (profile == null) return;

    emit(ProfileState.actionLoading(profile: profile));
    final res = await _dataSource.signOut(profile.id);
    res.fold(
      (l) => emit(ProfileState.actionError(profile: profile, message: l)),
      (r) => emit(const ProfileState.signedOut()),
    );
  }
}