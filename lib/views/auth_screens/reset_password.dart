import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 129.0,
          left: 24.0,
          right: 14.0,
        ),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/resetPassword.png',
                    height: 202.0,
                    width: 181.84,
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                'Password reset\nSuccessful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0Xff6C1B4F),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                'Your password has been successfully\n'
                'reset. Please click the button below to\nLog In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0Xff262626),
                ),
              ),
            ),
            Spacer(
              flex: 4,
            ),
            CustomLongButton(context,
                label: 'Log In page',
                labelColor: Colors.white,
                buttonColor: Color(0XffFF9411)),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
