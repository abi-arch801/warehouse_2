// ════════════════════════════════════════════════════════════════
//  admin_request_bloc.dart
//  Endpoints:
//    GET    /api/requests              → indexAdmin (lihat semua)
//    GET    /api/requests/{id}         → showAdmin
//    POST   /api/requests/{id}/approve → approve
//    POST   /api/requests/{id}/reject  → reject
//    POST   /api/requests/{id}/complete→ complete
// ════════════════════════════════════════════════════════════════

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_remote_datasource.dart';

part 'admin_request_event.dart';
part 'admin_request_state.dart';
part 'admin_request_bloc.freezed.dart';

class AdminRequestBloc extends Bloc<AdminRequestEvent, AdminRequestState> {
  final AdminRemoteDatasource _ds;

  // State halaman lokal
  int _currentPage = 1;
  String? _filterStatus;
  List<dynamic> _items = [];
  int _totalItems = 0;
  bool _hasMore = true;

  AdminRequestBloc({AdminRemoteDatasource? datasource})
      : _ds = datasource ?? AdminRemoteDatasource(),
        super(const AdminRequestState.initial()) {
    on<_LoadRequests>(_onLoad);
    on<_LoadMore>(_onLoadMore);
    on<_FilterStatus>(_onFilter);
    on<_ApproveRequest>(_onApprove);
    on<_RejectRequest>(_onReject);
    on<_CompleteRequest>(_onComplete);
    on<_LoadDetail>(_onLoadDetail);
    on<_ApproveFinalRequest>(_onApproveFinal);
  }

  Future<void> _onLoad(
      _LoadRequests event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.loading());
    _currentPage = 1;
    _items = [];
    await _fetchPage(emit, isLoadMore: false);
  }

  Future<void> _onLoadMore(
      _LoadMore event, Emitter<AdminRequestState> emit) async {
    if (!_hasMore) return;
    _currentPage++;
    await _fetchPage(emit, isLoadMore: true);
  }

  Future<void> _onFilter(
      _FilterStatus event, Emitter<AdminRequestState> emit) async {
    _filterStatus = event.status;
    _currentPage = 1;
    _items = [];
    emit(const AdminRequestState.loading());
    await _fetchPage(emit, isLoadMore: false);
  }

  Future<void> _fetchPage(
    Emitter<AdminRequestState> emit, {
    required bool isLoadMore,
  }) async {
    final result = await _ds.getRequests(
      status: _filterStatus,
      page: _currentPage,
      perPage: 15,
    );
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (body) {
        final data = body['data'] as Map<String, dynamic>;
        final newItems = (data['data'] as List?) ?? [];
        _totalItems = (data['total'] ?? 0) as int;
        final lastPage = (data['last_page'] ?? 1) as int;
        _hasMore = _currentPage < lastPage;

        if (isLoadMore) {
          _items = [..._items, ...newItems];
        } else {
          _items = newItems;
        }

        emit(AdminRequestState.loaded(
          items: List.from(_items),
          totalItems: _totalItems,
          hasMore: _hasMore,
          filterStatus: _filterStatus,
        ));
      },
    );
  }

  Future<void> _onLoadDetail(
      _LoadDetail event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.detailLoading());
    final result = await _ds.getRequestDetail(event.requestId);
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (body) => emit(
          AdminRequestState.detailLoaded(body['data'] as Map<String, dynamic>)),
    );
  }

  Future<void> _onApprove(
      _ApproveRequest event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.actionLoading());
    final result = await _ds.approveRequest(event.requestId, event.items);
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (msg) => emit(AdminRequestState.actionSuccess(msg)),
    );
  }

  Future<void> _onApproveFinal(
      _ApproveFinalRequest event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.actionLoading());
    final result = await _ds.approveFinalRequest(
      event.requestId,
      event.warehouseId,
      event.items,
    );
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (msg) => emit(AdminRequestState.actionSuccess(msg)),
    );
  }

  Future<void> _onReject(
      _RejectRequest event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.actionLoading());
    final result = await _ds.rejectRequest(event.requestId, event.rejectReason);
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (msg) => emit(AdminRequestState.actionSuccess(msg)),
    );
  }

  Future<void> _onComplete(
      _CompleteRequest event, Emitter<AdminRequestState> emit) async {
    emit(const AdminRequestState.actionLoading());
    final result = await _ds.completeRequest(event.requestId);
    result.fold(
      (err) => emit(AdminRequestState.error(err)),
      (msg) => emit(AdminRequestState.actionSuccess(msg)),
    );
  }
}
