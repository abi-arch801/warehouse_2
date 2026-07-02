import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';

part 'admin_budget_request_state.freezed.dart';

@freezed
class AdminBudgetRequestState with _$AdminBudgetRequestState {
  const factory AdminBudgetRequestState.initial() = _Initial;
  const factory AdminBudgetRequestState.loading() = _Loading;
  const factory AdminBudgetRequestState.loaded(
      BudgetRequestListResponseModel data) = _Loaded;
  const factory AdminBudgetRequestState.detail(BudgetRequestModel data) =
      _Detail;
  const factory AdminBudgetRequestState.success(String message) = _Success;
  const factory AdminBudgetRequestState.error(String message) = _Error;
}