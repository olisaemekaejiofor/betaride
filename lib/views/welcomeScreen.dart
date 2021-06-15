import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/uploading_details_screens/upload_profile_pic.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFF8C00),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/welcomeArt.png",
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width - 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 87.0,
                right: 25.0,
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,\nDriver',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'We are really glad to have you here\n'
                      'and Work with you. We look forward\n'
                      'to a lasting and trustworthy experience\n'
                      'from you.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    buildIconRow(label: 'Upload your Profile Photo'),
                    buildIconRow(
                        label: 'Upload a Photo of your Driver’s License'),
                    buildIconRow(
                        label: 'Upload a Photo of your Valid Insurance Policy'),
                    buildIconRow(
                        label:
                            'Upload a Photo of your Roadworthiness\ncertificate'),
                    buildIconRow(
                        label:
                            'Upload a Photo of your Vehicle\nInspection Report'),
                    buildIconRow(label: 'Vehicle  Details'),
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      'You only get verified after uploading the above requirements',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    CustomLongButton(context,
                        screen: UploadProfilePic(),
                        label: "Proceed",
                        buttonColor: Colors.white,
                        labelColor: Color(0xffFF8C00)),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
