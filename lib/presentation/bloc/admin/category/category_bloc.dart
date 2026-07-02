import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/category_datasource.dart';
import 'package:warehouse/data/model/response/admin/category_response_model.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryDatasource _datasource;

  CategoryBloc({CategoryDatasource? datasource})
      : _datasource = datasource ?? CategoryDatasource(),
        super(const CategoryState.initial()) {
    on<_LoadCategories>(_onLoadCategories);
    on<_GetCategoryDetail>(_onGetCategoryDetail);
    on<_CreateCategory>(_onCreateCategory);
    on<_UpdateCategory>(_onUpdateCategory);
    on<_DeleteCategory>(_onDeleteCategory);
    on<_RefreshCategories>(_onRefreshCategories);
  }

  Future<void> _onLoadCategories(
    _LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result = await _datasource.getCategories(search: event.search);
    result.fold(
      (err) => emit(CategoryState.error(err)),
      (categories) => emit(CategoryState.loaded(categories)),
    );
  }

  Future<void> _onGetCategoryDetail(
    _GetCategoryDetail event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result = await _datasource.getCategoryDetail(event.categoryId);
    result.fold(
      (err) => emit(CategoryState.error(err)),
      (category) => emit(CategoryState.detailLoaded(category)),
    );
  }

  Future<void> _onCreateCategory(
    _CreateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result = await _datasource.createCategory(event.data);
    result.fold(
      (err) => emit(CategoryState.error(err)),
      (msg) {
        emit(CategoryState.success(msg));
        add(const CategoryEvent.loadCategories());
      },
    );
  }

  Future<void> _onUpdateCategory(
    _UpdateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result =
        await _datasource.updateCategory(event.categoryId, event.data);
    result.fold(
      (err) => emit(CategoryState.error(err)),
      (msg) {
        emit(CategoryState.success(msg));
        add(const CategoryEvent.loadCategories());
      },
    );
  }

  Future<void> _onDeleteCategory(
    _DeleteCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result = await _datasource.deleteCategory(event.categoryId);
    result.fold(
      (err) => emit(CategoryState.error(err)),
      (msg) {
        emit(CategoryState.success(msg));
        add(const CategoryEvent.loadCategories());
      },
    );
  }

  Future<void> _onRefreshCategories(
    _RefreshCategories event,
    Emitter<CategoryState> emit,
  ) async {
    add(const CategoryEvent.loadCategories());
  }
}