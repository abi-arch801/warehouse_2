import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_verification_datasource.dart';
import 'package:warehouse/data/model/request/budget_vverification_request_model.dart';
import 'package:warehouse/data/model/response/budget_verification_response_model.dart';

part 'admin_budget_verification_event.dart';
part 'admin_budget_verification_state.dart';
part 'admin_budget_verification_bloc.freezed.dart';

class AdminBudgetVerificationBloc
    extends Bloc<AdminBudgetVerificationEvent, AdminBudgetVerificationState> {
  final AdminBudgetVerificationDatasource _datasource;

  AdminBudgetVerificationBloc(this._datasource)
      : super(const AdminBudgetVerificationState.initial()) {
    on<AdminBudgetVerificationGetAll>(_onGetAll);
    on<AdminBudgetVerificationGetDetail>(_onGetDetail);
    on<AdminBudgetVerificationStore>(_onStore);
    on<AdminBudgetVerificationUpdate>(_onUpdate);
  }

  Future<void> _onGetAll(
    AdminBudgetVerificationGetAll event,
    Emitter<AdminBudgetVerificationState> emit,
  ) async {
    emit(const AdminBudgetVerificationState.loading());
    final result = await _datasource.getAll(
      page: event.page,
      status: event.status,
    );
    result.fold(
      (l) => emit(AdminBudgetVerificationState.error(l)),
      (r) => emit(AdminBudgetVerificationState.loaded(r)),
    );
  }

  Future<void> _onGetDetail(
    AdminBudgetVerificationGetDetail event,
    Emitter<AdminBudgetVerificationState> emit,
  ) async {
    emit(const AdminBudgetVerificationState.loading());
    final result = await _datasource.getDetail(event.id);
    result.fold(
      (l) => emit(AdminBudgetVerificationState.error(l)),
      (r) => emit(AdminBudgetVerificationState.detail(r.data!)),
    );
  }

  Future<void> _onStore(
    AdminBudgetVerificationStore event,
    Emitter<AdminBudgetVerificationState> emit,
  ) async {
    emit(const AdminBudgetVerificationState.loading());
    final result = await _datasource.store(event.request);
    result.fold(
      (l) => emit(AdminBudgetVerificationState.error(l)),
      (r) => emit(AdminBudgetVerificationState.success(
          r.message ?? 'Verifikasi berhasil disimpan.')),
    );
  }

  Future<void> _onUpdate(
    AdminBudgetVerificationUpdate event,
    Emitter<AdminBudgetVerificationState> emit,
  ) async {
    emit(const AdminBudgetVerificationState.loading());
    final result = await _datasource.update(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetVerificationState.error(l)),
      (r) => emit(AdminBudgetVerificationState.success(
          r.message ?? 'Verifikasi berhasil diupdate.')),
    );
  }
}
