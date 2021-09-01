import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/bookAsset 2 3.png", height: 200),
            SizedBox(height: 20),
            Text(
              "Our Wheels are\nunder construction",
              style: GoogleFonts.notoSans(fontSize: 26, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "We are currently working on\nthis page. It will be available to\nyou soon.",
              style: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SCustomLongButton(
              context,
              label: "Okay",
              labelColor: Colors.white,
              buttonColor: Color(0xffFF9411),
              fun: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
