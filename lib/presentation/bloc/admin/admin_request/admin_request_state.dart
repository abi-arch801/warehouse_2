part of 'admin_request_bloc.dart';

@freezed
class AdminRequestState with _$AdminRequestState {
  const factory AdminRequestState.initial() = _Initial;
  const factory AdminRequestState.loading() = _Loading;
  const factory AdminRequestState.loaded({
    required List<dynamic> items,
    required int totalItems,
    required bool hasMore,
    String? filterStatus,
  }) = _Loaded;
  const factory AdminRequestState.detailLoading() = _DetailLoading;
  const factory AdminRequestState.detailLoaded(
      Map<String, dynamic> detail) = _DetailLoaded;
  const factory AdminRequestState.actionLoading() = _ActionLoading;
  const factory AdminRequestState.actionSuccess(String message) = _ActionSuccess;
  const factory AdminRequestState.error(String message) = _Error;
}


