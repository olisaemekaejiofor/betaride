import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/views/uploading_details_screens/upload_profile_pic.dart';

class WelcomePage extends StatelessWidget {
  todo(String text) {
    return Row(children: [
      Container(
        height: 15,
        width: 15,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
            )),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(width: 10.0),
      Text(
        text,
        style: GoogleFonts.notoSans(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          SystemNavigator.pop();
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffFF9411),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome,\nDriver",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "We are really glad to have you here\nand Work with you. We look forward\nto a lasting and trustworthy experience\nfrom you.",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        todo("Upload your Profile Photo"),
                        SizedBox(height: 20),
                        todo("Upload a Photo of your Driver's Licence"),
                        SizedBox(height: 20),
                        todo("Upload a Photo of your Valid Insurance\n Policy"),
                        SizedBox(height: 20),
                        todo("Upload a Photo of your Roadworthiness\n certificate"),
                        SizedBox(height: 20),
                        todo("Upload a Photo of your Vehicle\n Inspection Report"),
                        SizedBox(height: 20),
                        todo("Vehicle details")
                      ],
                    ),
                    Column(children: [
                      Text(
                        "You only get verified after uploading the above requirements",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return UploadProfilePic();
                            }),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 55.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: GoogleFonts.notoSans(
                                fontSize: 25,
                                color: Color(0xffFF9411),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.width * 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/welcomeArt.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
