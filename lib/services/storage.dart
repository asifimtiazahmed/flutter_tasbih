import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  late final SharedPreferences prefs;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void init() async {
    prefs = await _prefs;
  }

  void saveInfo({required String key, required value}) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }
  //TO RETRIEVE DATA, USE value = storage.prefs.getInt(key)...
  //
  // Future<int> getInt({required String key}) async {
  //   int value = 0;
  //   value = (prefs.getInt(key) ?? 0);
  //   return value;
  // }
  //
  // Future<String> getString({required String key}) async {
  //   String value = '';
  //   value = (prefs.getString(key) ?? '');
  //   return value;
  // }
  //
  // Future<List<String>> getListString({required String key}) async {
  //   List<String> value = [];
  //   value = (prefs.getStringList(key) ?? ['']);
  //   return value;
  // }
}
