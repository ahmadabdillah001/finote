import 'package:finote/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<void> saveSession(String accessToken) async {
    final prev = await SharedPreferences.getInstance();
    await prev.setString(AppConstant.tokenKey, accessToken);
  }

  Future<String> getAccessToken() async {
    final prev = await SharedPreferences.getInstance();
    return prev.getString(AppConstant.tokenKey) ?? '';
  }

  Future<void> removeSession() async {
    final prev = await SharedPreferences.getInstance();
    await prev.remove(AppConstant.tokenKey);
  }
}