import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/warehouse_datasource.dart';
import 'package:warehouse/data/model/request/warehouse_request_model.dart';
import 'package:warehouse/data/model/response/warehouse_response_model.dart' hide StoreWarehouseRequestModel, UpdateWarehouseRequestModel;

part 'warehouse_event.dart';
part 'warehouse_state.dart';
part 'warehouse_bloc.freezed.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  final WarehouseDatasource _datasource = WarehouseDatasource();

  WarehouseBloc() : super(const WarehouseState.initial()) {
    on<_LoadWarehouses>(_onLoad);
    on<_LoadWarehouseDetail>(_onDetail);
    on<_StoreWarehouse>(_onStore);
    on<_UpdateWarehouse>(_onUpdate);
    on<_DeleteWarehouse>(_onDelete);
  }

  Future<void> _onLoad(
      _LoadWarehouses event, Emitter<WarehouseState> emit) async {
    emit(const WarehouseState.loading());
    final result = await _datasource.getWarehouses(
      page: event.page,
      search: event.search,
      isActive: event.isActive,
    );
    result.fold(
      (err) => emit(WarehouseState.error(err)),
      (res) => emit(WarehouseState.listLoaded(res)),
    );
  }

  Future<void> _onDetail(
      _LoadWarehouseDetail event, Emitter<WarehouseState> emit) async {
    emit(const WarehouseState.loading());
    final result = await _datasource.getWarehouseDetail(event.id);
    result.fold(
      (err) => emit(WarehouseState.error(err)),
      (res) => emit(WarehouseState.detailLoaded(res)),
    );
  }

  Future<void> _onStore(
      _StoreWarehouse event, Emitter<WarehouseState> emit) async {
    emit(const WarehouseState.loading());
    final result = await _datasource.storeWarehouse(event.request);
    result.fold(
      (err) => emit(WarehouseState.error(err)),
      (res) => emit(WarehouseState.actionSuccess(
          res.message ?? 'Gudang berhasil dibuat.', res)),
    );
  }

  Future<void> _onUpdate(
      _UpdateWarehouse event, Emitter<WarehouseState> emit) async {
    emit(const WarehouseState.loading());
    final result =
        await _datasource.updateWarehouse(event.id, event.request);
    result.fold(
      (err) => emit(WarehouseState.error(err)),
      (res) => emit(WarehouseState.actionSuccess(
          res.message ?? 'Gudang berhasil diupdate.', res)),
    );
  }

  Future<void> _onDelete(
      _DeleteWarehouse event, Emitter<WarehouseState> emit) async {
    emit(const WarehouseState.loading());
    final result = await _datasource.deleteWarehouse(event.id);
    result.fold(
      (err) => emit(WarehouseState.error(err)),
      (msg) => emit(WarehouseState.actionSuccess(msg, null)),
    );
  }
}




