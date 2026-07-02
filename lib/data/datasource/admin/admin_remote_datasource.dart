import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/user_list_response_model.dart';

// ─── Models ringkas untuk response admin ─────────────────────────────────────
class AdminDashboardSummary {
  final int totalProducts;
  final int lowStockCount;
  final int pendingRequests;
  final int pendingPO;
  final int inTransitTransfers;
  final int totalWarehouses;

  AdminDashboardSummary({
    required this.totalProducts,
    required this.lowStockCount,
    required this.pendingRequests,
    required this.pendingPO,
    required this.inTransitTransfers,
    required this.totalWarehouses,
  });
}
// ─────────────────────────────────────────────────────────────────────────────

class AdminRemoteDatasource {
  // ── Header helper ────────────────────────────────────────────────────────
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // ── Dashboard summary (gabung beberapa endpoint) ─────────────────────────
  Future<Either<String, AdminDashboardSummary>> getDashboardSummary() async {
    try {
      final headers = await _headers();
      final base = Variables.baseUrl;

      final results = await Future.wait([
        http.get(Uri.parse('$base/api/products?per_page=1'), headers: headers),
        http.get(Uri.parse('$base/api/stocks/low'), headers: headers),
        http.get(Uri.parse('$base/api/requests?status=pending&per_page=1'),
            headers: headers),
        http.get(
            Uri.parse('$base/api/purchase-orders?status=pending&per_page=1'),
            headers: headers),
        http.get(
            Uri.parse('$base/api/stock-transfers?status=in_transit&per_page=1'),
            headers: headers),
        http.get(Uri.parse('$base/api/warehouses?per_page=1'),
            headers: headers),
      ]);

      int _total(http.Response r, [String key = 'total']) {
        if (r.statusCode != 200) return 0;
        final body = jsonDecode(r.body) as Map<String, dynamic>;
        final data = body['data'];
        if (data is Map) return (data[key] ?? data['total'] ?? 0) as int;
        if (data is List) return data.length;
        return 0;
      }

      // low stock returns array directly
      int lowCount = 0;
      if (results[1].statusCode == 200) {
        final b = jsonDecode(results[1].body) as Map<String, dynamic>;
        final d = b['data'];
        lowCount = d is List ? d.length : 0;
      }

      return Right(AdminDashboardSummary(
        totalProducts: _total(results[0]),
        lowStockCount: lowCount,
        pendingRequests: _total(results[2]),
        pendingPO: _total(results[3]),
        inTransitTransfers: _total(results[4]),
        totalWarehouses: _total(results[5]),
      ));
    } catch (e) {
      return Left('Gagal memuat dashboard: $e');
    }
  }

