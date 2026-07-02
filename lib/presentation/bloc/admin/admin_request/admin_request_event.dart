part of 'admin_request_bloc.dart';

@freezed
class AdminRequestEvent with _$AdminRequestEvent {
  // ✅ Nama yang benar — load() bukan loadAll()
  const factory AdminRequestEvent.load({String? status}) = _LoadRequests;
  const factory AdminRequestEvent.loadMore() = _LoadMore;
  const factory AdminRequestEvent.filterStatus(String? status) = _FilterStatus;
  const factory AdminRequestEvent.loadDetail(int requestId) = _LoadDetail;
  // const factory AdminRequestEvent.approve({
  //   required int requestId,
  //   required int warehouseId,
  //   required List<Map<String, dynamic>> items,
  // }) = _ApproveRequest;
  const factory AdminRequestEvent.reject({
    required int requestId,
    required String rejectReason,
  }) = _RejectRequest;
  const factory AdminRequestEvent.complete(int requestId) = _CompleteRequest;

  const factory AdminRequestEvent.approve({
  required int requestId,
  required List<Map<String, dynamic>> items,
}) = _ApproveRequest;

const factory AdminRequestEvent.approveFinal({
  required int requestId,
  required int warehouseId,
  required List<Map<String, dynamic>> items,
}) = _ApproveFinalRequest;
}


