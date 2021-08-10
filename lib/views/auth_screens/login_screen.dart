import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/Providers/authProvider.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/forgotten_password.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/onboard.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    var login = () {
      showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
      if (emailController.text == '' || passwordController.text == '') {
        Navigator.pop(context);
        flushbar(context, "Please fill all fields");
      } else {
        auth.login(emailController.text, passwordController.text).then((respose) {
          if (respose['status'] == true) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home(false, true, false)));
          } else {
            Navigator.pop(context);
            flushbar(context, "Incorrect Details");
          }
        });
      }
    };

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
                              fun: login,
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  ScreenPref().setScreenPref(1);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => OnBoard(),
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
