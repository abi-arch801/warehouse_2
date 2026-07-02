part of 'admin_product_bloc.dart';

@freezed
class AdminProductState with _$AdminProductState {
  const factory AdminProductState.initial() = _Initial;
  const factory AdminProductState.loading() = _Loading;
  const factory AdminProductState.loaded({
    required List<dynamic> items,
    required int totalItems,
    required bool hasMore,
  }) = _Loaded;
  const factory AdminProductState.actionLoading() = _ActionLoading;
  const factory AdminProductState.actionSuccess(String message) =
      _ActionSuccess;
  const factory AdminProductState.error(String message) = _Error;

}


