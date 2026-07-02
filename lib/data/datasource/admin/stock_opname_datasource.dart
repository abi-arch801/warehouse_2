// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:warehouse/core/constant/base_http.dart';
// import 'package:warehouse/data/model/response/stock_response_model.dart';
// import '../../model/response/auth/auth_response_model.dart';

// class StockOpnameDatasource extends BaseHttp {
//   // ✅ Wrapper dengan debug print
//   Future<Either<String, StockOpnameListResponse>> getAll({
//     int page = 1,
//     String? status,
//     int? warehouseId,
//   }) async {
//     final p = <String, String>{'page': '$page'};
//     if (status != null) p['status'] = status;
//     if (warehouseId != null) p['warehouse_id'] = '$warehouseId';

//     try {
//       final result = await get(
//         '/api/stock-opnames',
//         (json) {
//           debugPrint('>>> [Opname] raw json = $json'); // ✅ debug di sini
//           return StockOpnameListResponse.fromJson(json);
//         },
//         params: p,
//       );
//       return result;
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] getAll error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }

//   // GET /api/stock-opnames/{id}
//   Future<Either<String, StockOpnameSingleResponse>> getDetail(int id) async {
//     try {
//       return await get(
//         '/api/stock-opnames/$id',
//         (json) {
//           debugPrint('>>> [Opname] detail json = $json');
//           return StockOpnameSingleResponse.fromJson(json);
//         },
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] getDetail error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }

//   // POST /api/stock-opnames
//   Future<Either<String, StockOpnameSingleResponse>> store(
//       Map<String, dynamic> body) async {
//     try {
//       return await post(
//         '/api/stock-opnames',
//         (json) {
//           debugPrint('>>> [Opname] store json = $json');
//           return StockOpnameSingleResponse.fromJson(json);
//         },
//         body: jsonEncode(body),
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] store error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }

//   // POST /api/stock-opnames/{id}/start
//   Future<Either<String, StockOpnameSingleResponse>> start(int id) async {
//     try {
//       return await post(
//         '/api/stock-opnames/$id/start',
//         (json) {
//           debugPrint('>>> [Opname] start json = $json');
//           return StockOpnameSingleResponse.fromJson(json);
//         },
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] start error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }

//   // POST /api/stock-opnames/{id}/complete
//   Future<Either<String, StockOpnameSingleResponse>> complete(
//       int id, List<Map<String, dynamic>> items) async {
//     // ✅ Hapus 'difference' dari setiap item sebelum kirim
//     final cleanItems = items.map((item) {
//       final copy = Map<String, dynamic>.from(item);
//       copy.remove('difference'); // ← database hitung sendiri
//       return copy;
//     }).toList();

//     try {
//       return await post(
//         '/api/stock-opnames/$id/complete',
//         (json) => StockOpnameSingleResponse.fromJson(json),
//         body: jsonEncode({'items': cleanItems}),
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] complete error: $e\n$stack');
//       return Left('Gagal: $e');
//     }
//   }

//   // POST /api/stock-opnames/{id}/approve
//   Future<Either<String, StockOpnameSingleResponse>> approve(int id) async {
//     try {
//       return await post(
//         '/api/stock-opnames/$id/approve',
//         (json) {
//           debugPrint('>>> [Opname] approve json = $json');
//           return StockOpnameSingleResponse.fromJson(json);
//         },
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] approve error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }

//   // POST /api/stock-opnames/{id}/reject
//   Future<Either<String, StockOpnameSingleResponse>> reject(
//       int id, String reason) async {
//     try {
//       return await post(
//         '/api/stock-opnames/$id/reject',
//         (json) {
//           debugPrint('>>> [Opname] reject json = $json');
//           return StockOpnameSingleResponse.fromJson(json);
//         },
//         body: jsonEncode({'reject_reason': reason}),
//       );
//     } catch (e, stack) {
//       debugPrint('>>> [Opname] reject error: $e');
//       debugPrint('>>> [Opname] stack: $stack');
//       return Left('Gagal parse response: $e');
//     }
//   }
// }



////code 2206
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/core/constant/base_http.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';

class StockOpnameDatasource extends BaseHttp {
  // GET /api/stock-opnames
  Future<Either<String, StockOpnameListResponse>> getAll({
    int page = 1,
    String? status,
    int? warehouseId,
  }) async {
    final p = <String, String>{'page': '$page'};
    if (status != null) p['status'] = status;
    if (warehouseId != null) p['warehouse_id'] = '$warehouseId';

    try {
      return await get(
        '/api/stock-opnames',
        (json) => StockOpnameListResponse.fromJson(json),
        params: p,
      );
    } catch (e) {
      debugPrint('>>> [Opname] getAll error: $e');
      return Left('Gagal memuat daftar opname: $e');
    }
  }

