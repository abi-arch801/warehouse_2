
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/budget_revision_user_datasource.dart';
import 'package:warehouse/data/model/request/budget_revision_request_model.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
 
part 'user_budget_revision_event.dart';
part 'user_budget_revision_state.dart';
part 'user_budget_revision_bloc.freezed.dart';
 
class UserBudgetRevisionBloc
    extends Bloc<UserBudgetRevisionEvent, UserBudgetRevisionState> {
  final UserBudgetRevisionDatasource _datasource;
 
  UserBudgetRevisionBloc(this._datasource)
      : super(const UserBudgetRevisionState.initial()) {
    on<UserBudgetRevisionGetAll>(_onGetAll);
    on<UserBudgetRevisionGetDetail>(_onGetDetail);
    on<UserBudgetRevisionStore>(_onStore);
  }
 
  Future<void> _onGetAll(
    UserBudgetRevisionGetAll event,
    Emitter<UserBudgetRevisionState> emit,
  ) async {
    emit(const UserBudgetRevisionState.loading());
    final result = await _datasource.getAll(
      page: event.page,
      status: event.status,
    );
    result.fold(
      (l) => emit(UserBudgetRevisionState.error(l)),
      (r) => emit(UserBudgetRevisionState.loaded(r)),
    );
  }
 
  Future<void> _onGetDetail(
    UserBudgetRevisionGetDetail event,
    Emitter<UserBudgetRevisionState> emit,
  ) async {
    emit(const UserBudgetRevisionState.loading());
    final result = await _datasource.getDetail(event.id);
    result.fold(
      (l) => emit(UserBudgetRevisionState.error(l)),
      (r) => emit(UserBudgetRevisionState.detail(r.data!)),
    );
  }
 
  Future<void> _onStore(
    UserBudgetRevisionStore event,
    Emitter<UserBudgetRevisionState> emit,
  ) async {
    emit(const UserBudgetRevisionState.loading());
    final result = await _datasource.store(event.request);
    result.fold(
      (l) => emit(UserBudgetRevisionState.error(l)),
      (r) => emit(UserBudgetRevisionState.success(
          r.message ?? 'Revisi berhasil diajukan.')),
    );
  }
}
