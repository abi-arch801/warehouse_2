import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/notification_response_model.dart';

class NotificationDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET /api/notifications
  // Future<Either<String, NotificationListResponseModel>> getNotifications({
  //   bool? isRead,
  //   String? type,
  //   int page = 1,
  // }) async {
  //   try {
  //     final params = <String, String>{'page': '$page'};
  //     if (isRead != null) params['is_read'] = isRead ? '1' : '0';
  //     if (type != null) params['type'] = type;

  //     final url = Uri.parse('${Variables.baseUrl}/api/notifications')
  //         .replace(queryParameters: params);
  //     final response = await http.get(url, headers: await _headers());

  //     if (response.statusCode == 200) {
  //       return Right(NotificationListResponseModel.fromJson(response.body));
  //     } else {
  //       return Left('Gagal memuat notifikasi (${response.statusCode})');
  //     }
  //   } catch (e) {
  //     return Left('Koneksi gagal: $e');
  //   }
  // }

  Future<Either<String, NotificationListResponseModel>> getNotifications({
    bool? isRead,
    String? type,
    int page = 1,
  }) async {
    try {
      final params = <String, String>{'page': '$page'};
      if (isRead != null) params['is_read'] = isRead ? '1' : '0';
      if (type != null) params['type'] = type;

      final url = Uri.parse('${Variables.baseUrl}/api/notifications')
          .replace(queryParameters: params);

      print('>>> [Notification] GET $url'); // ← tambah

      final response = await http.get(url, headers: await _headers());

      print(
          '>>> [Notification] status=${response.statusCode} body=${response.body}'); // ← tambah

      if (response.statusCode == 200) {
        return Right(NotificationListResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memuat notifikasi (${response.statusCode})');
      }
    } catch (e) {
      print('>>> [Notification] ERROR: $e'); // ← tambah
      return Left('Koneksi gagal: $e');
    }
  }

  // GET /api/notifications/unread-count
  Future<Either<String, int>> getUnreadCount() async {
    try {
      final url =
          Uri.parse('${Variables.baseUrl}/api/notifications/unread-count');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        final res = UnreadCountResponseModel.fromJson(response.body);
        return Right(res.unreadCount);
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/notifications/{id}/read
  Future<Either<String, String>> markAsRead(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/notifications/$id/read');
      final response = await http.put(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('Notifikasi ditandai sudah dibaca.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // PUT /api/notifications/read-all
  Future<Either<String, String>> markAllAsRead() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/notifications/read-all');
      final response = await http.put(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('Semua notifikasi ditandai sudah dibaca.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }

  // DELETE /api/notifications/{id}
  Future<Either<String, String>> deleteNotification(int id) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/notifications/$id');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200) {
        return const Right('Notifikasi berhasil dihapus.');
      } else {
        return Left('Gagal (${response.statusCode})');
      }
    } catch (e) {
      return Left('Koneksi gagal: $e');
    }
  }
}
