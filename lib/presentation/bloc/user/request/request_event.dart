part of 'request_bloc.dart';

@freezed
class RequestEvent with _$RequestEvent {
  const factory RequestEvent.loadMyRequests(
      {@Default(1) int page, String? status}) = _LoadMyRequests;
  const factory RequestEvent.loadAllRequests(
      {@Default(1) int page, String? status}) = _LoadAllRequests;
  const factory RequestEvent.loadDetail(int id) = _LoadDetail;
  const factory RequestEvent.storeRequest(StoreStockRequestModel request) =
      _StoreRequest;
  const factory RequestEvent.updateRequest(
      {required int id,
      required UpdateStockRequestModel request}) = _UpdateRequest;
  const factory RequestEvent.deleteRequest(int id) = _DeleteRequest;
  const factory RequestEvent.approveRequest(
      {required int id,
      required ApproveRequestModel request}) = _ApproveRequest;
  const factory RequestEvent.rejectRequest(
      {required int id, required RejectRequestModel request}) = _RejectRequest;
  const factory RequestEvent.completeRequest(int id) = _CompleteRequest;
}




