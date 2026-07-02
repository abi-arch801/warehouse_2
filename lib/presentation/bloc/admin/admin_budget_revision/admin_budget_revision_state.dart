part of 'admin_budget_revision_bloc.dart';

@freezed
class AdminBudgetRevisionState with _$AdminBudgetRevisionState {
  const factory AdminBudgetRevisionState.initial() = _Initial;
  const factory AdminBudgetRevisionState.loading() = _Loading;
  const factory AdminBudgetRevisionState.loaded(
      BudgetRevisionListResponseModel data) = _Loaded;
  const factory AdminBudgetRevisionState.detail(BudgetRevisionModel data) =
      _Detail;
  const factory AdminBudgetRevisionState.success(String message) = _Success;
  const factory AdminBudgetRevisionState.error(String message) = _Error;
}