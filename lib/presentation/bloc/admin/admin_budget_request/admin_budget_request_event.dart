import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';

part 'admin_budget_request_event.freezed.dart';

@freezed
class AdminBudgetRequestEvent with _$AdminBudgetRequestEvent {
  const factory AdminBudgetRequestEvent.getAll({
    @Default(1) int page,
    String? status,
    String? jenis,
    String? urgensi,
    String? divisi,
    String? dateFrom,
    String? dateTo,
  }) = AdminBudgetRequestGetAll;

  const factory AdminBudgetRequestEvent.getDetail(int id) =
      AdminBudgetRequestGetDetail;

  const factory AdminBudgetRequestEvent.approve({
    required int id,
    required ApproveBudgetRequestModel request,
  }) = AdminBudgetRequestApprove;

  const factory AdminBudgetRequestEvent.reject({
    required int id,
    required RejectBudgetRequestModel request,
  }) = AdminBudgetRequestReject;

  const factory AdminBudgetRequestEvent.tunda({
    required int id,
    required TundaBudgetRequestModel request,
  }) = AdminBudgetRequestTunda;
}