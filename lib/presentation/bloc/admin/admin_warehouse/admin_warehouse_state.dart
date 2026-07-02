// lib/presentation/bloc/admin/admin_warehouse/admin_warehouse_state.dart

part of 'admin_warehouse_bloc.dart';

@freezed
class AdminWarehouseState with _$AdminWarehouseState {
  const factory AdminWarehouseState.initial() = _Initial;
  const factory AdminWarehouseState.loading() = _Loading;

  const factory AdminWarehouseState.listLoaded(
    AdminWarehouseListResponse result,
  ) = _ListLoaded;

  const factory AdminWarehouseState.actionSuccess(
    String message,
    AdminWarehouseModel? data,
  ) = _ActionSuccess;

  const factory AdminWarehouseState.error(String message) = _Error;
}


