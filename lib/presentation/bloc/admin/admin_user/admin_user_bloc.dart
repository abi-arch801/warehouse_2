import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_user_datasource.dart';
import 'package:warehouse/data/model/response/admin/user_list_response_model.dart';
import '../../../../data/model/response/auth/auth_response_model.dart';

part 'admin_user_event.dart';
part 'admin_user_state.dart';
part 'admin_user_bloc.freezed.dart';

class AdminUserBloc extends Bloc<AdminUserEvent, AdminUserState> {
  final AdminUserDatasource _ds = AdminUserDatasource();

  AdminUserBloc() : super(const AdminUserState.initial()) {
    on<_Load>(_onLoad);
    on<_Search>(_onSearch);
    on<_Store>(_onStore);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);
    on<_ToggleActive>(_onToggle);
  }

  Future<void> _onLoad(
      _Load event, Emitter<AdminUserState> emit) async {
    emit(const AdminUserState.loading());
    final result = await _ds.getUsers(
        page: event.page, search: event.search, role: event.role);
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (res) => emit(AdminUserState.listLoaded(res)),
    );
  }

  Future<void> _onSearch(
      _Search event, Emitter<AdminUserState> emit) async {
    emit(const AdminUserState.loading());
    final result = await _ds.getUsers(search: event.query);
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (res) => emit(AdminUserState.listLoaded(res)),
    );
  }

  Future<void> _onStore(
      _Store event, Emitter<AdminUserState> emit) async {
    emit(const AdminUserState.loading());
    final result = await _ds.storeUser(
      name: event.name,
      email: event.email,
      password: event.password,
      role: event.role,
    );
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (user) => emit(AdminUserState.actionSuccess('User berhasil ditambahkan.')),
    );
  }

  Future<void> _onUpdate(
      _Update event, Emitter<AdminUserState> emit) async {
    emit(const AdminUserState.loading());
    final result = await _ds.updateUser(
      id: event.id,
      name: event.name,
      email: event.email,
      role: event.role,
      isActive: event.isActive,
    );
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (_) => emit(AdminUserState.actionSuccess('User berhasil diupdate.')),
    );
  }

  Future<void> _onDelete(
      _Delete event, Emitter<AdminUserState> emit) async {
    emit(const AdminUserState.loading());
    final result = await _ds.deleteUser(event.id);
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (msg) => emit(AdminUserState.actionSuccess(msg)),
    );
  }

  Future<void> _onToggle(
      _ToggleActive event, Emitter<AdminUserState> emit) async {
    final result = await _ds.toggleActive(event.id);
    result.fold(
      (err) => emit(AdminUserState.error(err)),
      (msg) => emit(AdminUserState.actionSuccess(msg)),
    );
  }
}