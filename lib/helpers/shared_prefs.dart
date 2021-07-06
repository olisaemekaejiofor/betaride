import 'package:shared_preferences/shared_preferences.dart';

class ScreenPref {
  Future setScreenPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pageIndex', 1);
  }
}
