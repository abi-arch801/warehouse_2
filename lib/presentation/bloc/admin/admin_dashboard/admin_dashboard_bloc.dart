// ════════════════════════════════════════════════════════════════
//  admin_dashboard_bloc.dart
//  Menggunakan: GET /api/products, /api/stocks/low, /api/requests,
//               /api/purchase-orders, /api/stock-transfers, /api/warehouses
// ════════════════════════════════════════════════════════════════

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/admin/admin_remote_datasource.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';
part 'admin_dashboard_bloc.freezed.dart';

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final AdminRemoteDatasource _ds;

  AdminDashboardBloc({AdminRemoteDatasource? datasource})
      : _ds = datasource ?? AdminRemoteDatasource(),
        super(const AdminDashboardState.initial()) {
    on<_Load>(_onLoad);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onLoad(_Load event, Emitter<AdminDashboardState> emit) async {
    emit(const AdminDashboardState.loading());
    await _fetch(emit);
  }

  Future<void> _onRefresh(
      _Refresh event, Emitter<AdminDashboardState> emit) async {
    // Refresh tanpa loading penuh — tampilkan data lama sambil fetch
    await _fetch(emit);
  }

  Future<void> _fetch(Emitter<AdminDashboardState> emit) async {
    final result = await _ds.getDashboardSummary();
    result.fold(
      (err) => emit(AdminDashboardState.error(err)),
      (summary) => emit(AdminDashboardState.loaded(summary)),
    );
  }
}