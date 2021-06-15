import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybetaride/helpers/build_checkbox.dart';
import 'package:mybetaride/helpers/model.dart';
import 'package:mybetaride/helpers/widgets.dart';

import 'driver_license.dart';

class UploadProfilePic extends StatefulWidget {
  @override
  _UploadProfilePicState createState() => _UploadProfilePicState();
}

class _UploadProfilePicState extends State<UploadProfilePic> {
  List<CheckBoxState> notifications = <CheckBoxState>[];

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      notifications.addAll({
        CheckBoxState(title: 'Show your Whole face and tips of your\nShoulder'),
        CheckBoxState(title: 'No Sunglasses or Hat please'),
        CheckBoxState(title: 'Take your photo in a well-lit environment')
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffFF8C00),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 27.0,
          right: 27.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 10,
            ),
            ExitButton(context),
            Spacer(
              flex: 2,
            ),
            Text(
              'Please Upload \nyour Profile Picture',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 2,
            ),
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
              child: Stack(
                children: [
                  Container(
                    height: 228.0,
                    width: 228.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 10.0, right: 10.0),
                        child: Container(
                          height: 53.0,
                          width: 53.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFF8C00),
                              border: Border.all(color: Colors.white)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CheckboxWidget(),
            Spacer(
              flex: 3,
            ),
            CustomLongButton(context,
                label: "Upload",
                buttonColor: Colors.white,
                labelColor: Color(0xffFF8C00)),
            Spacer(
              flex: 2,
            ),
            NextButton(
              context,
              screen: UploadDriverLicense(),
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
