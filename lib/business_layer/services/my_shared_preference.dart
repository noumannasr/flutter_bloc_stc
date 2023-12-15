import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static SharedPreferences? _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setIsLoggedIn(bool onBoardCount) async {
    return await _preferences!.setBool('isLoggedIn', onBoardCount);
  }

  static bool getIsLoggedIn() {
    return _preferences!.getBool('isLoggedIn') ?? false;
  }
}
