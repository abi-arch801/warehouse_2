part of 'activity_bloc.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.initial() = _Initial;
  const factory ActivityState.loading() = _Loading;

  /// List activity berhasil — pengganti ActivityLoaded
  const factory ActivityState.loaded({
    required List<StockMovementModel> activities,
    required bool hasMore,
  }) = _Loaded;

  /// Detail satu activity berhasil — pengganti ActivityDetailLoaded
  const factory ActivityState.detailLoaded(StockMovementModel activity) = _DetailLoaded;

  /// Error — pengganti ActivityError
  const factory ActivityState.error(String message) = _Error;
}


