import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';

import 'driver_license.dart';

class UploadProfilePic extends StatefulWidget {
  @override
  _UploadProfilePicState createState() => _UploadProfilePicState();
}

class _UploadProfilePicState extends State<UploadProfilePic> {
  todo(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
            ),
            color: Colors.white70,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          text,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9411),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Please Upload\nyour Profile Picture",
                style: GoogleFonts.notoSans(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Once you submit your profile picture it cant be edited after the validation process. So please ensure;",
              style: GoogleFonts.notoSans(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Spacer(flex: 2),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/man.png"),
                  ),
                ),
                Positioned(
                  left: 220,
                  top: 145,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white),
                        left: BorderSide(color: Colors.white),
                        right: BorderSide(color: Colors.white),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xffFF9411),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            todo("Show your whole face and tips of your   \nshoulder   "),
            SizedBox(height: 10),
            todo("No sunglasses or hats please                    "),
            SizedBox(height: 10),
            todo("Take your photo in a well-lit enviroment "),
            SizedBox(height: 10),
            Spacer(flex: 2),
            CustomLongButton(
              context,
              label: "Upload",
              labelColor: Color(0xffFF9411),
              buttonColor: Colors.white,
            ),
            Spacer(),
            NextButton(context, screen: UploadDriverLicense()),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
