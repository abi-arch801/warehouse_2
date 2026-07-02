// part of 'opname_bloc.dart';

// @freezed
// class OpnameEvent with _$OpnameEvent {
//   const factory OpnameEvent.load({@Default(1) int page, String? status, int? warehouseId}) = _Load;
//   const factory OpnameEvent.loadDetail(int id)                            = _LoadDetail;
//   const factory OpnameEvent.store(Map<String, dynamic> body)              = _Store;
//   const factory OpnameEvent.start(int id)                                 = _Start;
//   const factory OpnameEvent.complete({required int id,
//     required List<Map<String, dynamic>> items})                           = _Complete;
//   const factory OpnameEvent.approve(int id)                               = _Approve;
//   const factory OpnameEvent.reject({required int id, required String reason}) = _Reject;
// }



part of 'opname_bloc.dart';

@freezed
class OpnameEvent with _$OpnameEvent {
  // List
  const factory OpnameEvent.load({
    @Default(1) int page,
    String? status,
    int? warehouseId,
  }) = _Load;

  // Detail
  const factory OpnameEvent.loadDetail(int id) = _LoadDetail;

  // Buat opname baru
  const factory OpnameEvent.store(Map<String, dynamic> body) = _Store;

  // Mulai opname (draft → in_progress)
  const factory OpnameEvent.start(int id) = _Start;

  // Simpan progress tanpa finalize ← BARU
  const factory OpnameEvent.saveProgress({
    required int id,
    required List<Map<String, dynamic>> items,
  }) = _SaveProgress;

  // Finalize (in_progress → pending_approval)
  const factory OpnameEvent.complete({
    required int id,
    required List<Map<String, dynamic>> items,
  }) = _Complete;

  // Approve (pending_approval → approved)
  const factory OpnameEvent.approve(int id) = _Approve;

  // Reject (pending_approval → in_progress)
  const factory OpnameEvent.reject({
    required int id,
    required String reason,
  }) = _Reject;

  // Load produk untuk scope=manual ← BARU
  const factory OpnameEvent.loadProductsForOpname({
    required int warehouseId,
    String? search,
    int? categoryId,
  }) = _LoadProductsForOpname;
}