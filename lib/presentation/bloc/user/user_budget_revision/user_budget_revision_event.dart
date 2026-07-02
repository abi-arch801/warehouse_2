part of 'user_budget_revision_bloc.dart';

@freezed
class UserBudgetRevisionEvent with _$UserBudgetRevisionEvent {
  const factory UserBudgetRevisionEvent.getAll({
    @Default(1) int page,
    String? status,
  }) = UserBudgetRevisionGetAll;

  const factory UserBudgetRevisionEvent.getDetail(int id) =
      UserBudgetRevisionGetDetail;

  const factory UserBudgetRevisionEvent.store(
      StoreBudgetRevisionModel request) = UserBudgetRevisionStore;
}