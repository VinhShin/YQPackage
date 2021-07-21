import 'package:shared_preferences/shared_preferences.dart';


class SharedManager {
  late SharedPreferences _sharedPreferences;

  SharedManager() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> putString(String key, String value) async {
    _sharedPreferences.setString(key, value);
  }

  String? getString(String key) => _sharedPreferences.getString(key);

  Future<bool> putInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  Future clear() => _sharedPreferences.clear();
}