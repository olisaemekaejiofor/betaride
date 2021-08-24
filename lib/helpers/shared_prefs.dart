import 'package:mybetaride/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenPref {
  Future setScreenPref(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pageIndex', index);
  }
}

class UserPref {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', user.email);
    prefs.setString('firstname', user.firstName);
    prefs.setString('lastname', user.lastName);
    prefs.setString('token', user.token);

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String email = prefs.getString('email');
    String firstname = prefs.getString('firstname');
    String lastname = prefs.getString('lastname');
    String token = prefs.getString('token');

    return User(
      email: email,
      firstName: firstname,
      lastName: lastname,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('email');
    prefs.remove('firstname');
    prefs.remove('lastname');
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstname = prefs.getString('firstname');
    String lastname = prefs.getString('lastname');
    return firstname + " " + lastname;
  }
}

class HomePref {}
