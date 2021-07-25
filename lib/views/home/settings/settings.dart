import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/profile.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showNotification = false;

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
      drawer: homeDrawer(
          width: MediaQuery.of(context).size.width * 85,
          fun: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          },
          logout: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
            ScreenPref().setScreenPref(0);
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
                  width: 65.0,
                  height: 25.0,
                  valueFontSize: 25.0,
                  toggleSize: 25.0,
                  value: showNotification,
                  borderRadius: 20.0,
                  padding: 1.0,
                  inactiveColor: Colors.white,
                  activeColor: Colors.greenAccent,
                  toggleColor: Color(0xffFF9E28),
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
              onTap: () {
                Navigator.of(context).pushNamed('/faqs');
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
            Row(
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
            SizedBox(
              height: 50,
            ),
            Row(
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
            SizedBox(
              height: 50,
            ),
            Row(
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
            SizedBox(
              height: 50,
            ),
            Row(
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
          ],
        ),
      ),
    );
  }
}
