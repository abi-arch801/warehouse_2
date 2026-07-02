// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:warehouse/data/datasource/admin/stock_transfer_datasource.dart';

// part 'transfer_event.dart';
// part 'transfer_state.dart';
// part 'transfer_bloc.freezed.dart';

// class TransferBloc extends Bloc<TransferEvent, TransferState> {
//   final _ds = StockTransferDatasource();

//   TransferBloc() : super(const TransferState.initial()) {
//     on<_Load>(_onLoad);
//     on<_Filter>(_onFilter);
//     on<_LoadDetail>(_onDetail);
//     on<_Store>(_onStore);
//     on<_Approve>(_onApprove);
//     on<_Send>(_onSend);
//     on<_Receive>(_onReceive);
//     on<_Reject>(_onReject);
//   }

//   Future<void> _onLoad(_Load e, Emitter<TransferState> emit) async {
//     emit(const TransferState.loading());
//     final r = await _ds.getAll(page: e.page, status: e.status,
//         fromWarehouseId: e.fromWarehouseId, toWarehouseId: e.toWarehouseId);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.listLoaded(res)));
//   }

//   Future<void> _onFilter(_Filter e, Emitter<TransferState> emit) async {
//     emit(const TransferState.loading());
//     final r = await _ds.getAll(status: e.status);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.listLoaded(res)));
//   }

//   Future<void> _onDetail(_LoadDetail e, Emitter<TransferState> emit) async {
//     emit(const TransferState.loading());
//     final r = await _ds.getDetail(e.id);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.detailLoaded(res)));
//   }

//   Future<void> _onStore(_Store e, Emitter<TransferState> emit) async {
//     emit(const TransferState.actionLoading());
//     final r = await _ds.store(e.body);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.actionSuccess(
//                res.message ?? 'Transfer berhasil dibuat.', res)));
//   }

//   Future<void> _onApprove(_Approve e, Emitter<TransferState> emit) async {
//     emit(const TransferState.actionLoading());
//     final r = await _ds.approve(e.id);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.actionSuccess('Transfer disetujui.', res)));
//   }

//   Future<void> _onSend(_Send e, Emitter<TransferState> emit) async {
//     emit(const TransferState.actionLoading());
//     final r = await _ds.send(e.id);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.actionSuccess('Barang dikirim.', res)));
//   }

//   Future<void> _onReceive(_Receive e, Emitter<TransferState> emit) async {
//     emit(const TransferState.actionLoading());
//     final r = await _ds.receive(e.id, e.items);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.actionSuccess('Barang diterima.', res)));
//   }

//   Future<void> _onReject(_Reject e, Emitter<TransferState> emit) async {
//     emit(const TransferState.actionLoading());
//     final r = await _ds.reject(e.id, e.reason);
//     r.fold((err) => emit(TransferState.error(err)),
//            (res) => emit(TransferState.actionSuccess('Transfer ditolak.', res)));
//   }
// }



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/stock_transfer_datasource.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';
part 'transfer_bloc.freezed.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final _ds = StockTransferDatasource();

  TransferBloc() : super(const TransferState.initial()) {
    on<_Load>(_onLoad);
    on<_Filter>(_onFilter);
    on<_LoadDetail>(_onDetail);
    on<_Store>(_onStore);
    on<_Approve>(_onApprove);
    on<_Send>(_onSend);
    on<_Receive>(_onReceive);
    on<_Reject>(_onReject);
  }

  Future<void> _onLoad(_Load e, Emitter<TransferState> emit) async {
    emit(const TransferState.loading());
    final r = await _ds.getAll(
      page: e.page,
      status: e.status,
      fromWarehouseId: e.fromWarehouseId,
      toWarehouseId: e.toWarehouseId,
    );
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.listLoaded(res)),
    );
  }

  Future<void> _onFilter(_Filter e, Emitter<TransferState> emit) async {
    emit(const TransferState.loading());
    // Tab "Dikirim" di UI → filter pakai "in_transit" (nama status Laravel)
    final r = await _ds.getAll(status: e.status);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.listLoaded(res)),
    );
  }

  Future<void> _onDetail(_LoadDetail e, Emitter<TransferState> emit) async {
    emit(const TransferState.loading());
    final r = await _ds.getDetail(e.id);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.detailLoaded(res)),
    );
  }

  Future<void> _onStore(_Store e, Emitter<TransferState> emit) async {
    emit(const TransferState.actionLoading());
    final r = await _ds.store(e.body);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.actionSuccess(
        res.message ?? 'Transfer berhasil dibuat.',
        res,
      )),
    );
  }

  Future<void> _onApprove(_Approve e, Emitter<TransferState> emit) async {
    emit(const TransferState.actionLoading());
    final r = await _ds.approve(e.id);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.actionSuccess('Transfer disetujui.', res)),
    );
  }

  Future<void> _onSend(_Send e, Emitter<TransferState> emit) async {
    emit(const TransferState.actionLoading());
    // Kirim items[] dengan stock_transfer_item_id + quantity_sent
    final r = await _ds.send(e.id, items: e.items);
    r.fold(
      (err) => emit(TransferState.error(err)),
      // Setelah send, status Laravel = "in_transit"
      (res) => emit(TransferState.actionSuccess('Barang dikirim.', res)),
    );
  }

  Future<void> _onReceive(_Receive e, Emitter<TransferState> emit) async {
    emit(const TransferState.actionLoading());
    // Kirim items[] dengan stock_transfer_item_id + quantity_received
    final r = await _ds.receive(e.id, items: e.items);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.actionSuccess('Barang diterima.', res)),
    );
  }

  Future<void> _onReject(_Reject e, Emitter<TransferState> emit) async {
    emit(const TransferState.actionLoading());
    final r = await _ds.reject(e.id, e.reason);
    r.fold(
      (err) => emit(TransferState.error(err)),
      (res) => emit(TransferState.actionSuccess('Transfer ditolak.', res)),
    );
  }
}