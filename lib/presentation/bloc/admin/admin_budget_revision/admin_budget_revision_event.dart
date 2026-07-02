part of 'admin_budget_revision_bloc.dart';

@freezed
class AdminBudgetRevisionEvent with _$AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionEvent.getAll({
    @Default(1) int page,
    String? status,
  }) = AdminBudgetRevisionGetAll;

  const factory AdminBudgetRevisionEvent.getDetail(int id) =
      AdminBudgetRevisionGetDetail;

  const factory AdminBudgetRevisionEvent.store(
      StoreBudgetRevisionModel request) = AdminBudgetRevisionStore;

  const factory AdminBudgetRevisionEvent.update({
    required int id,
    required StoreBudgetRevisionModel request,
  }) = AdminBudgetRevisionUpdate;

  const factory AdminBudgetRevisionEvent.approve({
    required int id,
    required ApproveRejectRevisionModel request,
  }) = AdminBudgetRevisionApprove;

  const factory AdminBudgetRevisionEvent.reject({
    required int id,
    required ApproveRejectRevisionModel request,
  }) = AdminBudgetRevisionReject;
}
 