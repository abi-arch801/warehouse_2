// lib/presentation/bloc/admin/admin_warehouse/admin_warehouse_event.dart

part of 'admin_warehouse_bloc.dart';

@freezed
class AdminWarehouseEvent with _$AdminWarehouseEvent {
  const factory AdminWarehouseEvent.load({
    @Default(1) int page,
    String? search,
    bool? isActive,
  }) = _Load;

  const factory AdminWarehouseEvent.store(
    AdminStoreWarehouseRequest request,
  ) = _Store;

  const factory AdminWarehouseEvent.update({
    required int id,
    required AdminUpdateWarehouseRequest request,
  }) = _Update;

  const factory AdminWarehouseEvent.delete(int id) = _Delete;
}





