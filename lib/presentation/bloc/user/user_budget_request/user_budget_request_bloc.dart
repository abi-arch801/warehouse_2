import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/user_budget_request_datasource.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';

part 'user_budget_request_event.dart';
part 'user_budget_request_state.dart';
part 'user_budget_request_bloc.freezed.dart';
class UserBudgetRequestBloc
    extends Bloc<UserBudgetRequestEvent, UserBudgetRequestState> {
  final UserBudgetRequestDatasource _datasource;

  UserBudgetRequestBloc(this._datasource)
      : super(const UserBudgetRequestState.initial()) {
    on<UserBudgetRequestGetAll>(_onGetAll);
    on<UserBudgetRequestGetDetail>(_onGetDetail);
    on<UserBudgetRequestStore>(_onStore);
    on<UserBudgetRequestUpdate>(_onUpdate);
    on<UserBudgetRequestDelete>(_onDelete);
    on<UserBudgetRequestSubmit>(_onSubmit);
  }

  Future<void> _onGetAll(
    UserBudgetRequestGetAll event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.getAll(
      page: event.page,
      status: event.status,
    );
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.loaded(r)),
    );
  }

  Future<void> _onGetDetail(
    UserBudgetRequestGetDetail event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.getDetail(event.id);
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.detail(r.data!)),
    );
  }

  Future<void> _onStore(
    UserBudgetRequestStore event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.store(event.request);
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.success(r.message ?? 'RAB berhasil disimpan.')),
    );
  }

  Future<void> _onUpdate(
    UserBudgetRequestUpdate event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.update(event.id, event.request);
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.success(r.message ?? 'RAB berhasil diperbarui.')),
    );
  }

  Future<void> _onDelete(
    UserBudgetRequestDelete event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.delete(event.id);
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.success(r)),
    );
  }

  Future<void> _onSubmit(
    UserBudgetRequestSubmit event,
    Emitter<UserBudgetRequestState> emit,
  ) async {
    emit(const UserBudgetRequestState.loading());
    final result = await _datasource.submit(event.id);
    result.fold(
      (l) => emit(UserBudgetRequestState.error(l)),
      (r) => emit(UserBudgetRequestState.success(
          r.message ?? 'RAB berhasil dikirim ke admin.')),
    );
  }
}



