import 'package:shared_preferences/shared_preferences.dart';

class StaticData {
  static setSigned(bool signed) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("signed", signed);
  }

  static Future<bool?> getSigned() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool("signed");
  }
}
