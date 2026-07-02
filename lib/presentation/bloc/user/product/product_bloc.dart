import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/product_datasource.dart';
import 'package:warehouse/data/model/request/product_request_model.dart';
import 'package:warehouse/data/model/response/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductDatasource _datasource = ProductDatasource();

  ProductBloc() : super(const ProductState.initial()) {
    on<_LoadProducts>(_onLoad);
    on<_LoadProductDetail>(_onDetail);
    on<_StoreProduct>(_onStore);
    on<_UpdateProduct>(_onUpdate);
    on<_DeleteProduct>(_onDelete);
  }

  Future<void> _onLoad(
      _LoadProducts event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await _datasource.getProducts(
      page: event.page,
      search: event.search,
      categoryId: event.categoryId,
      isActive: event.isActive,
    );
    result.fold(
      (err) => emit(ProductState.error(err)),
      (res) => emit(ProductState.listLoaded(res)),
    );
  }

  Future<void> _onDetail(
      _LoadProductDetail event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await _datasource.getProductDetail(event.id);
    result.fold(
      (err) => emit(ProductState.error(err)),
      (res) => emit(ProductState.detailLoaded(res)),
    );
  }

  Future<void> _onStore(
      _StoreProduct event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await _datasource.storeProduct(event.request);
    result.fold(
      (err) => emit(ProductState.error(err)),
      (res) => emit(ProductState.actionSuccess(
          res.message ?? 'Produk berhasil dibuat.', res)),
    );
  }

  Future<void> _onUpdate(
      _UpdateProduct event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result =
        await _datasource.updateProduct(event.id, event.request);
    result.fold(
      (err) => emit(ProductState.error(err)),
      (res) => emit(ProductState.actionSuccess(
          res.message ?? 'Produk berhasil diupdate.', res)),
    );
  }

  Future<void> _onDelete(
      _DeleteProduct event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await _datasource.deleteProduct(event.id);
    result.fold(
      (err) => emit(ProductState.error(err)),
      (msg) => emit(ProductState.actionSuccess(msg, null)),
    );
  }
}