part of 'po_bloc.dart';

@freezed
class PoEvent with _$PoEvent {
  const factory PoEvent.load({@Default(1) int page, String? status,
    int? supplierId, int? warehouseId})                                     = _Load;
  const factory PoEvent.filter(String? status)                             = _Filter;
  const factory PoEvent.loadDetail(int id)                                 = _LoadDetail;
  const factory PoEvent.store(Map<String, dynamic> body)                   = _Store;
  const factory PoEvent.approve(int id)                                    = _Approve;
  const factory PoEvent.receive({required int id,
    required List<Map<String, dynamic>> items})                            = _Receive;
  const factory PoEvent.delete(int id)                                     = _Delete;
}