  // GET /api/stock-opnames/{id}
  Future<Either<String, StockOpnameSingleResponse>> getDetail(int id) async {
    try {
      return await get(
        '/api/stock-opnames/$id',
        (json) => StockOpnameSingleResponse.fromJson(json),
      );
    } catch (e) {
      debugPrint('>>> [Opname] getDetail error: $e');
      return Left('Gagal memuat detail opname: $e');
    }
  }

  // POST /api/stock-opnames
  Future<Either<String, StockOpnameSingleResponse>> store(
      Map<String, dynamic> body) async {
    try {
      return await post(
        '/api/stock-opnames',
        (json) => StockOpnameSingleResponse.fromJson(json),
        body: jsonEncode(body),
      );
    } catch (e) {
      debugPrint('>>> [Opname] store error: $e');
      return Left('Gagal membuat opname: $e');
    }
  }

  // POST /api/stock-opnames/{id}/start
  Future<Either<String, StockOpnameSingleResponse>> start(int id) async {
    try {
      return await post(
        '/api/stock-opnames/$id/start',
        (json) => StockOpnameSingleResponse.fromJson(json),
      );
    } catch (e) {
      debugPrint('>>> [Opname] start error: $e');
      return Left('Gagal memulai opname: $e');
    }
  }

  // PATCH /api/stock-opnames/{id}/save-progress  ← BARU
  // Simpan progress tanpa finalize, bisa dipanggil berkali-kali
  Future<Either<String, StockOpnameSingleResponse>> saveProgress(
    int id,
    List<Map<String, dynamic>> items,
  ) async {
    try {
      return await patch(
        '/api/stock-opnames/$id/save-progress',
        (json) => StockOpnameSingleResponse.fromJson(json),
        body: jsonEncode({'items': items}),
      );
    } catch (e) {
      debugPrint('>>> [Opname] saveProgress error: $e');
      return Left('Gagal menyimpan progress: $e');
    }
  }

  // POST /api/stock-opnames/{id}/complete
  Future<Either<String, StockOpnameSingleResponse>> complete(
    int id,
    List<Map<String, dynamic>> items,
  ) async {
    try {
      return await post(
        '/api/stock-opnames/$id/complete',
        (json) => StockOpnameSingleResponse.fromJson(json),
        body: jsonEncode({'items': items}),
      );
    } catch (e) {
      debugPrint('>>> [Opname] complete error: $e');
      return Left('Gagal menyelesaikan opname: $e');
    }
  }

  // POST /api/stock-opnames/{id}/approve
  Future<Either<String, StockOpnameSingleResponse>> approve(int id) async {
    try {
      return await post(
        '/api/stock-opnames/$id/approve',
        (json) => StockOpnameSingleResponse.fromJson(json),
      );
    } catch (e) {
      debugPrint('>>> [Opname] approve error: $e');
      return Left('Gagal menyetujui opname: $e');
    }
  }

  // POST /api/stock-opnames/{id}/reject
  Future<Either<String, StockOpnameSingleResponse>> reject(
      int id, String reason) async {
    try {
      return await post(
        '/api/stock-opnames/$id/reject',
        (json) => StockOpnameSingleResponse.fromJson(json),
        body: jsonEncode({'reject_reason': reason}),
      );
    } catch (e) {
      debugPrint('>>> [Opname] reject error: $e');
      return Left('Gagal menolak opname: $e');
    }
  }

  // GET /api/products-for-opname?warehouse_id=&search=&category_id=  ← BARU
  Future<Either<String, ProductForOpnameListResponse>> getProductsForOpname({
    required int warehouseId,
    String? search,
    int? categoryId,
  }) async {
    final p = <String, String>{'warehouse_id': '$warehouseId'};
    if (search != null && search.isNotEmpty) p['search'] = search;
    if (categoryId != null) p['category_id'] = '$categoryId';

    try {
      return await get(
        '/api/products-for-opname',
        (json) => ProductForOpnameListResponse.fromJson(json),
        params: p,
      );
    } catch (e) {
      debugPrint('>>> [Opname] getProductsForOpname error: $e');
      return Left('Gagal memuat produk: $e');
    }
  }
}