  // ── REQUESTS ─────────────────────────────────────────────────────────────
  // GET /api/requests  (admin: semua request)
  Future<Either<String, Map<String, dynamic>>> getRequests({
    String? status,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (status != null) 'status': status,
      };
      final uri = Uri.parse(
              '${Variables.baseUrl}/api/admin/requests') // ← tambah admin/
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat request (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // GET /api/requests/{id}
  Future<Either<String, Map<String, dynamic>>> getRequestDetail(int id) async {
    try {
      final res = await http.get(
        Uri.parse(
            '${Variables.baseUrl}/api/admin/requests/$id'), // ← tambah admin/
        headers: await _headers(),
      );
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat detail request (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

// POST /api/admin/requests/{id}/approve → tahap 1: Admin verifikasi (TIDAK potong stok)
Future<Either<String, String>> approveRequest(
  int requestId,
  List<Map<String, dynamic>> items,
) async {
  try {
    final body = jsonEncode({'items': items});
    final res = await http.post(
      Uri.parse('${Variables.baseUrl}/api/admin/requests/$requestId/approve'),
      headers: await _headers(),
      body: body,
    );
    if (res.statusCode == 200) {
      return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
    }
    return Left('Gagal verifikasi (${res.statusCode}): ${res.body}');
  } catch (e) {
    return Left('Error: $e');
  }
}

// POST /api/admin/requests/{id}/approve-final → tahap 2: Super Admin approve final (potong stok)
Future<Either<String, String>> approveFinalRequest(
  int requestId,
  int warehouseId,
  List<Map<String, dynamic>> items,
) async {
  try {
    final body = jsonEncode({
      'warehouse_id': warehouseId,
      'items': items,
    });
    final res = await http.post(
      Uri.parse('${Variables.baseUrl}/api/admin/requests/$requestId/approve-final'),
      headers: await _headers(),
      body: body,
    );
    if (res.statusCode == 200) {
      return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
    }
    return Left('Gagal approve final (${res.statusCode}): ${res.body}');
  } catch (e) {
    return Left('Error: $e');
  }
}
  // POST /api/requests/{id}/reject
  Future<Either<String, String>> rejectRequest(
    int requestId,
    String rejectReason,
  ) async {
    try {
      final res = await http.post(
        Uri.parse(
            '${Variables.baseUrl}/api/admin/requests/$requestId/reject'), // ← tambah admin/
        headers: await _headers(),
        body: jsonEncode({'reject_reason': rejectReason}),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal reject (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // POST /api/requests/{id}/complete
  Future<Either<String, String>> completeRequest(int requestId) async {
    try {
      final res = await http.post(
        Uri.parse(
            '${Variables.baseUrl}/api/admin/requests/$requestId/complete'), // ← tambah admin/
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal complete (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── PRODUCTS ──────────────────────────────────────────────────────────────
  Future<Either<String, Map<String, dynamic>>> getProducts({
    String? search,
    int? categoryId,
    bool? lowStock,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (search != null) 'search': search,
        if (categoryId != null) 'category_id': '$categoryId',
        if (lowStock == true) 'low_stock': '1',
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/products')
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat produk (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, Map<String, dynamic>>> getProductDetail(int id) async {
    try {
      final res = await http.get(
        Uri.parse('${Variables.baseUrl}/api/products/$id'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat detail produk (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> createProduct(
      Map<String, dynamic> data) async {
    try {
      final res = await http.post(
        Uri.parse('${Variables.baseUrl}/api/products'),
        headers: await _headers(),
        body: jsonEncode(data),
      );
      if (res.statusCode == 201) {
        return Right(jsonDecode(res.body)['message'] ?? 'Produk dibuat');
      }
      return Left('Gagal membuat produk (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> updateProduct(
      int id, Map<String, dynamic> data) async {
    try {
      final res = await http.put(
        Uri.parse('${Variables.baseUrl}/api/products/$id'),
        headers: await _headers(),
        body: jsonEncode(data),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal update produk (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> deleteProduct(int id) async {
    try {
      final res = await http.delete(
        Uri.parse('${Variables.baseUrl}/api/products/$id'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal hapus produk (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── WAREHOUSES ────────────────────────────────────────────────────────────
  Future<Either<String, Map<String, dynamic>>> getWarehouses({
    String? search,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (search != null) 'search': search,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/warehouses')
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat gudang (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> createWarehouse(
      Map<String, dynamic> data) async {
    try {
      final res = await http.post(
        Uri.parse('${Variables.baseUrl}/api/warehouses'),
        headers: await _headers(),
        body: jsonEncode(data),
      );
      if (res.statusCode == 201) {
        return Right(jsonDecode(res.body)['message'] ?? 'Gudang dibuat');
      }
      return Left('Gagal membuat gudang (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> updateWarehouse(
      int id, Map<String, dynamic> data) async {
    try {
      final res = await http.put(
        Uri.parse('${Variables.baseUrl}/api/warehouses/$id'),
        headers: await _headers(),
        body: jsonEncode(data),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal update gudang (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> deleteWarehouse(int id) async {
    try {
      final res = await http.delete(
        Uri.parse('${Variables.baseUrl}/api/warehouses/$id'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal hapus gudang (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // // ── USERS (admin: read-only; super_admin: CRUD) ───────────────────────────
  // Future<Either<String, Map<String, dynamic>>> getUsers({
  //   String? role,
  //   String? search,
  //   int page = 1,
  //   int perPage = 15,
  // }) async {
  //   try {
  //     final q = {
  //       'page': '$page',
  //       'per_page': '$perPage',
  //       if (role != null) 'role': role,
  //       if (search != null) 'search': search,
  //     };
  //     final uri = Uri.parse('${Variables.baseUrl}/api/users')
  //         .replace(queryParameters: q);
  //     final res = await http.get(uri, headers: await _headers());
  //     if (res.statusCode == 200) return Right(jsonDecode(res.body));
  //     return Left('Gagal memuat user (${res.statusCode})');
  //   } catch (e) {
  //     return Left('Error: $e');
  //   }
  // }

  Future<Either<String, String>> toggleUserActive(int userId) async {
    try {
      final res = await http.patch(
        Uri.parse('${Variables.baseUrl}/api/users/$userId/toggle-active'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal toggle aktif (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── STOCKS ────────────────────────────────────────────────────────────────
  Future<Either<String, Map<String, dynamic>>> getStocks({
    int? warehouseId,
    String? search,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (warehouseId != null) 'warehouse_id': '$warehouseId',
        if (search != null) 'search': search,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/stocks')
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat stok (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, List<dynamic>>> getLowStocks() async {
    try {
      final res = await http.get(
        Uri.parse('${Variables.baseUrl}/api/stocks/low'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return Right((body['data'] as List?) ?? []);
      }
      return Left('Gagal memuat stok rendah (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── CATEGORIES ────────────────────────────────────────────────────────────
  Future<Either<String, List<dynamic>>> getCategories() async {
    try {
      final res = await http.get(
        Uri.parse('${Variables.baseUrl}/api/categories?per_page=100'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final data = body['data'];
        final list = data is Map ? data['data'] : data;
        return Right((list as List?) ?? []);
      }
      return Left('Gagal memuat kategori (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── STOCK MOVEMENTS ───────────────────────────────────────────────────────
  Future<Either<String, Map<String, dynamic>>> getStockMovements({
    int? warehouseId,
    int? productId,
    String? type,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (warehouseId != null) 'warehouse_id': '$warehouseId',
        if (productId != null) 'product_id': '$productId',
        if (type != null) 'type': type,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/stock-movements')
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat pergerakan stok (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── NOTIFICATIONS (admin) ─────────────────────────────────────────────────
  Future<Either<String, Map<String, dynamic>>> getNotifications({
    int page = 1,
  }) async {
    try {
      final res = await http.get(
        Uri.parse(
            '${Variables.baseUrl}/api/notifications?page=$page&per_page=20'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) return Right(jsonDecode(res.body));
      return Left('Gagal memuat notifikasi (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, int>> getUnreadNotifCount() async {
    try {
      final res = await http.get(
        Uri.parse('${Variables.baseUrl}/api/notifications/unread-count'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        final count = (body['data']?['unread_count'] ?? 0) as int;
        return Right(count);
      }
      return Left('Gagal (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  // ── USERS — ganti yang lama dengan versi typed ────────────────────────────
  Future<Either<String, AdminUserListResponse>> getUsers({
    String? role,
    String? search,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final q = {
        'page': '$page',
        'per_page': '$perPage',
        if (role != null) 'role': role,
        if (search != null) 'search': search,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/users')
          .replace(queryParameters: q);
      final res = await http.get(uri, headers: await _headers());
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        // handle {data: {data: [...]}} atau {data: [...]}
        final raw = body['data'];
        final list = raw is Map ? raw['data'] as List : raw as List;
        return Right(AdminUserListResponse(
          data: list
              .map((e) => AdminUserModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ));
      }
      return Left('Gagal memuat user (${res.statusCode})');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> deleteUser(int userId) async {
    try {
      final res = await http.delete(
        Uri.parse('${Variables.baseUrl}/api/users/$userId'),
        headers: await _headers(),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal hapus user (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> createUser(CreateUserRequestModel req) async {
    try {
      final res = await http.post(
        Uri.parse('${Variables.baseUrl}/api/users'),
        headers: await _headers(),
        body: jsonEncode(req.toJson()),
      );
      if (res.statusCode == 201) {
        return Right(jsonDecode(res.body)['message'] ?? 'User dibuat');
      }
      return Left('Gagal buat user (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> updateUser(
      int userId, UpdateUserRequestModel req) async {
    try {
      final res = await http.put(
        Uri.parse('${Variables.baseUrl}/api/users/$userId'),
        headers: await _headers(),
        body: jsonEncode(req.toJson()),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal update user (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> resetUserPassword(
      int userId, ResetPasswordAdminRequestModel req) async {
    try {
      final res = await http.post(
        Uri.parse('${Variables.baseUrl}/api/users/$userId/reset-password'),
        headers: await _headers(),
        body: jsonEncode(req.toJson()),
      );
      if (res.statusCode == 200) {
        return Right(jsonDecode(res.body)['message'] ?? 'Berhasil');
      }
      return Left('Gagal reset password (${res.statusCode}): ${res.body}');
    } catch (e) {
      return Left('Error: $e');
    }
  }
}






