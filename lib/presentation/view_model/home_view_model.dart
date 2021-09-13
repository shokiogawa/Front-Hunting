import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel {
  Future<void> saveIsPassT() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setBool("isPassT", true);
  }

  Future<bool> gatIsPassT() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    final bool isPassT = _preferences.getBool("isPassT") ?? false;
    return isPassT;
  }
}
