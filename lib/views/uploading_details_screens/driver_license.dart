import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/uploading_details_screens/insurance_policy.dart';

class UploadDriverLicense extends StatefulWidget {
  @override
  _UploadDriverLicenseState createState() => _UploadDriverLicenseState();
}

class _UploadDriverLicenseState extends State<UploadDriverLicense> {
  String path;
  Future saveImgP() async {
    var doc = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["png", "jpg"], allowCompression: false);
    setState(() {
      path = doc.paths.first;
      print(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9411),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please Upload\nyour Driver’s License',
              style: GoogleFonts.notoSans(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              'Once you submit your profile picture, it can’t be edited\n'
              'after the Verification process. So please ensure ;',
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            buildLicenseRow(title: '(a). Show your Whole face and tips of your shoulder'),
            buildLicenseRow(title: '(b). No Sunglasses or Hat please'),
            buildLicenseRow(title: '(c). Take your photo in a well-lit environment'),
            Spacer(),
            Center(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Image.asset('assets/license.png'),
              ),
            ),
            Spacer(),
            SCustomLongButton(
              context,
              label: "Upload",
              buttonColor: Colors.white,
              labelColor: Color(0xffFF8C00),
              fun: () => saveImgP(),
            ),
            Spacer(),
            (path == null)
                ? Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0XffFFC885),
                      ),
                    ),
                  )
                : NextButton(context, screen: UploadInsurancePolicy()),
            Spacer()
          ],
        ),
      ),
    );
  }
}
