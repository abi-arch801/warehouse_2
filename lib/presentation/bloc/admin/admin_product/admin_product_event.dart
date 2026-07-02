part of 'admin_product_bloc.dart';

@freezed
class AdminProductEvent with _$AdminProductEvent {
  const factory AdminProductEvent.loadMore() = _LoadMore;
  const factory AdminProductEvent.search(String query) = _Search;
  const factory AdminProductEvent.filterCategory(int? categoryId) =
      _FilterCategory;
  const factory AdminProductEvent.filterLowStock(bool value) = _FilterLowStock;
  const factory AdminProductEvent.create(Map<String, dynamic> data) =
      _CreateProduct;
  const factory AdminProductEvent.update({
    required int productId,
    required Map<String, dynamic> data,
  }) = _UpdateProduct;
  const factory AdminProductEvent.delete(int productId) = _DeleteProduct;

  const factory AdminProductEvent.load({
    int? page,
    String? search,
    int? categoryId,
    bool? isActive,
  }) = _LoadProducts;
  const factory AdminProductEvent.loadDetail(int id) = _LoadProductDetail;
  const factory AdminProductEvent.store(dynamic request) = _StoreProduct;
}

