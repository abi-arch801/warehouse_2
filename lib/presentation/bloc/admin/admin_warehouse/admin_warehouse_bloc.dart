// lib/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_warehouse_remote_datasource.dart';
import 'package:warehouse/data/model/response/admin/admin_warehouse_model.dart';

part 'admin_warehouse_event.dart';
part 'admin_warehouse_state.dart';
part 'admin_warehouse_bloc.freezed.dart';

class AdminWarehouseBloc
    extends Bloc<AdminWarehouseEvent, AdminWarehouseState> {
  final AdminWarehouseRemoteDatasource _ds;

  AdminWarehouseBloc({AdminWarehouseRemoteDatasource? datasource})
      : _ds = datasource ?? AdminWarehouseRemoteDatasource(),
        super(const AdminWarehouseState.initial()) {
    on<_Load>(_onLoad);
    on<_Store>(_onStore);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);
  }

  Future<void> _onLoad(_Load event, Emitter<AdminWarehouseState> emit) async {
    emit(const AdminWarehouseState.loading());
    final res = await _ds.getWarehouses(
      page:     event.page,
      search:   event.search,
      isActive: event.isActive,
    );
    res.fold(
      (err) => emit(AdminWarehouseState.error(err)),
      (data) => emit(AdminWarehouseState.listLoaded(data)),
    );
  }

  Future<void> _onStore(_Store event, Emitter<AdminWarehouseState> emit) async {
    emit(const AdminWarehouseState.loading());
    final res = await _ds.storeWarehouse(event.request);
    res.fold(
      (err)  => emit(AdminWarehouseState.error(err)),
      (data) => emit(AdminWarehouseState.actionSuccess(
        data.message ?? 'Gudang berhasil ditambahkan.',
        data.data,
      )),
    );
  }

  Future<void> _onUpdate(_Update event, Emitter<AdminWarehouseState> emit) async {
    emit(const AdminWarehouseState.loading());
    final res = await _ds.updateWarehouse(event.id, event.request);
    res.fold(
      (err)  => emit(AdminWarehouseState.error(err)),
      (data) => emit(AdminWarehouseState.actionSuccess(
        data.message ?? 'Gudang berhasil diupdate.',
        data.data,
      )),
    );
  }

  Future<void> _onDelete(_Delete event, Emitter<AdminWarehouseState> emit) async {
    emit(const AdminWarehouseState.loading());
    final res = await _ds.deleteWarehouse(event.id);
    res.fold(
      (err) => emit(AdminWarehouseState.error(err)),
      (msg) => emit(AdminWarehouseState.actionSuccess(msg, null)),
    );
  }
}




