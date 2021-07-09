import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/register.dart';

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 60,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Become a Driver with\nEase and more cash",
                style: GoogleFonts.notoSans(
                  fontSize: 26,
                  color: Color(0xff6C1B4F),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Image.asset(
                "assets/onboard.png",
                width: double.infinity,
                filterQuality: FilterQuality.high,
              ),
              Spacer(),
              SecCustomLongButton(
                context,
                labelColor: Colors.white,
                buttonColor: Color(0xffFF9411),
                label: "Get Registered!",
                screen: Register(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
