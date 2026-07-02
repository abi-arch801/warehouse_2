
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_revision_datasource.dart';
import 'package:warehouse/data/model/request/budget_revision_request_model.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
 
part 'admin_budget_revision_event.dart';
part 'admin_budget_revision_state.dart';
part 'admin_budget_revision_bloc.freezed.dart';
 
class AdminBudgetRevisionBloc
    extends Bloc<AdminBudgetRevisionEvent, AdminBudgetRevisionState> {
  final AdminBudgetRevisionDatasource _datasource;
 
  AdminBudgetRevisionBloc(this._datasource)
      : super(const AdminBudgetRevisionState.initial()) {
    on<AdminBudgetRevisionGetAll>(_onGetAll);
    on<AdminBudgetRevisionGetDetail>(_onGetDetail);
    on<AdminBudgetRevisionStore>(_onStore);
    on<AdminBudgetRevisionUpdate>(_onUpdate);
    on<AdminBudgetRevisionApprove>(_onApprove);
    on<AdminBudgetRevisionReject>(_onReject);
  }
 
  Future<void> _onGetAll(
    AdminBudgetRevisionGetAll event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.getAll(
      page: event.page,
      status: event.status,
    );
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.loaded(r)),
    );
  }
 
  Future<void> _onGetDetail(
    AdminBudgetRevisionGetDetail event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.getDetail(event.id);
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.detail(r.data!)),
    );
  }
 
  Future<void> _onStore(
    AdminBudgetRevisionStore event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.store(event.request);
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.success(
          r.message ?? 'Revisi berhasil dibuat.')),
    );
  }
 
  Future<void> _onUpdate(
    AdminBudgetRevisionUpdate event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.update(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.success(
          r.message ?? 'Revisi berhasil diupdate.')),
    );
  }
 
  Future<void> _onApprove(
    AdminBudgetRevisionApprove event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.approve(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.success(
          r.message ?? 'Revisi berhasil disetujui.')),
    );
  }
 
  Future<void> _onReject(
    AdminBudgetRevisionReject event,
    Emitter<AdminBudgetRevisionState> emit,
  ) async {
    emit(const AdminBudgetRevisionState.loading());
    final result = await _datasource.reject(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRevisionState.error(l)),
      (r) => emit(AdminBudgetRevisionState.success(
          r.message ?? 'Revisi berhasil ditolak.')),
    );
  }
}