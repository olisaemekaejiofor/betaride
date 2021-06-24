import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  Future register() async {
    var firstName = firstnameController.text;
    var lastName = lastnameController.text;
    var email = emailController.text;
    var phone = phoneController.text;
    var password = passwordController.text;
    var state = stateController.text;

    if (firstName == null ||
        lastName == "" ||
        email == "" ||
        phone == "" ||
        password == "" ||
        state == "") {
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

      var url = "https://mybetaride.herokuapp.com/api/v1/auth/register";
      var response = await http.post(
        Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: json.encode({
          "firstName": firstName,
          "lastName": lastName,
          "password": password,
          "email": email,
          "address": state,
          "phone": "0" + phone,
          "stateOfResidence": state,
          "role": "driver",
        }),
      );
      var body = json.decode(response.body);
      print(body);
      String checkerror() {
        if (body['error'] == "A duplicate field value entered") {
          return "A driver has registered with this email";
        } else {
          return body['error'];
        }
      }

      print(response.statusCode);
      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        final regKey = 'regKey';
        prefs.setString(regKey, 'registered');
        print('saved');
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return WelcomePage();
          }),
        );
        print("Successful");
      } else {
        Navigator.pop(context);
        Flushbar(
          icon: Icon(Icons.error, size: 26, color: Colors.white),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 5),
          message: checkerror(),
          shouldIconPulse: true,
          backgroundColor: Colors.red[400],
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
        )..show(context);
        print("Failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 25.0, top: 45, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set up your driver\naccount",
              style: GoogleFonts.notoSans(
                fontSize: 22,
                color: Color(0xff262626),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DoubleFormField(
                      label_1: "Firstname",
                      label_2: "Lastname",
                      firstController: firstnameController,
                      secondController: lastnameController,
                    ),
                    SingleFormField(
                        label: "Email Address", controller: emailController, obscure: false),
                    SingleFormField(
                        label: "Password", controller: passwordController, obscure: true),
                    FormDropdown(
                      label: "Phone Number",
                      controller: phoneController,
                    ),
                    SingleFormField(
                        label: "State/City", controller: stateController, obscure: false)
                  ],
                ),
              ),
            ),
            SCustomLongButton(
              context,
              labelColor: Colors.white,
              buttonColor: Color(0xffFF9411),
              label: "Proceed",
              fun: () {
                register();
              },
            ),
          ],
        ),
      ),
    );
  }
}
