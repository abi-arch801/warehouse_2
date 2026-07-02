// part of 'admin_stock_bloc.dart';


// @freezed
// class AdminStockState with _$AdminStockState {
//   const factory AdminStockState.initial() = _Initial;
//   const factory AdminStockState.loading() = _Loading;
//   const factory AdminStockState.loaded({
//     required List<ProductModel> products,
//     required List<WarehouseModel> warehouses,
//     int? selectedWarehouseId,
//   }) = _Loaded;
//   const factory AdminStockState.error(String message) = _Error;
// }



part of 'admin_stock_bloc.dart';

@freezed
class AdminStockState with _$AdminStockState {
  const factory AdminStockState.initial() = _Initial;

  const factory AdminStockState.loading() = _Loading;

  const factory AdminStockState.loaded({
    required List<ProductModel> products,
    required List<WarehouseModel> warehouses,
    int? selectedWarehouseId,
  }) = _Loaded;

  const factory AdminStockState.error(
    String message,
  ) = _Error;
}