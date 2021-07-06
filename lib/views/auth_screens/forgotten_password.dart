import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mybetaride/views/auth_screens/create_new_password.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  @override
  _ForgottenPasswordScreenState createState() => _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  TextEditingController mail = TextEditingController();

  Future retrieve() async {
    if (mail.text == "") {
      Flushbar(
        icon: Icon(Icons.error, size: 26, color: Colors.white),
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 5),
        message: "Please fill all the fields",
        shouldIconPulse: true,
        backgroundColor: Colors.red[400],
        borderRadius: BorderRadius.circular(10),
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
      )..show(context);
    } else {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('https://mybetaride.herokuapp.com/api/v1/auth/forgotpassword'));
      request.body = json.encode({"role": "driver", "email": mail.text});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              "A link to reset your password has been sent to your email address",
              style: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return CreateNewPassword();
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("RESET PASSWORD",
                      style: GoogleFonts.notoSans(
                          fontSize: 17.0, fontWeight: FontWeight.w500, color: Color(0XffFF9411))),
                ),
              )
            ],
          ),
        );

        // print(await response.stream.bytesToString());
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              "Email is not registered on our servers\nPlease enter a registered email",
              style: GoogleFonts.notoSans(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("OK",
                      style: GoogleFonts.notoSans(
                          fontSize: 16.0, fontWeight: FontWeight.w400, color: Color(0XffFF9411))),
                ),
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 51.0,
          left: 23.0,
          right: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExitButton(
              context,
              color: Colors.black,
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'Forgot\nPassword?',
              style: GoogleFonts.notoSans(
                fontSize: 36.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C1B4F),
              ),
            ),
            Spacer(),
            singleFormField(
              label: "Password",
              formChild: TextFormField(
                controller: mail,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: "Email Address",
                  hintStyle: GoogleFonts.notoSans(
                    color: Color(0xffC78638),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Text(
              'A link will be sent to the mail provided above.\n'
              'please do check before it expires.',
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Spacer(),
            SCustomLongButton(context, fun: () {
              retrieve();
            }, label: 'Retrieve', labelColor: Colors.white, buttonColor: Color(0XffFF9411)),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
