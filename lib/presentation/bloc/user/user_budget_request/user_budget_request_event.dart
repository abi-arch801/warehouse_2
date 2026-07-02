part of 'user_budget_request_bloc.dart';

@freezed
class UserBudgetRequestEvent with _$UserBudgetRequestEvent {
  const factory UserBudgetRequestEvent.getAll({
    @Default(1) int page,
    String? status,
  }) = UserBudgetRequestGetAll;

  const factory UserBudgetRequestEvent.getDetail(int id) =
      UserBudgetRequestGetDetail;

  const factory UserBudgetRequestEvent.store(
      StoreBudgetRequestModel request) = UserBudgetRequestStore;

  const factory UserBudgetRequestEvent.update({
    required int id,
    required StoreBudgetRequestModel request,
  }) = UserBudgetRequestUpdate;

  const factory UserBudgetRequestEvent.delete(int id) =
      UserBudgetRequestDelete;

  const factory UserBudgetRequestEvent.submit(int id) =
      UserBudgetRequestSubmit;
}



