import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/reset_password.dart';

class CreateNewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 86.0,
          left: 23.0,
          right: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a new\npassword',
              style: GoogleFonts.notoSans(
                fontSize: 36.0,
                fontWeight: FontWeight.w700,
                color: Color(0Xff6C1B4F),
              ),
            ),
            Spacer(),
            Text(
              'Your new password must be different from\n'
              'the previously used passwords',
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Spacer(),
            SingleFormField(label: "Password", obscure: true),
            SizedBox(
              height: 11.0,
            ),
            Text(
              'It should contain at least 8 charaters',
              style: GoogleFonts.notoSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Color(0Xff828282),
              ),
            ),
            Spacer(),
            SingleFormField(label: "Confirm Password", obscure: true),
            Spacer(
              flex: 5,
            ),
            Text(
              'Please note that the password will now be\n'
              'changed to this new one',
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Spacer(),
            CustomLongButton(context,
                screen: ResetPasswordScreen(),
                label: 'Reset password',
                labelColor: Colors.white,
                buttonColor: Color(0XffFF9411)),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
