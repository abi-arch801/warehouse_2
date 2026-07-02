import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse/data/model/response/auth/auth_response_model.dart';

class AuthLocalDatasource {
  static const _key = 'auth_data';

  Future<void> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_key, data.toRawJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_key);
  }

  Future<AuthResponseModel?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString(_key);
    if (data != null) return AuthResponseModel.fromRawJson(data);
    return null;
  }

  Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_key) != null;
  }

  Future<String?> getToken() async {
    final authData = await getAuthData();
    return authData?.token;
  }

  Future<UserModel?> getUser() async {
    final authData = await getAuthData();
    return authData?.user;
  }

  Future<String?> getRole() async {
    final user = await getUser();
    return user?.role;
  }

  Future<void> clearAll() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_key);
  }
}
