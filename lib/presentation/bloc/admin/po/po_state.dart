part of 'po_bloc.dart';

@freezed
class PoState with _$PoState {
  const factory PoState.initial()                                                     = _Initial;
  const factory PoState.loading()                                                     = _Loading;
  const factory PoState.actionLoading()                                               = _ActionLoading;
  const factory PoState.listLoaded(PurchaseOrderListResponse result)                  = _ListLoaded;
  const factory PoState.detailLoaded(PurchaseOrderSingleResponse result)              = _DetailLoaded;
  const factory PoState.actionSuccess(String message, PurchaseOrderSingleResponse? data) = _ActionSuccess;
  const factory PoState.error(String message)                                         = _Error;
}



