// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:warehouse/data/datasource/admin/stock_opname_datasource.dart';
// import 'package:warehouse/data/model/response/stock_response_model.dart';

// part 'opname_event.dart';
// part 'opname_state.dart';
// part 'opname_bloc.freezed.dart';

// class OpnameBloc extends Bloc<OpnameEvent, OpnameState> {
//   final _ds = StockOpnameDatasource();

//   OpnameBloc() : super(const OpnameState.initial()) {
//     on<_Load>(_onLoad);
//     on<_LoadDetail>(_onDetail);
//     on<_Store>(_onStore);
//     on<_Start>(_onStart);
//     on<_Complete>(_onComplete);
//     on<_Approve>(_onApprove);
//     on<_Reject>(_onReject);
//   }

//   Future<void> _onLoad(_Load e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.loading());
//     final r = await _ds.getAll(page: e.page, status: e.status, warehouseId: e.warehouseId);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.listLoaded(res)));
//   }

//   Future<void> _onDetail(_LoadDetail e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.loading());
//     final r = await _ds.getDetail(e.id);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.detailLoaded(res)));
//   }

//   Future<void> _onStore(_Store e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.actionLoading());
//     final r = await _ds.store(e.body);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.actionSuccess(
//                res.message ?? 'Opname berhasil dibuat.', res)));
//   }

//   Future<void> _onStart(_Start e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.actionLoading());
//     final r = await _ds.start(e.id);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.actionSuccess('Opname dimulai.', res)));
//   }

//   Future<void> _onComplete(_Complete e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.actionLoading());
//     final r = await _ds.complete(e.id, e.items);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.actionSuccess('Opname selesai dihitung.', res)));
//   }

//   Future<void> _onApprove(_Approve e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.actionLoading());
//     final r = await _ds.approve(e.id);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.actionSuccess('Opname disetujui.', res)));
//   }

//   Future<void> _onReject(_Reject e, Emitter<OpnameState> emit) async {
//     emit(const OpnameState.actionLoading());
//     final r = await _ds.reject(e.id, e.reason);
//     r.fold((err) => emit(OpnameState.error(err)),
//            (res) => emit(OpnameState.actionSuccess('Opname ditolak.', res)));
//   }
// }



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/stock_opname_datasource.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';

part 'opname_event.dart';
part 'opname_state.dart';
part 'opname_bloc.freezed.dart';

class OpnameBloc extends Bloc<OpnameEvent, OpnameState> {
  final _ds = StockOpnameDatasource();

  OpnameBloc() : super(const OpnameState.initial()) {
    on<_Load>(_onLoad);
    on<_LoadDetail>(_onDetail);
    on<_Store>(_onStore);
    on<_Start>(_onStart);
    on<_SaveProgress>(_onSaveProgress);
    on<_Complete>(_onComplete);
    on<_Approve>(_onApprove);
    on<_Reject>(_onReject);
    on<_LoadProductsForOpname>(_onLoadProducts);
  }

  Future<void> _onLoad(_Load e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.loading());
    final r = await _ds.getAll(
        page: e.page, status: e.status, warehouseId: e.warehouseId);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(OpnameState.listLoaded(res)),
    );
  }

  Future<void> _onDetail(_LoadDetail e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.loading());
    final r = await _ds.getDetail(e.id);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(OpnameState.detailLoaded(res)),
    );
  }

  Future<void> _onStore(_Store e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.store(e.body);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(OpnameState.actionSuccess(
          res.message ?? 'Opname berhasil dibuat.', res)),
    );
  }

  Future<void> _onStart(_Start e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.start(e.id);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(
          OpnameState.actionSuccess('Opname dimulai. Silakan isi stok fisik.', res)),
    );
  }

  // Simpan progress tanpa finalize
  Future<void> _onSaveProgress(
      _SaveProgress e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.saveProgress(e.id, e.items);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(
          OpnameState.actionSuccess('Progress tersimpan.', res)),
    );
  }

  Future<void> _onComplete(_Complete e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.complete(e.id, e.items);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(OpnameState.actionSuccess(
          'Opname selesai dihitung. Menunggu persetujuan.', res)),
    );
  }

  Future<void> _onApprove(_Approve e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.approve(e.id);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) =>
          emit(OpnameState.actionSuccess('Opname disetujui. Stok disesuaikan.', res)),
    );
  }

  Future<void> _onReject(_Reject e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.actionLoading());
    final r = await _ds.reject(e.id, e.reason);
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(
          OpnameState.actionSuccess('Opname dikembalikan untuk diperbaiki.', res)),
    );
  }

  Future<void> _onLoadProducts(
      _LoadProductsForOpname e, Emitter<OpnameState> emit) async {
    emit(const OpnameState.loading());
    final r = await _ds.getProductsForOpname(
      warehouseId: e.warehouseId,
      search: e.search,
      categoryId: e.categoryId,
    );
    r.fold(
      (err) => emit(OpnameState.error(err)),
      (res) => emit(OpnameState.productsLoaded(res)),
    );
  }
}