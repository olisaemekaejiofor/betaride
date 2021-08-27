import 'package:flutter/material.dart';
import 'package:mybetaride/Providers/authProvider.dart';
import 'package:mybetaride/Providers/userProvider.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/onboard.dart';
import 'package:mybetaride/views/uploading_details_screens/vehicle_details.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Providers/internetProvider.dart';

Future saveIndex(int index) async {
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

class MyApp extends StatefulWidget {
  final int routeIndex;
  MyApp({this.routeIndex});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [LogInScreen(), VehicleDetails(), WelcomePage(), Home(true, false)];

  OnlineOffline client = OnlineOffline();
  @override
  void initState() {
    client.futurecheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InternetProvider(),
          child: (widget.routeIndex == null) ? OnBoard() : pages[widget.routeIndex],
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyBetaRide',
        initialRoute: 'route',
        routes: {
          'route': (context) => (widget.routeIndex == null) ? OnBoard() : pages[widget.routeIndex]
        },
      ),
    );
  }
}
