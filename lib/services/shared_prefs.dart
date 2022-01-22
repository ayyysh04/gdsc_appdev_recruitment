import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  // Is Login prefrences
  bool get isLogin => _sharedPrefs?.getBool(_isLoginKey) ?? false;

  set isLogin(bool value) {
    _sharedPrefs?.setBool(_isLoginKey, value);
  }

  final String _isLoginKey = "isLogin";
}
