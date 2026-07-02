part of 'supplier_bloc.dart';

@freezed
class SupplierEvent with _$SupplierEvent {
  /// Muat semua supplier — dipakai di admin_flow_page dengan SupplierEvent.loadSuppliers()
  const factory SupplierEvent.loadSuppliers() = _LoadSuppliers;
  const factory SupplierEvent.getSupplierDetail(String supplierId) = _GetSupplierDetail;
  const factory SupplierEvent.createSupplier(Map<String, dynamic> data) = _CreateSupplier;
  const factory SupplierEvent.updateSupplier({
    required String supplierId,
    required Map<String, dynamic> data,
  }) = _UpdateSupplier;
  const factory SupplierEvent.deleteSupplier(String supplierId) = _DeleteSupplier;
  const factory SupplierEvent.refreshSuppliers() = _RefreshSuppliers;
}


