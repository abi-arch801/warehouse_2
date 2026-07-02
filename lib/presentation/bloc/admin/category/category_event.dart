part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategories({String? search}) = _LoadCategories;
  const factory CategoryEvent.getCategoryDetail(String categoryId) = _GetCategoryDetail;
  const factory CategoryEvent.createCategory(Map<String, dynamic> data) = _CreateCategory;
  const factory CategoryEvent.updateCategory({
    required String categoryId,
    required Map<String, dynamic> data,
  }) = _UpdateCategory;
  const factory CategoryEvent.deleteCategory(String categoryId) = _DeleteCategory;
  const factory CategoryEvent.refreshCategories() = _RefreshCategories;
}