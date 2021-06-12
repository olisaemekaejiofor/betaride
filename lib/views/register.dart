import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';

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
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25.0, top: 45, bottom: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Form(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DoubleFormField(
                            label_1: "Firstname",
                            label_2: "Lastname",
                            firstController: firstnameController,
                            secondController: lastnameController,
                          ),
                          SingleFormField(
                              label: "Email Address",
                              controller: emailController,
                              obscure: false),
                          SingleFormField(
                              label: "Password",
                              controller: passwordController,
                              obscure: true),
                          FormDropdown(
                            label: "Phone Number",
                          ),
                          DoubleFormField(
                            label_1: "State",
                            label_2: "City",
                            firstController: stateController,
                            secondController: cityController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 55.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffFF9411),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Proceed",
                          style: GoogleFonts.notoSans(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}