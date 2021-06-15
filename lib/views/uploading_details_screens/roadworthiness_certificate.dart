import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/uploading_details_screens/inspection_report.dart';

class UploadRoadWorthinessCertificate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8C00),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 51.0,
          left: 26.0,
          right: 22.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExitButton(context),
            Spacer(),
            Text(
              'Please Upload your\nRoadworthiness\ncertificate',
              style: TextStyle(
                fontSize: 26.0,
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
            Center(
              child: Container(
                height: 332.0,
                width: 312.0,
                color: Colors.white,
                child: Image.asset('assets/Certificate.png'),
              ),
            ),
            Spacer(),
            CustomLongButton(context,
                label: "Upload",
                buttonColor: Colors.white,
                labelColor: Color(0xffFF8C00)),
            Spacer(),
            NextButton(
              context,
              screen: UploadInspectionReport(),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
