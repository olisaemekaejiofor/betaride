import 'package:shared_preferences/shared_preferences.dart';

class ScreenPref {
  Future setScreenPref(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pageIndex', index);
  }
}

class UserPref {}
