// ════════════════════════════════════════════════════════════════
//  admin_product_bloc.dart
//  Endpoints:
//    GET    /api/products          → index
//    GET    /api/products/{id}     → show
//    POST   /api/products          → store
//    PUT    /api/products/{id}     → update
//    DELETE /api/products/{id}     → destroy
// ════════════════════════════════════════════════════════════════

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_remote_datasource.dart';

part 'admin_product_event.dart';
part 'admin_product_state.dart';
part 'admin_product_bloc.freezed.dart';

class AdminProductBloc extends Bloc<AdminProductEvent, AdminProductState> {
  final AdminRemoteDatasource _ds;

  int _currentPage = 1;
  String? _searchQuery;
  int? _filterCategoryId;
  bool _filterLowStock = false;
  List<dynamic> _items = [];
  bool _hasMore = true;

  AdminProductBloc({AdminRemoteDatasource? datasource})
      : _ds = datasource ?? AdminRemoteDatasource(),
        super(const AdminProductState.initial()) {
    on<_LoadProducts>(_onLoad);
    on<_LoadMore>(_onLoadMore);
    on<_Search>(_onSearch);
    on<_FilterCategory>(_onFilterCategory);
    on<_FilterLowStock>(_onFilterLowStock);
    on<_CreateProduct>(_onCreate);
    on<_UpdateProduct>(_onUpdate);
    on<_DeleteProduct>(_onDelete);
  }

  Future<void> _onLoad(
      _LoadProducts event, Emitter<AdminProductState> emit) async {
    emit(const AdminProductState.loading());
    _currentPage = 1;
    _items = [];
    await _fetchPage(emit);
  }

  Future<void> _onLoadMore(
      _LoadMore event, Emitter<AdminProductState> emit) async {
    if (!_hasMore) return;
    _currentPage++;
    await _fetchPage(emit, isLoadMore: true);
  }

  Future<void> _onSearch(
      _Search event, Emitter<AdminProductState> emit) async {
    _searchQuery = event.query.isEmpty ? null : event.query;
    _currentPage = 1;
    _items = [];
    emit(const AdminProductState.loading());
    await _fetchPage(emit);
  }

  Future<void> _onFilterCategory(
      _FilterCategory event, Emitter<AdminProductState> emit) async {
    _filterCategoryId = event.categoryId;
    _currentPage = 1;
    _items = [];
    emit(const AdminProductState.loading());
    await _fetchPage(emit);
  }

  Future<void> _onFilterLowStock(
      _FilterLowStock event, Emitter<AdminProductState> emit) async {
    _filterLowStock = event.value;
    _currentPage = 1;
    _items = [];
    emit(const AdminProductState.loading());
    await _fetchPage(emit);
  }

  Future<void> _fetchPage(
    Emitter<AdminProductState> emit, {
    bool isLoadMore = false,
  }) async {
    final result = await _ds.getProducts(
      search: _searchQuery,
      categoryId: _filterCategoryId,
      lowStock: _filterLowStock ? true : null,
      page: _currentPage,
      perPage: 15,
    );
    result.fold(
      (err) => emit(AdminProductState.error(err)),
      (body) {
        final data = body['data'] as Map<String, dynamic>;
        final newItems = (data['data'] as List?) ?? [];
        final lastPage = (data['last_page'] ?? 1) as int;
        _hasMore = _currentPage < lastPage;

        if (isLoadMore) {
          _items = [..._items, ...newItems];
        } else {
          _items = newItems;
        }

        emit(AdminProductState.loaded(
          items: List.from(_items),
          totalItems: (data['total'] ?? 0) as int,
          hasMore: _hasMore,
        ));
      },
    );
  }

  Future<void> _onCreate(
      _CreateProduct event, Emitter<AdminProductState> emit) async {
    emit(const AdminProductState.actionLoading());
    final result = await _ds.createProduct(event.data);
    result.fold(
      (err) => emit(AdminProductState.error(err)),
      (msg) => emit(AdminProductState.actionSuccess(msg)),
    );
  }

  Future<void> _onUpdate(
      _UpdateProduct event, Emitter<AdminProductState> emit) async {
    emit(const AdminProductState.actionLoading());
    final result = await _ds.updateProduct(event.productId, event.data);
    result.fold(
      (err) => emit(AdminProductState.error(err)),
      (msg) => emit(AdminProductState.actionSuccess(msg)),
    );
  }

  Future<void> _onDelete(
      _DeleteProduct event, Emitter<AdminProductState> emit) async {
    emit(const AdminProductState.actionLoading());
    final result = await _ds.deleteProduct(event.productId);
    result.fold(
      (err) => emit(AdminProductState.error(err)),
      (msg) => emit(AdminProductState.actionSuccess(msg)),
    );
  }
}







