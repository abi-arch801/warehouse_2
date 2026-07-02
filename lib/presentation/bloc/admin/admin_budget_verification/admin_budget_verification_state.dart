part of 'admin_budget_verification_bloc.dart';

@freezed
class AdminBudgetVerificationState with _$AdminBudgetVerificationState {
  const factory AdminBudgetVerificationState.initial() = _Initial;
  const factory AdminBudgetVerificationState.loading() = _Loading;
  const factory AdminBudgetVerificationState.loaded(
      BudgetVerificationListResponseModel data) = _Loaded;
  const factory AdminBudgetVerificationState.detail(
      BudgetVerificationModel data) = _Detail;
  const factory AdminBudgetVerificationState.success(String message) =
      _Success;
  const factory AdminBudgetVerificationState.error(String message) = _Error;
}