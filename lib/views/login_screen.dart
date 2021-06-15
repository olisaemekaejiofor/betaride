import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  buildLoginColumn(
                    label: 'E-mail Address',
                    hintText: 'E-mail Address',
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
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Couldn’t remember password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => null,
                        ),
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
                          "Log In",
                          style: GoogleFonts.notoSans(
                            fontSize: 18,
                            color: Color(0xffFF8C00),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      'Do not have an account?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ));
  }

  Column buildLoginColumn(
      {String label, String hintText, Widget icon, bool obscure}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
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
              hintStyle: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
      ],
    );
  }
}
