part of 'admin_dashboard_bloc.dart';

@freezed
class AdminDashboardState with _$AdminDashboardState {
  const factory AdminDashboardState.initial() = _Initial;
  const factory AdminDashboardState.loading() = _Loading;
  const factory AdminDashboardState.loaded(AdminDashboardSummary summary) =
      _Loaded;
  const factory AdminDashboardState.error(String message) = _Error;
}