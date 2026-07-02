part of 'warehouse_bloc.dart';

@freezed
class WarehouseEvent with _$WarehouseEvent {
  const factory WarehouseEvent.loadWarehouses({
    @Default(1) int page,
    String? search,
    bool? isActive,
  }) = _LoadWarehouses;
  const factory WarehouseEvent.loadWarehouseDetail(int id) = _LoadWarehouseDetail;
  const factory WarehouseEvent.storeWarehouse(StoreWarehouseRequestModel request) = _StoreWarehouse;
  const factory WarehouseEvent.updateWarehouse({required int id, required UpdateWarehouseRequestModel request}) = _UpdateWarehouse;
  const factory WarehouseEvent.deleteWarehouse(int id) = _DeleteWarehouse;
}


