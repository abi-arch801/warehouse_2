// part of 'transfer_bloc.dart';

// @freezed
// class TransferEvent with _$TransferEvent {
//   const factory TransferEvent.load({@Default(1) int page, String? status,
//     int? fromWarehouseId, int? toWarehouseId})                             = _Load;
//   const factory TransferEvent.filter(String? status)                      = _Filter;
//   const factory TransferEvent.loadDetail(int id)                          = _LoadDetail;
//   const factory TransferEvent.store(Map<String, dynamic> body)            = _Store;
//   const factory TransferEvent.approve(int id)                             = _Approve;
//   const factory TransferEvent.send(int id)                                = _Send;
//   const factory TransferEvent.receive({required int id,
//     required List<Map<String, dynamic>> items})                           = _Receive;
//   const factory TransferEvent.reject({required int id, required String reason}) = _Reject;
// }




part of 'transfer_bloc.dart';

@freezed
class TransferEvent with _$TransferEvent {
  const factory TransferEvent.load({
    @Default(1) int page,
    String? status,
    int? fromWarehouseId,
    int? toWarehouseId,
  }) = _Load;

  const factory TransferEvent.filter(String? status) = _Filter;

  const factory TransferEvent.loadDetail(int id) = _LoadDetail;

  const factory TransferEvent.store(Map<String, dynamic> body) = _Store;

  const factory TransferEvent.approve(int id) = _Approve;

  /// [items] wajib diisi — setiap item berisi:
  ///   { "stock_transfer_item_id": int, "quantity_sent": int }
  const factory TransferEvent.send({
    required int id,
    required List<Map<String, dynamic>> items,
  }) = _Send;

  /// [items] wajib diisi — setiap item berisi:
  ///   { "stock_transfer_item_id": int, "quantity_received": int }
  const factory TransferEvent.receive({
    required int id,
    required List<Map<String, dynamic>> items,
  }) = _Receive;

  const factory TransferEvent.reject({
    required int id,
    required String reason,
  }) = _Reject;
}