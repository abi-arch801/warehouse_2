part of 'admin_dashboard_bloc.dart';

@freezed
class AdminDashboardEvent with _$AdminDashboardEvent {
  const factory AdminDashboardEvent.load() = _Load;
  const factory AdminDashboardEvent.refresh() = _Refresh;
}