part of 'warehouse_bloc.dart';

@freezed
class WarehouseState with _$WarehouseState {
  const factory WarehouseState.initial() = _Initial;
  const factory WarehouseState.loading() = _Loading;
  const factory WarehouseState.listLoaded(WarehouseListResponseModel result) =
      _ListLoaded;
  const factory WarehouseState.detailLoaded(WarehouseResponseModel result) =
      _DetailLoaded;
  const factory WarehouseState.actionSuccess(
      String message, WarehouseResponseModel? data) = _ActionSuccess;
  const factory WarehouseState.error(String message) = _Error;
}


