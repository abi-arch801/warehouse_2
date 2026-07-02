import 'dart:convert';

// ─── Login ─────────────────────────────────────────────────────────────────
class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toMap() => {'email': email, 'password': password};

  String toJson() => jsonEncode(toMap());
}

// ─── Register ──────────────────────────────────────────────────────────────
class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };

  String toJson() => jsonEncode(toMap());
}