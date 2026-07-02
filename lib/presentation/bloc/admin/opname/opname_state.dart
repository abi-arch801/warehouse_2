// part of 'opname_bloc.dart';

// @freezed
// class OpnameState with _$OpnameState {
//   const factory OpnameState.initial()                                                  = _Initial;
//   const factory OpnameState.loading()                                                  = _Loading;
//   const factory OpnameState.actionLoading()                                            = _ActionLoading;
//   const factory OpnameState.listLoaded(StockOpnameListResponse result)                 = _ListLoaded;
//   const factory OpnameState.detailLoaded(StockOpnameSingleResponse result)             = _DetailLoaded;
//   const factory OpnameState.actionSuccess(String message, StockOpnameSingleResponse? data) = _ActionSuccess;
//   const factory OpnameState.error(String message)                                      = _Error;
// }


part of 'opname_bloc.dart';

@freezed
class OpnameState with _$OpnameState {
  const factory OpnameState.initial() = _Initial;
  const factory OpnameState.loading() = _Loading;
  const factory OpnameState.actionLoading() = _ActionLoading;

  // List opname
  const factory OpnameState.listLoaded(StockOpnameListResponse result) =
      _ListLoaded;

  // Detail opname (termasuk items lengkap)
  const factory OpnameState.detailLoaded(StockOpnameSingleResponse result) =
      _DetailLoaded;

  // Aksi sukses (store, start, complete, approve, reject, saveProgress)
  const factory OpnameState.actionSuccess(
    String message,
    StockOpnameSingleResponse? data,
  ) = _ActionSuccess;

  // Produk untuk scope=manual (opname create page)
  const factory OpnameState.productsLoaded(
    ProductForOpnameListResponse result,
  ) = _ProductsLoaded;

  const factory OpnameState.error(String message) = _Error;
}