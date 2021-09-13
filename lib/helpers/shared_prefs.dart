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
    return firstname;
  }
}

class HomePref {
  Future setHomeSchedule(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("activeSchedule", id);
  }

  Future getHomeSchedule() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var stuff = prefs.getString("activeSchedule");
    print(stuff);
    return stuff;
  }

  void removeSchedule() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("activeSchedule");
  }
}

class VehicleDetailsPref {
  Future setLicense(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('license', path);
  }

  Future setProfilePic(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profilePic', path);
  }

  Future setInsurance(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('insurance', path);
  }

  Future setRoadWorthiness(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('roadWorthiness', path);
  }

  Future setInspectionReport(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('inspectionReport', path);
  }

  Future<String> getLicense() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String license = prefs.getString('license');
    return license;
  }

  Future<String> getProfilePic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String profilePic = prefs.getString('profilePic');
    return profilePic;
  }

  Future<String> getInsurance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String insurance = prefs.getString('insurance');
    return insurance;
  }

  Future<String> getRoadWorthiness() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String roadWorthiness = prefs.getString('roadWorthiness');
    return roadWorthiness;
  }

  Future<String> getInspectionReport() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String inspectionReport = prefs.getString('inspectionReport');
    return inspectionReport;
  }

  Future removeVehicleDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('license');
    prefs.remove('insurance');
    prefs.remove('roadWorthiness');
    prefs.remove('inspectionReport');
    prefs.remove('profilePic');
  }
}
