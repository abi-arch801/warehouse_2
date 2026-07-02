import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/supplier_remote_datasource.dart';
import 'package:warehouse/data/model/response/supplier_response_model.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';
part 'supplier_bloc.freezed.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  final SupplierDatasource _datasource;

  SupplierBloc({SupplierDatasource? datasource})
      : _datasource = datasource ?? SupplierDatasource(),
        super(const SupplierState.initial()) {
    on<_LoadSuppliers>(_onLoadSuppliers);
    on<_GetSupplierDetail>(_onGetSupplierDetail);
    on<_CreateSupplier>(_onCreateSupplier);
    on<_UpdateSupplier>(_onUpdateSupplier);
    on<_DeleteSupplier>(_onDeleteSupplier);
    on<_RefreshSuppliers>(_onRefreshSuppliers);
  }

  Future<void> _onLoadSuppliers(
    _LoadSuppliers event,
    Emitter<SupplierState> emit,
  ) async {
    emit(const SupplierState.loading());
    final result = await _datasource.getSuppliers();
    result.fold(
      (err) => emit(SupplierState.error(err)),
      (suppliers) => emit(SupplierState.loaded(suppliers)),
    );
  }

  Future<void> _onGetSupplierDetail(
    _GetSupplierDetail event,
    Emitter<SupplierState> emit,
  ) async {
    emit(const SupplierState.loading());
    final result = await _datasource.getSupplierDetail(event.supplierId);
    result.fold(
      (err) => emit(SupplierState.error(err)),
      (supplier) => emit(SupplierState.detailLoaded(supplier)),
    );
  }

  Future<void> _onCreateSupplier(
    _CreateSupplier event,
    Emitter<SupplierState> emit,
  ) async {
    emit(const SupplierState.loading());
    final result = await _datasource.createSupplier(event.data);
    result.fold(
      (err) => emit(SupplierState.error(err)),
      (_) {
        emit(const SupplierState.success('Supplier berhasil ditambahkan'));
        add(const SupplierEvent.loadSuppliers());
      },
    );
  }

  Future<void> _onUpdateSupplier(
    _UpdateSupplier event,
    Emitter<SupplierState> emit,
  ) async {
    emit(const SupplierState.loading());
    final result = await _datasource.updateSupplier(event.supplierId, event.data);
    result.fold(
      (err) => emit(SupplierState.error(err)),
      (_) {
        emit(const SupplierState.success('Supplier berhasil diupdate'));
        add(const SupplierEvent.loadSuppliers());
      },
    );
  }

  Future<void> _onDeleteSupplier(
    _DeleteSupplier event,
    Emitter<SupplierState> emit,
  ) async {
    emit(const SupplierState.loading());
    final result = await _datasource.deleteSupplier(event.supplierId);
    result.fold(
      (err) => emit(SupplierState.error(err)),
      (msg) {
        emit(SupplierState.success(msg));
        add(const SupplierEvent.loadSuppliers());
      },
    );
  }

  Future<void> _onRefreshSuppliers(
    _RefreshSuppliers event,
    Emitter<SupplierState> emit,
  ) async {
    add(const SupplierEvent.loadSuppliers());
  }
}