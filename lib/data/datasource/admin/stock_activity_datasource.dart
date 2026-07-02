// import 'package:dartz/dartz.dart';
// import 'package:warehouse/core/constant/base_http.dart';
// import 'package:warehouse/data/model/response/stock_response_model.dart';

// class StockActivityDatasource extends BaseHttp {
//   // GET /api/stock-movements
//   Future<Either<String, StockMovementListResponse>> getMovements({
//     int page = 1,
//     String? type, // in|out|transfer_in|transfer_out|adjustment
//     int? warehouseId,
//     int? productId,
//     String? startDate,
//     String? endDate,
//     String? search,
//   }) async {
//     final p = <String, String>{'page': '$page'};
//     if (type != null) p['type'] = type;
//     if (warehouseId != null) p['warehouse_id'] = '$warehouseId';
//     if (productId != null) p['product_id'] = '$productId';
//     if (startDate != null) p['start_date'] = startDate;
//     if (endDate != null) p['end_date'] = endDate;
//     if (search != null && search.isNotEmpty) p['search'] = search;
//     return get('/api/stock-movements', StockMovementListResponse.fromJson,
//         params: p);
//   }

//   // GET /api/stock-reports
//   Future<Either<String, dynamic>> getReports({
//     String periodType = 'daily',
//     int? warehouseId,
//     String? startDate,
//     String? endDate,
//   }) async {
//     final p = <String, String>{'period_type': periodType};
//     if (warehouseId != null) p['warehouse_id'] = '$warehouseId';
//     if (startDate != null) p['start_date'] = startDate;
//     if (endDate != null) p['end_date'] = endDate;
//     return get('/api/stock-reports', (b) => b, params: p);
//   }
// }


import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:warehouse/core/constant/base_http.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';

class StockActivityDatasource extends BaseHttp {
  // GET /api/stock-movements
  Future<Either<String, StockMovementListResponse>> getMovements({
    int page = 1,
    String? type, // in|out|transfer_in|transfer_out|adjustment
    int? warehouseId,
    int? productId,
    String? startDate,
    String? endDate,
    String? search,
  }) async {
    final p = <String, String>{'page': '$page'};
    if (type != null) p['type'] = type;
    if (warehouseId != null) p['warehouse_id'] = '$warehouseId';
    if (productId != null) p['product_id'] = '$productId';
    if (startDate != null) p['start_date'] = startDate;
    if (endDate != null) p['end_date'] = endDate;
    if (search != null && search.isNotEmpty) p['search'] = search;
    return get('/api/stock-movements', StockMovementListResponse.fromJson,
        params: p);
  }

  // GET /api/stock-movements/:id
  Future<Either<String, StockMovementModel>> getMovementDetail(int id) async {
    return get(
      '/api/stock-movements/$id',
      (body) {
        final m = jsonDecode(body) as Map<String, dynamic>;
        final data = m['data'] ?? m;
        return StockMovementModel.fromMap(data as Map<String, dynamic>);
      },
    );
  }

  // GET /api/stock-reports
  Future<Either<String, dynamic>> getReports({
    String periodType = 'daily',
    int? warehouseId,
    String? startDate,
    String? endDate,
  }) async {
    final p = <String, String>{'period_type': periodType};
    if (warehouseId != null) p['warehouse_id'] = '$warehouseId';
    if (startDate != null) p['start_date'] = startDate;
    if (endDate != null) p['end_date'] = endDate;
    return get('/api/stock-reports', (b) => b, params: p);
  }
}


