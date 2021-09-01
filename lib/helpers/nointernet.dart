import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if (Navigator.canPop(context)) {
          SystemNavigator.pop();
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Image.asset("assets/Offline image.png"),
              ),
              Text(
                "You are offline",
                style: GoogleFonts.notoSans(fontSize: 24.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "It's not your fault the signal is out.\nTo get back, please check your\ninternet connections",
                style: GoogleFonts.notoSans(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              // CustomLongButton(context,
              //     label: "Try Again",
              //     labelColor: Colors.white,
              //     buttonColor: Color(0xffFF9411),
              //     screen: MyApp(routeIndex: snapshot.data[0])),
            ],
          ),
        ),
      ),
    );
  }
}
