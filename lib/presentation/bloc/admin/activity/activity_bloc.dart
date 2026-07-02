import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/stock_activity_datasource.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';

part 'activity_event.dart';
part 'activity_state.dart';
part 'activity_bloc.freezed.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final _ds = StockActivityDatasource();
  List<StockMovementModel> _items = [];
  int _page = 1;
  String? _filterType;

  ActivityBloc() : super(const ActivityState.initial()) {
    on<_Load>(_onLoad);
    on<_GetDetail>(_onGetDetail);
    on<_Filter>(_onFilter);
    on<_LoadMore>(_onMore);
    on<_Search>(_onSearch);
  }

  Future<void> _onLoad(_Load e, Emitter<ActivityState> emit) async {
    emit(const ActivityState.loading());
    _page = 1;
    _filterType = e.type;
    final r = await _ds.getMovements(
      page: 1,
      type: e.type,
      warehouseId: e.warehouseId,
      productId: e.productId,
      startDate: e.startDate,
      endDate: e.endDate,
    );
    r.fold(
      (err) => emit(ActivityState.error(err)),
      (res) {
        _items = res.data;
        emit(ActivityState.loaded(
          activities: _items,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }

  Future<void> _onGetDetail(_GetDetail e, Emitter<ActivityState> emit) async {
    emit(const ActivityState.loading());
    final r = await _ds.getMovementDetail(e.id);
    r.fold(
      (err) => emit(ActivityState.error(err)),
      (item) => emit(ActivityState.detailLoaded(item)),
    );
  }

  Future<void> _onFilter(_Filter e, Emitter<ActivityState> emit) async {
    emit(const ActivityState.loading());
    _page = 1;
    _filterType = e.type;
    final r = await _ds.getMovements(type: e.type, search: e.search);
    r.fold(
      (err) => emit(ActivityState.error(err)),
      (res) {
        _items = res.data;
        emit(ActivityState.loaded(
          activities: _items,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }

  Future<void> _onMore(_LoadMore e, Emitter<ActivityState> emit) async {
    _page++;
    final r = await _ds.getMovements(page: _page, type: _filterType);
    r.fold(
      (_) => _page--,
      (res) {
        _items = [..._items, ...res.data];
        emit(ActivityState.loaded(
          activities: _items,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }

  Future<void> _onSearch(_Search e, Emitter<ActivityState> emit) async {
    emit(const ActivityState.loading());
    _page = 1;
    final r = await _ds.getMovements(search: e.query);
    r.fold(
      (err) => emit(ActivityState.error(err)),
      (res) {
        _items = res.data;
        emit(ActivityState.loaded(
          activities: _items,
          hasMore: res.meta?.hasNextPage ?? false,
        ));
      },
    );
  }
}






