// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
// import 'package:warehouse/data/datasource/auth/auth_remote_datasource.dart';
// import '../../../data/model/request/auth/auth_request_model.dart';
// import '../../../data/model/response/auth/auth_response_model.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';
// part 'auth_bloc.freezed.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRemoteDatasource _remote = AuthRemoteDatasource();
//   final AuthLocalDatasource _local = AuthLocalDatasource();

//   AuthBloc() : super(const AuthState.initial()) {
//     on<_Started>(_onStarted);
//     on<_Login>(_onLogin);
//     on<_Register>(_onRegister);
//     on<_Logout>((event, emit) async {
//       await AuthLocalDatasource().clearAll(); // ← WAJIB ada ini
//       emit(const AuthState.unauthenticated());
//     });
//     on<_CheckAuth>((event, emit) async {
//       emit(const AuthState.loading());
//       final token = await AuthLocalDatasource().getToken();
//       final user = await AuthLocalDatasource().getUser();
//       if (token != null && user != null) {
//         emit(AuthState.authenticated(user));
//       } else {
//         emit(const AuthState.unauthenticated());
//       }
//     });
//   }

//   Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {
//     await _onCheckAuth(const AuthEvent.checkAuth() as _CheckAuth, emit);
//   }

//   Future<void> _onCheckAuth(_CheckAuth event, Emitter<AuthState> emit) async {
//     final isAuth = await _local.isAuth();
//     if (isAuth) {
//       final user = await _local.getUser();
//       if (user != null) {
//         emit(AuthState.authenticated(user));
//       } else {
//         emit(const AuthState.unauthenticated());
//       }
//     } else {
//       emit(const AuthState.unauthenticated());
//     }
//   }

//   Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
//     emit(const AuthState.loading());
//     final result = await _remote.login(
//       LoginRequestModel(email: event.email, password: event.password),
//     );
//     result.fold(
//       (error) => emit(AuthState.error(error)),
//       (res) async {
//         if (res.success && res.data != null) {
//           // ✅ Simpan token & user ke local storage
//           await _local.saveToken(res.data!.token);
//           await _local.saveUser(res.data!.user);
//           emit(AuthState.authenticated(res.data!.user));
//         } else {
//           emit(AuthState.error(res.message));
//         }
//       },
//     );
//   }

//   Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
//     emit(const AuthState.loading());
//     final result = await _remote.register(
//       RegisterRequestModel(
//         name: event.name,
//         email: event.email,
//         password: event.password,
//         passwordConfirmation: event.passwordConfirmation,
//       ),
//     );
//     result.fold(
//       (error) => emit(AuthState.error(error)),
//       (res) {
//         if (res.success && res.data != null) {
//           emit(AuthState.authenticated(res.data!.user));
//         } else {
//           emit(AuthState.error(res.message));
//         }
//       },
//     );
//   }

//   Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
//     emit(const AuthState.loading());
//     await _remote.logout();
//     emit(const AuthState.unauthenticated());
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/datasource/auth/auth_remote_datasource.dart';
import '../../../data/model/request/auth/auth_request_model.dart';
import '../../../data/model/response/auth/auth_response_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDatasource _remote = AuthRemoteDatasource();
  final AuthLocalDatasource _local = AuthLocalDatasource();

  AuthBloc() : super(const AuthState.initial()) {
    on<_Started>(_onStarted);
    on<_CheckAuth>(_onCheckAuth);
    on<_Login>(_onLogin);
    on<_Register>(_onRegister);
    on<_Logout>(_onLogout);
  }

  Future<void> _onStarted(_Started event, Emitter<AuthState> emit) async {
    await _onCheckAuth(const AuthEvent.checkAuth() as _CheckAuth, emit);
  }

  Future<void> _onCheckAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    debugPrint('>>> [AuthBloc] checkAuth start');
    emit(const AuthState.loading());
    final token = await _local.getToken();
    final user = await _local.getUser();
    debugPrint('>>> [AuthBloc] checkAuth token=$token user=$user');
    if (token != null && user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    debugPrint('>>> [AuthBloc] login start email=${event.email}');
    emit(const AuthState.loading());

    final result = await _remote.login(
      LoginRequestModel(email: event.email, password: event.password),
    );

    debugPrint('>>> [AuthBloc] login result isRight=${result.isRight()}');

    if (result.isLeft()) {
      final error = result.fold((l) => l, (r) => 'Unknown error');
      debugPrint('>>> [AuthBloc] login error=$error');
      emit(AuthState.error(error));
      return;
    }

    final res = result.getOrElse(() => throw Exception('impossible'));
    debugPrint('>>> [AuthBloc] login res.success=${res.success} res.data=${res.data}');

    if (res.success && res.data != null) {
      // ✅ saveAuthData sudah dilakukan di datasource, tidak perlu ulang di sini
      emit(AuthState.authenticated(res.data!.user));
    } else {
      emit(AuthState.error(res.message));
    }
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    debugPrint('>>> [AuthBloc] register start');
    emit(const AuthState.loading());

    final result = await _remote.register(
      RegisterRequestModel(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      ),
    );

    if (result.isLeft()) {
      final error = result.fold((l) => l, (r) => 'Unknown error');
      emit(AuthState.error(error));
      return;
    }

    final res = result.getOrElse(() => throw Exception('impossible'));
    if (res.success && res.data != null) {
      emit(AuthState.authenticated(res.data!.user));
    } else {
      emit(AuthState.error(res.message));
    }
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    debugPrint('>>> [AuthBloc] logout start');
    emit(const AuthState.loading());
    await _remote.logout();
    await _local.clearAll();
    emit(const AuthState.unauthenticated());
  }
}