import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
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
  final formKey = GlobalKey<FormState>();
  String _firstname;
  String _lastname;
  String _email;
  String _password;
  String _phone;
  String _state;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var register = () {
      final form = formKey.currentState;
      if (form.validate()) {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
        form.save();
        auth.register(_firstname, _lastname, _email, _password, _state, _phone).then((response) {
          print(response['status']);
          if (response['status'] != null && true) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return WelcomePage();
              }),
            );
          } else {
            Navigator.pop(context);
            Flushbar(
              icon: Icon(Icons.error, size: 26, color: Colors.white),
              flushbarPosition: FlushbarPosition.TOP,
              duration: Duration(seconds: 5),
              message: "Registration Failed",
              shouldIconPulse: true,
              backgroundColor: Colors.red[400],
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
            )..show(context);
          }
        });
      } else {
        Flushbar(
          icon: Icon(Icons.error, size: 26, color: Colors.white),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 5),
          message: "Fill all the feilds",
          shouldIconPulse: true,
          backgroundColor: Colors.red[400],
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
        )..show(context);
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
                  key: formKey,
                  child: Column(
                    children: [
                      doubleFormField(
                        label_1: "Firstname",
                        label_2: "Lastname",
                        width: MediaQuery.of(context).size.width * 0.40,
                        formChild1: TextFormField(
                          onSaved: (value) => _firstname = value,
                          validator: (value) => value.isEmpty ? '' : null,
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
                          onSaved: (value) => _lastname = value,
                          validator: (value) => value.isEmpty ? '' : null,
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
                          onSaved: (value) => _email = value,
                          validator: (value) => value.isEmpty ? '' : null,
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
                          onSaved: (value) => _password = value,
                          validator: (value) => value.isEmpty ? '' : null,
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
                      formDropdown(
                        label: "Phone Number",
                        formChild: TextFormField(
                          onSaved: (value) => _phone = '0' + value,
                          validator: (value) => value.isEmpty ? '' : null,
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.notoSans(fontSize: 17),
                          decoration: decoration(),
                        ),
                      ),
                      singleFormField(
                        label: "State/City",
                        formChild: TextFormField(
                          onSaved: (value) => _state = value,
                          validator: (value) => value.isEmpty ? '' : null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: "State/City",
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
