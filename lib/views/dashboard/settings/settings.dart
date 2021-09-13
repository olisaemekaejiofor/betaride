import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/dashboard/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ProfileService profile = ProfileService();
  CheckDriver driver = CheckDriver();
  bool showNotification = false;

  void logout() {
    UserPref().removeUser();
    HomePref().removeSchedule();
    ScreenPref().setScreenPref(0);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9E28),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Settings',
            style: GoogleFonts.notoSans(
                fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: homeDrawer(context, profile.getProfile(), driver.check(),
          width: MediaQuery.of(context).size.width * 85, fun: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      }, logout: () {
        UserPref().removeUser();
        HomePref().removeSchedule();
        ScreenPref().setScreenPref(0);
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
      }),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Push Notification',
                  style: GoogleFonts.notoSans(
                      fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                ),
                FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  valueFontSize: 25.0,
                  toggleSize: 25.0,
                  value: showNotification,
                  borderRadius: 20.0,
                  padding: 1.0,
                  inactiveColor: Colors.white,
                  activeColor: Colors.white,
                  toggleColor: Color(0xffFF9E28),
                  inactiveToggleColor: Colors.grey,
                  onToggle: (val) {
                    setState(() {
                      showNotification = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () async {
                if (await canLaunch('https://mybetaride.com')) {
                  await launch('https://mybetaride.com', enableJavaScript: true);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FAQs',
                    style: GoogleFonts.notoSans(
                        fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunch('https://mybetaride.com')) {
                  await launch('https://mybetaride.com', enableJavaScript: true);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms and conditions',
                    style: GoogleFonts.notoSans(
                        fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunch('https://mybetaride.com')) {
                  await launch('https://mybetaride.com', enableJavaScript: true);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy',
                    style: GoogleFonts.notoSans(
                        fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunch('https://mybetaride.com')) {
                  await launch('https://mybetaride.com', enableJavaScript: true);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About us',
                    style: GoogleFonts.notoSans(
                        fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return customAlert(
                    context,
                    logout,
                    title: "Log out?",
                    content: "Are you sure you want to log out?",
                    buttonLabel2: "No, Stay here",
                    buttonLabel: "Yes, logout",
                  );
                },
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log out',
                    style: GoogleFonts.notoSans(
                        fontSize: 18.0, color: Color(0xffffffff), fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
