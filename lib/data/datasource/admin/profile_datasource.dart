// lib/data/datasource/admin/profile_datasource.dart

import 'package:dartz/dartz.dart';
import 'package:warehouse/data/model/response/profile_response_model.dart';

// ─────────────────────────────────────────────────────────────
// Abstract Contract
// ─────────────────────────────────────────────────────────────

abstract class ProfileDataSource {
  Future<Either<String, AdminProfile>> fetchCurrent();

  Future<Either<String, AdminProfile>> update(
    AdminProfile profile,
  );

  Future<Either<String, AdminProfile>> setNotifications(
    String userId,
    bool enabled,
  );

  Future<Either<String, AdminProfile>> setDarkMode(
    String userId,
    bool enabled,
  );

  Future<Either<String, Unit>> changePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<String, AdminProfile>> uploadAvatar(
    String userId,
    List<int> bytes,
    String ext,
  );

  Future<Either<String, Unit>> signOut(
    String userId,
  );
}

// ─────────────────────────────────────────────────────────────
// Mock Implementation
// ─────────────────────────────────────────────────────────────

class MockProfileDataSource implements ProfileDataSource {
  AdminProfile _current = _defaultProfile;

  Future<void> _delay() async {
    await Future.delayed(
      const Duration(milliseconds: 350),
    );
  }

  @override
  Future<Either<String, AdminProfile>> fetchCurrent() async {
    try {
      await _delay();

      return Right(_current);
    } catch (e) {
      return Left(
        'Gagal memuat profil: $e',
      );
    }
  }

  @override
  Future<Either<String, AdminProfile>> update(
    AdminProfile profile,
  ) async {
    try {
      await _delay();

      _current = profile.copyWith(
        id: _current.id,
      );

      return Right(_current);
    } catch (e) {
      return Left(
        'Gagal memperbarui profil: $e',
      );
    }
  }

  @override
  Future<Either<String, AdminProfile>> setNotifications(
    String userId,
    bool enabled,
  ) async {
    try {
      await _delay();

      _current = _current.copyWith(
        notificationsEnabled: enabled,
      );

      return Right(_current);
    } catch (e) {
      return Left(
        'Gagal mengubah notifikasi: $e',
      );
    }
  }

  @override
  Future<Either<String, AdminProfile>> setDarkMode(
    String userId,
    bool enabled,
  ) async {
    try {
      await _delay();

      _current = _current.copyWith(
        darkModeEnabled: enabled,
      );

      return Right(_current);
    } catch (e) {
      return Left(
        'Gagal mengubah mode tampilan: $e',
      );
    }
  }

  @override
  Future<Either<String, Unit>> changePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _delay();

      if (currentPassword != 'admin123') {
        return const Left(
          'Password lama salah',
        );
      }

      return const Right(unit);
    } catch (e) {
      return Left(
        'Gagal mengubah password: $e',
      );
    }
  }

  @override
  Future<Either<String, AdminProfile>> uploadAvatar(
    String userId,
    List<int> bytes,
    String ext,
  ) async {
    try {
      await _delay();

      final avatarUrl =
          'https://cdn.example.com/avatars/$userId.$ext';

      _current = _current.copyWith(
        avatarUrl: avatarUrl,
      );

      return Right(_current);
    } catch (e) {
      return Left(
        'Gagal upload avatar: $e',
      );
    }
  }

  @override
  Future<Either<String, Unit>> signOut(
    String userId,
  ) async {
    try {
      await _delay();

      return const Right(unit);
    } catch (e) {
      return Left(
        'Gagal logout: $e',
      );
    }
  }
}

// ─────────────────────────────────────────────────────────────
// Default Profile
// ─────────────────────────────────────────────────────────────

final AdminProfile _defaultProfile = AdminProfile(
  id: 'USR001',
  name: 'Budi Santoso',
  email: 'budi.santoso@warehouse.id',
  phone: '0812-3456-7890',
  role: AdminRole.superAdmin,
  warehouseId: 'WH001',
  warehouseName: 'Gudang Utama Jakarta',
  joinedAt: DateTime(
    2022,
    3,
    15,
  ),
  notificationsEnabled: true,
  darkModeEnabled: false,
  avatarUrl: null,
);