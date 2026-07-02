part of 'activity_bloc.dart';

@freezed
class ActivityEvent with _$ActivityEvent {
  /// Muat semua activity — pengganti LoadActivities()
  const factory ActivityEvent.loadAll({
    String? type,
    int? warehouseId,
    int? productId,
    String? startDate,
    String? endDate,
  }) = _Load;

  /// Load detail satu activity — pengganti GetActivityDetail()
  const factory ActivityEvent.getDetail(int id) = _GetDetail;

  /// Filter by type / search
  const factory ActivityEvent.filter({String? type, String? search}) = _Filter;

  /// Pagination
  const factory ActivityEvent.loadMore() = _LoadMore;

  /// Search
  const factory ActivityEvent.search(String query) = _Search;
}



