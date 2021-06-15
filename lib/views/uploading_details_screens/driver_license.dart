import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/uploading_details_screens/insurance_policy.dart';

class UploadDriverLicense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8C00),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 51.0,
          left: 26.0,
          right: 21.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExitButton(context),
            Spacer(),
            Text(
              'Please Upload\nyour Driver’s License',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              'Once you submit your profile picture, it can’t be edited\n'
              'after the Verification process. So please ensure ;',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            buildLicenseRow(
                title: '(a). Show your Whole face and tips of your\nShoulder'),
            buildLicenseRow(title: '(b). No Sunglasses or Hat please'),
            buildLicenseRow(
                title: '(c). Take your photo in a well-lit environment'),
            Spacer(),
            Center(
              child: Container(
                height: 182.0,
                width: 312.0,
                color: Colors.white,
                child: Image.asset('assets/license.png'),
              ),
            ),
            Spacer(),
            CustomLongButton(context,
                label: "Upload",
                buttonColor: Colors.white,
                labelColor: Color(0xffFF8C00)),
            Spacer(),
            NextButton(context, screen: UploadInsurancePolicy()),
            Spacer()
          ],
        ),
      ),
    );
  }
}
