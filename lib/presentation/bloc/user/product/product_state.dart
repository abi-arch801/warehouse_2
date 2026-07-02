part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.listLoaded(ProductListResponseModel result) = _ListLoaded;
  const factory ProductState.detailLoaded(ProductResponseModel result) = _DetailLoaded;
  const factory ProductState.actionSuccess(String message, ProductResponseModel? data) = _ActionSuccess;
  const factory ProductState.error(String message) = _Error;
}


