import 'package:flutter/material.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/onboard.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveIndex(int index) async {
  if (index == null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pageIndex', 0);
  }
}

getIndex() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int index = prefs.getInt('pageIndex');
  saveIndex(index);
  return index;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int pageIndex = await getIndex();
  runApp(MyApp(routeIndex: pageIndex));
}

class MyApp extends StatelessWidget {
  final int routeIndex;
  MyApp({this.routeIndex});
  List<Widget> pages = [OnBoard(), WelcomePage(), LogInScreen(), Home()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyBetaRide',
      initialRoute: 'route',
      routes: {
        'route': (context) => pages[routeIndex],
      },
    );
  }
}
