part of 'request_bloc.dart';

@freezed
class RequestState with _$RequestState {
  const factory RequestState.initial() = _Initial;
  const factory RequestState.loading() = _Loading;
  const factory RequestState.listLoaded(StockRequestListResponseModel result) = _ListLoaded;
  const factory RequestState.detailLoaded(StockRequestResponseModel result) = _DetailLoaded;
  const factory RequestState.actionSuccess(String message, StockRequestResponseModel? data) = _ActionSuccess;
  const factory RequestState.error(String message) = _Error;
}


