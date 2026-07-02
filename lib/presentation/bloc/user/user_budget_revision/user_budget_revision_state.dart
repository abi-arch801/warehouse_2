part of 'user_budget_revision_bloc.dart';

@freezed
class UserBudgetRevisionState with _$UserBudgetRevisionState {
  const factory UserBudgetRevisionState.initial() = _Initial;
  const factory UserBudgetRevisionState.loading() = _Loading;
  const factory UserBudgetRevisionState.loaded(
      BudgetRevisionListResponseModel data) = _Loaded;
  const factory UserBudgetRevisionState.detail(BudgetRevisionModel data) =
      _Detail;
  const factory UserBudgetRevisionState.success(String message) = _Success;
  const factory UserBudgetRevisionState.error(String message) = _Error;
}
 