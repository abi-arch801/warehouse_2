import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_request_datasource.dart';
import 'admin_budget_request_event.dart';
import 'admin_budget_request_state.dart';

class AdminBudgetRequestBloc
    extends Bloc<AdminBudgetRequestEvent, AdminBudgetRequestState> {
  final AdminBudgetRequestDatasource _datasource;

  AdminBudgetRequestBloc(this._datasource)
      : super(const AdminBudgetRequestState.initial()) {
    on<AdminBudgetRequestGetAll>(_onGetAll);
    on<AdminBudgetRequestGetDetail>(_onGetDetail);
    on<AdminBudgetRequestApprove>(_onApprove);
    on<AdminBudgetRequestReject>(_onReject);
    on<AdminBudgetRequestTunda>(_onTunda);
  }

  Future<void> _onGetAll(
    AdminBudgetRequestGetAll event,
    Emitter<AdminBudgetRequestState> emit,
  ) async {
    emit(const AdminBudgetRequestState.loading());
    final result = await _datasource.getAll(
      page: event.page,
      status: event.status,
      jenis: event.jenis,
      urgensi: event.urgensi,
      divisi: event.divisi,
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
    );
    result.fold(
      (l) => emit(AdminBudgetRequestState.error(l)),
      (r) => emit(AdminBudgetRequestState.loaded(r)),
    );
  }

  Future<void> _onGetDetail(
    AdminBudgetRequestGetDetail event,
    Emitter<AdminBudgetRequestState> emit,
  ) async {
    emit(const AdminBudgetRequestState.loading());
    final result = await _datasource.getDetail(event.id);
    result.fold(
      (l) => emit(AdminBudgetRequestState.error(l)),
      (r) => emit(AdminBudgetRequestState.detail(r.data!)),
    );
  }

  Future<void> _onApprove(
    AdminBudgetRequestApprove event,
    Emitter<AdminBudgetRequestState> emit,
  ) async {
    emit(const AdminBudgetRequestState.loading());
    final result = await _datasource.approve(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRequestState.error(l)),
      (r) => emit(AdminBudgetRequestState.success(
          r.message ?? 'RAB diteruskan ke Super Admin.')),
    );
  }

  Future<void> _onReject(
    AdminBudgetRequestReject event,
    Emitter<AdminBudgetRequestState> emit,
  ) async {
    emit(const AdminBudgetRequestState.loading());
    final result = await _datasource.reject(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRequestState.error(l)),
      (r) => emit(
          AdminBudgetRequestState.success(r.message ?? 'RAB berhasil ditolak.')),
    );
  }

  Future<void> _onTunda(
    AdminBudgetRequestTunda event,
    Emitter<AdminBudgetRequestState> emit,
  ) async {
    emit(const AdminBudgetRequestState.loading());
    final result = await _datasource.tunda(event.id, event.request);
    result.fold(
      (l) => emit(AdminBudgetRequestState.error(l)),
      (r) => emit(
          AdminBudgetRequestState.success(r.message ?? 'RAB berhasil ditunda.')),
    );
  }
}