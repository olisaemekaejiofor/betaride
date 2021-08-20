import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/Providers/authProvider.dart';
import 'package:mybetaride/Providers/userProvider.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/uploading_details_screens/vehicle_details.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MyApp extends StatelessWidget {
  final int routeIndex;
  MyApp({this.routeIndex});
  List<Widget> pages = [LogInScreen(), VehicleDetails(), WelcomePage(), Home(false, true, false)];
  OnlineOffline client = OnlineOffline();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyBetaRide',
        initialRoute: 'route',
        routes: {
          'route': (context) => (routeIndex == null)
              ? LogInScreen()
              : FutureBuilder(
                  future: client.futurecheck(),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.data[1] == true) {
                      return pages[routeIndex];
                    } else {
                      return Scaffold(
                        body: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                  "Can't connect to internet. Please\n check your network settings!",
                                  style: GoogleFonts.notoSans(fontSize: 24.0)),
                              Spacer(),
                              CustomLongButton(context,
                                  label: "Try Again",
                                  labelColor: Colors.white,
                                  buttonColor: Color(0xffFF9411),
                                  screen: MyApp(routeIndex: snapshot.data[0])),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  // child:
                ),
        },
      ),
    );
  }
}
