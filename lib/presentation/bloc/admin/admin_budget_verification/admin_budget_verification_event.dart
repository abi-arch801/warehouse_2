part of 'admin_budget_verification_bloc.dart';

@freezed
class AdminBudgetVerificationEvent with _$AdminBudgetVerificationEvent {
  const factory AdminBudgetVerificationEvent.getAll({
    @Default(1) int page,
    String? status,
  }) = AdminBudgetVerificationGetAll;

  const factory AdminBudgetVerificationEvent.getDetail(int id) =
      AdminBudgetVerificationGetDetail;

  const factory AdminBudgetVerificationEvent.store(
      StoreBudgetVerificationModel request) = AdminBudgetVerificationStore;

  const factory AdminBudgetVerificationEvent.update({
    required int id,
    required StoreBudgetVerificationModel request,
  }) = AdminBudgetVerificationUpdate;
}