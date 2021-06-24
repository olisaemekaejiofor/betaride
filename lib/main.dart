import 'package:flutter/material.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/onboard.dart';
import 'package:mybetaride/views/register.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> getRegisteredT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pp = prefs.getString('regKey');
    return pp;
  }

  Future<String> getFinish() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cp = prefs.getString('finKey');
    return cp;
  }

  check() {
    // ignore: unrelated_type_equality_checks
    if (getRegisteredT() == 'registered') {
      return 'welcome';
      // ignore: unrelated_type_equality_checks
    } else if (getRegisteredT() == 'registered' && getFinish() == 'finish') {
      return 'login';
    } else {
      return 'welcome';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyBetaRide',
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : check(),
      routes: {
        'onboard': (context) => OnBoard(),
        'register': (context) => Register(),
        'login': (context) => LogInScreen(),
        'welcome': (context) => WelcomePage(),
      },
    );
  }
}
