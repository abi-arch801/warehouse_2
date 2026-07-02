import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/stock_request_datasource.dart';
import 'package:warehouse/data/model/request/request_request_model.dart';
import 'package:warehouse/data/model/response/request_response_model.dart';

part 'request_event.dart';
part 'request_state.dart';
part 'request_bloc.freezed.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final StockRequestDatasource _datasource = StockRequestDatasource();

  RequestBloc() : super(const RequestState.initial()) {
    on<_LoadMyRequests>(_onLoadMyRequests);
    on<_LoadAllRequests>(_onLoadAllRequests);
    on<_LoadDetail>(_onLoadDetail);
    on<_StoreRequest>(_onStore);
    on<_UpdateRequest>(_onUpdate);
    on<_DeleteRequest>(_onDelete);
    on<_ApproveRequest>(_onApprove);
    on<_RejectRequest>(_onReject);
    on<_CompleteRequest>(_onComplete);
  }

  Future<void> _onLoadMyRequests(
      _LoadMyRequests event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.getMyRequests(
        page: event.page, status: event.status);
    result.fold(
      (err) => emit(RequestState.error(err)),
      // ✅ pakai 'result' sesuai nama parameter di state
      (res) => emit(RequestState.listLoaded(res)),
    );
  }

  Future<void> _onLoadAllRequests(
      _LoadAllRequests event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.getAllRequests(
        page: event.page, status: event.status);
    result.fold(
      (err) => emit(RequestState.error(err)),
      (res) => emit(RequestState.listLoaded(res)),
    );
  }

  Future<void> _onLoadDetail(
      _LoadDetail event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.getRequestDetail(event.id);
    result.fold(
      (err) => emit(RequestState.error(err)),
      // ✅ pakai 'result' sesuai nama parameter di state
      (res) => emit(RequestState.detailLoaded(res)),
    );
  }

  Future<void> _onStore(
      _StoreRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.storeRequest(event.request);
    result.fold(
      (err) => emit(RequestState.error(err)),
      // ✅ res adalah StockRequestResponseModel — .message sudah nullable di model
      (res) => emit(RequestState.actionSuccess(
          res.message ?? 'Permintaan berhasil dibuat.', res)),
    );
  }

  Future<void> _onUpdate(
      _UpdateRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.updateRequest(event.id, event.request);
    result.fold(
      (err) => emit(RequestState.error(err)),
      (res) => emit(RequestState.actionSuccess(
          res.message ?? 'Permintaan berhasil diupdate.', res)),
    );
  }

  Future<void> _onDelete(
      _DeleteRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.deleteRequest(event.id);
    result.fold(
      (err) => emit(RequestState.error(err)),
      // ✅ delete hanya return String, data = null
      (msg) => emit(RequestState.actionSuccess(msg, null)),
    );
  }

  Future<void> _onApprove(
      _ApproveRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.approveRequest(event.id, event.request);
    result.fold(
      (err) => emit(RequestState.error(err)),
      (res) => emit(RequestState.actionSuccess(
          res.message ?? 'Permintaan disetujui.', res)),
    );
  }

  Future<void> _onReject(
      _RejectRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.rejectRequest(event.id, event.request);
    result.fold(
      (err) => emit(RequestState.error(err)),
      (res) => emit(RequestState.actionSuccess(
          res.message ?? 'Permintaan ditolak.', res)),
    );
  }

  Future<void> _onComplete(
      _CompleteRequest event, Emitter<RequestState> emit) async {
    emit(const RequestState.loading());
    final result = await _datasource.completeRequest(event.id);
    result.fold(
      (err) => emit(RequestState.error(err)),
      (res) => emit(RequestState.actionSuccess(
          res.message ?? 'Permintaan selesai.', res)),
    );
  }
}










