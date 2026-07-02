part of 'user_budget_request_bloc.dart';

@freezed
class UserBudgetRequestState with _$UserBudgetRequestState {
  const factory UserBudgetRequestState.initial() = _Initial;
  const factory UserBudgetRequestState.loading() = _Loading;
  const factory UserBudgetRequestState.loaded(
      BudgetRequestListResponseModel data) = _Loaded;
  const factory UserBudgetRequestState.detail(BudgetRequestModel data) =
      _Detail;
  const factory UserBudgetRequestState.success(String message) = _Success;
  const factory UserBudgetRequestState.error(String message) = _Error;
}


