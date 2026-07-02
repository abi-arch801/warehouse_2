import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:warehouse/core/constant/base_http.dart';
import 'package:warehouse/data/model/response/po_response_model.dart';
import '../../model/response/auth/auth_response_model.dart';

class PurchaseOrderDatasource extends BaseHttp {
  // GET /api/purchase-orders
  Future<Either<String, PurchaseOrderListResponse>> getAll({
    int page = 1,
    String? status,
    int? supplierId,
    int? warehouseId,
    String? startDate,
    String? endDate,
  }) async {
    final p = <String, String>{'page': '$page'};
    if (status != null) p['status'] = status;
    if (supplierId != null) p['supplier_id'] = '$supplierId';
    if (warehouseId != null) p['warehouse_id'] = '$warehouseId';
    if (startDate != null) p['start_date'] = startDate;
    if (endDate != null) p['end_date'] = endDate;
    return get('/api/purchase-orders', PurchaseOrderListResponse.fromJson,
        params: p);
  }

  // GET /api/purchase-orders/{id}
  Future<Either<String, PurchaseOrderSingleResponse>> getDetail(int id) =>
      get('/api/purchase-orders/$id', PurchaseOrderSingleResponse.fromJson);

  // POST /api/purchase-orders
  Future<Either<String, PurchaseOrderSingleResponse>> store(
          Map<String, dynamic> body) =>
      post('/api/purchase-orders', PurchaseOrderSingleResponse.fromJson,
          body: jsonEncode(body));

  // PUT /api/purchase-orders/{id}
  Future<Either<String, PurchaseOrderSingleResponse>> update(
          int id, Map<String, dynamic> body) =>
      put('/api/purchase-orders/$id', PurchaseOrderSingleResponse.fromJson,
          body: jsonEncode(body));

  // POST /api/purchase-orders/{id}/approve
  Future<Either<String, PurchaseOrderSingleResponse>> approve(int id) => post(
      '/api/purchase-orders/$id/approve', PurchaseOrderSingleResponse.fromJson);

  // POST /api/purchase-orders/{id}/receive
  Future<Either<String, PurchaseOrderSingleResponse>> receive(
          int id, List<Map<String, dynamic>> items) =>
      post('/api/purchase-orders/$id/receive',
          PurchaseOrderSingleResponse.fromJson,
          body: jsonEncode({'items': items}));

  // DELETE /api/purchase-orders/{id}
  Future<Either<String, String>> destroy(int id) => delete(
      '/api/purchase-orders/$id',
      (b) => MessageResponseModel.fromJson(b).message);
}
