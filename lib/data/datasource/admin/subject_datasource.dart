import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/response/admin/subject_response_model.dart';

class SubjectDatasource {
  Future<Map<String, String>> _headers() async {
    final token = await AuthLocalDatasource().getToken();
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Either<String, List<SubjectModel>>> getSubjects() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/subjects');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List data = body['data'] ?? body;
        return Right(
          data.map((e) => SubjectModel.fromMap(e as Map<String, dynamic>)).toList(),
        );
      }
      return Left('Gagal memuat subject: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SubjectModel>> getSubjectDetail(String subjectId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/subjects/$subjectId');
      final response = await http.get(url, headers: await _headers());

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return Right(
          SubjectModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal memuat detail subject: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SubjectModel>> createSubject(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/subjects');
      final response = await http.post(
        url,
        headers: await _headers(),
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        return Right(
          SubjectModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal membuat subject: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, SubjectModel>> updateSubject(
    String subjectId,
    Map<String, dynamic> data,
  ) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/subjects/$subjectId');
      final response = await http.put(
        url,
        headers: await _headers(),
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return Right(
          SubjectModel.fromMap((body['data'] ?? body) as Map<String, dynamic>),
        );
      }
      return Left('Gagal mengupdate subject: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> deleteSubject(String subjectId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/subjects/$subjectId');
      final response = await http.delete(url, headers: await _headers());

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right('Subject berhasil dihapus');
      }
      return Left('Gagal menghapus subject: ${response.statusCode}');
    } catch (e) {
      return Left('Error: $e');
    }
  }
}