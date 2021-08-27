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
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            children: [
              Spacer(),
              Text("Can't connect to internet. Please\n check your network settings!",
                  style: GoogleFonts.notoSans(fontSize: 24.0)),
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
