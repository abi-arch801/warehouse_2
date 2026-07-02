// part of 'admin_stock_bloc.dart';

// @freezed
// class AdminStockEvent with _$AdminStockEvent {
//   const factory AdminStockEvent.load() = _Load;
//   const factory AdminStockEvent.filterWarehouse(int? warehouseId) = _FilterWarehouse;
// }




part of 'admin_stock_bloc.dart';

@freezed
class AdminStockEvent with _$AdminStockEvent {
  const factory AdminStockEvent.load() = _Load;

  const factory AdminStockEvent.filterWarehouse(
    int? warehouseId,
  ) = _FilterWarehouse;
}