import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/purchase_order_datasource.dart';
import 'package:warehouse/data/model/response/po_response_model.dart';

part 'po_event.dart';
part 'po_state.dart';
part 'po_bloc.freezed.dart';

class PoBloc extends Bloc<PoEvent, PoState> {
  final _ds = PurchaseOrderDatasource();

  PoBloc() : super(const PoState.initial()) {
    on<_Load>(_onLoad);
    on<_Filter>(_onFilter);
    on<_LoadDetail>(_onDetail);
    on<_Store>(_onStore);
    on<_Approve>(_onApprove);
    on<_Receive>(_onReceive);
    on<_Delete>(_onDelete);
    
  }

  Future<void> _onLoad(_Load e, Emitter<PoState> emit) async {
    emit(const PoState.loading());
    final r = await _ds.getAll(page: e.page, status: e.status,
        supplierId: e.supplierId, warehouseId: e.warehouseId);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.listLoaded(res)));
  }

  Future<void> _onFilter(_Filter e, Emitter<PoState> emit) async {
    emit(const PoState.loading());
    final r = await _ds.getAll(status: e.status);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.listLoaded(res)));
  }

  Future<void> _onDetail(_LoadDetail e, Emitter<PoState> emit) async {
    emit(const PoState.loading());
    final r = await _ds.getDetail(e.id);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.detailLoaded(res)));
  }

  Future<void> _onStore(_Store e, Emitter<PoState> emit) async {
    emit(const PoState.actionLoading());
    final r = await _ds.store(e.body);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.actionSuccess(res.message ?? 'PO berhasil dibuat.', res)));
  }

  Future<void> _onApprove(_Approve e, Emitter<PoState> emit) async {
    emit(const PoState.actionLoading());
    final r = await _ds.approve(e.id);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.actionSuccess(res.message ?? 'PO disetujui.', res)));
  }

  Future<void> _onReceive(_Receive e, Emitter<PoState> emit) async {
    emit(const PoState.actionLoading());
    final r = await _ds.receive(e.id, e.items);
    r.fold((err) => emit(PoState.error(err)),
           (res) => emit(PoState.actionSuccess(res.message ?? 'Barang diterima.', res)));
  }

  Future<void> _onDelete(_Delete e, Emitter<PoState> emit) async {
    emit(const PoState.actionLoading());
    final r = await _ds.destroy(e.id);
    r.fold((err) => emit(PoState.error(err)),
           (msg) => emit(PoState.actionSuccess(msg, null)));
  }
  
}



