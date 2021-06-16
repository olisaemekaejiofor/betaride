import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/create_new_password.dart';

class ForgottenPasswordScreen extends StatelessWidget {
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
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C1B4F),
              ),
            ),
            Spacer(),
            BoxTextFormField(
              text: 'E-mail Address',
              hintText: 'E-mail Address',
            ),
            Spacer(
              flex: 5,
            ),
            Text(
              'A link will be sent to the mail provided above.\n'
              'please do check before it expires.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Spacer(),
            CustomLongButton(context,
                screen: CreateNewPassword(),
                label: 'Retrieve',
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
