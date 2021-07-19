import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/Providers/authProvider.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/welcomeScreen.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  var countryCode = ["+234", "+256", "+250", "+254", "+255", "+233", "+20", "+251"];
  String currentValue = "+234";
  var state = ["Lagos", "Abia", "Delta", "Ogun", "Edo", "Enugu", "Osun", "Abuja"];
  String stateValue = "Lagos";
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var register = () {
      if (firstNameController.text != '' ||
          lastNameController.text != '' ||
          phoneController.text != '' ||
          passwordController.text != '' ||
          emailController.text != '' ||
          stateController.text != '') {
        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
          auth
              .register(
            firstNameController.text,
            lastNameController.text,
            emailController.text,
            passwordController.text,
            currentValue,
            phoneController.text,
          )
              .then((response) {
            print(response['status']);
            if (response['status'] == false) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => WelcomePage()));
            } else {
              Navigator.pop(context);
              flushbar(context, "Registration Failed");
            }
          });
        } else {
          flushbar(context, "Please enter a valid email address");
        }
      } else {
        flushbar(context, "All feilds are required");
      }
    };
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
                child: Form(
                  child: Column(
                    children: [
                      doubleFormField(
                        label_1: "Firstname",
                        label_2: "Lastname",
                        width: MediaQuery.of(context).size.width * 0.40,
                        formChild1: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: "FirstName",
                            hintStyle: GoogleFonts.notoSans(
                              color: Color(0xffC78638),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        formChild2: TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: "LastName",
                            hintStyle: GoogleFonts.notoSans(
                              color: Color(0xffC78638),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      singleFormField(
                        label: "Email Address",
                        formChild: TextFormField(
                          controller: emailController,
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
                      singleFormField(
                        label: "Password",
                        formChild: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: GoogleFonts.notoSans(
                              color: Color(0xffC78638),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone number",
                              style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff717171),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      width: MediaQuery.of(context).size.width * 0.17,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Color(0xffFF9411)),
                                          bottom: BorderSide(color: Color(0xffFF9411)),
                                          top: BorderSide(color: Color(0xffFF9411)),
                                        ),
                                      ),
                                      child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        underline: Container(),
                                        value: currentValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            currentValue = newValue;
                                          });
                                        },
                                        items: countryCode.map((val) {
                                          return DropdownMenuItem(
                                            value: val,
                                            child: Text(val),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                      height: 15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffFF9411),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFF7ED),
                                      border: Border(
                                        right: BorderSide(color: Color(0xffFF9411)),
                                        bottom: BorderSide(color: Color(0xffFF9411)),
                                        top: BorderSide(color: Color(0xffFF9411)),
                                      ),
                                    ),
                                    child: TextFormField(
                                      // maxLength: 10,
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      style: GoogleFonts.notoSans(fontSize: 17),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                        border: InputBorder.none,
                                        hintText: "8123456790",
                                        hintStyle: GoogleFonts.notoSans(
                                          color: Color(0xffC78638),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      doubleFormField(
                        label_1: "State",
                        label_2: "City",
                        width: MediaQuery.of(context).size.width * 0.40,
                        formChild1: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffC78638)),
                            underline: Container(),
                            value: stateValue,
                            style: GoogleFonts.notoSans(
                              color: Color(0xffC78638),
                              fontWeight: FontWeight.w300,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                stateValue = newValue;
                              });
                            },
                            items: state.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                          ),
                        ),
                        formChild2: TextFormField(
                          // controller: lastNameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: "City",
                            hintStyle: GoogleFonts.notoSans(
                              color: Color(0xffC78638),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SCustomLongButton(
              context,
              labelColor: Colors.white,
              buttonColor: Color(0xffFF9411),
              label: "Proceed",
              fun: register,
            ),
          ],
        ),
      ),
    );
  }
}
