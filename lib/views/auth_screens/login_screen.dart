import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/forgotten_password.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/auth_screens/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LogInScreenState extends State<LogInScreen> {
  Future login() async {
    var email = emailController.text;
    var password = passwordController.text;
    if (email == "" || password == "") {
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

      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwMmQ0ZGRjMjg0YzBlNmU4NDlkNmUyZCIsInJvbGUiOiJkcml2ZXIiLCJpYXQiOjE2MjI1MzU2MzMsImV4cCI6MTYyMzE0MDQzM30.pcbwA5QQJSmI1sXDdpZXl5dPuWF0hOsGQZjmpF8ACY8',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('POST', Uri.parse('https://mybetaride.herokuapp.com/api/v1/auth/login'));
      request.body = json.encode({"role": "driver", "email": email, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 201) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('pageIndex', 3);
        print(prefs.getInt('pageIndex'));
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.pop(context);
        Flushbar(
          icon: Icon(Icons.error, size: 26, color: Colors.white),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 5),
          message: "Email and Password do not match",
          shouldIconPulse: true,
          backgroundColor: Colors.red[400],
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
        )..show(context);
      }
    }
  }

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
          backgroundColor: Color(0xffFF8C00),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Image.asset(
                  'assets/car2.png',
                  height: MediaQuery.of(context).size.height - 290,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 94.0,
                  left: 23.0,
                  right: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drive Safely!\nWelcome back',
                      style: GoogleFonts.notoSans(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildLoginColumn(
                              label: 'E-mail Address',
                              hintText: 'E-mail Address',
                              controller: emailController,
                              obscure: false,
                              icon: null,
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            buildLoginColumn(
                              label: 'Password',
                              hintText: 'Password',
                              obscure: true,
                              controller: passwordController,
                              icon: Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => ForgottenPasswordScreen()));
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Couldn’t remember password?',
                                  style: GoogleFonts.notoSans(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 100),
                            SCustomLongButton(
                              context,
                              labelColor: Color(0xffFF9411),
                              buttonColor: Colors.white,
                              label: "Login",
                              fun: () {
                                login();
                              },
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Register(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Do not have an account?',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Column buildLoginColumn(
      {String label,
      String hintText,
      Widget icon,
      bool obscure,
      TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          obscureText: obscure,
          controller: controller,
          style: GoogleFonts.notoSans(
            color: Colors.white,
          ),
          decoration: InputDecoration(
              suffixIcon: icon,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              )),
              hintText: hintText,
              hintStyle: GoogleFonts.notoSans(fontSize: 15.0, color: Colors.white)),
        ),
      ],
    );
  }
}
