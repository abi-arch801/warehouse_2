part of 'transfer_bloc.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.initial()                                               = _Initial;
  const factory TransferState.loading()                                               = _Loading;
  const factory TransferState.actionLoading()                                         = _ActionLoading;
  const factory TransferState.listLoaded(StockTransferListResponse result)            = _ListLoaded;
  const factory TransferState.detailLoaded(StockTransferSingleResponse result)        = _DetailLoaded;
  const factory TransferState.actionSuccess(String message, StockTransferSingleResponse? data) = _ActionSuccess;
  const factory TransferState.error(String message)                                   = _Error;
}


