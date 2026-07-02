part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts({
    @Default(1) int page,
    String? search,
    int? categoryId,
    bool? isActive,
  }) = _LoadProducts;
  const factory ProductEvent.loadProductDetail(int id) = _LoadProductDetail;
  const factory ProductEvent.storeProduct(StoreProductRequestModel request) = _StoreProduct;
  const factory ProductEvent.updateProduct({required int id, required UpdateProductRequestModel request}) = _UpdateProduct;
  const factory ProductEvent.deleteProduct(int id) = _DeleteProduct;
}


