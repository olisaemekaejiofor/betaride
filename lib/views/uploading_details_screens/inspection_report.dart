import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mybetaride/helpers/shared_prefs.dart';
// import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mybetaride/views/uploading_details_screens/vehicle_details.dart';

import '../welcomeScreen.dart';

class UploadInspectionReport extends StatefulWidget {
  final String profilepic;
  final String licence;
  final String insurance;
  final String roadworthiness;

  UploadInspectionReport(
      {@required this.profilepic,
      @required this.licence,
      @required this.insurance,
      @required this.roadworthiness});
  @override
  _UploadInspectionReportState createState() => _UploadInspectionReportState();
}

class _UploadInspectionReportState extends State<UploadInspectionReport> {
  String path;

  @override
  Widget build(BuildContext context) {
    Future saveImgP() async {
      showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
      var doc = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ["png", "jpg"], allowCompression: false);
      setState(() {
        path = doc.paths.first;
        print(path);
      });
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMWU3YWEwMTNmMjFhMDAxNWM2MmE3ZSIsInJvbGUiOiJkcml2ZXIiLCJpYXQiOjE2MzA0OTYxNzYsImV4cCI6MTYzMTEwMDk3Nn0.wQLF6bGx4h1hZo9-nOhZGan75tOGGvLBbvdTt3KkCoI'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://mybetaride.herokuapp.com/api/v1/documentupload'));
      request.files.add(await http.MultipartFile.fromPath('multi-files', widget.profilepic));
      request.files.add(await http.MultipartFile.fromPath('multi-files', widget.licence));
      request.files.add(await http.MultipartFile.fromPath('multi-files', widget.roadworthiness));
      request.files.add(await http.MultipartFile.fromPath('multi-files', widget.insurance));
      request.files.add(await http.MultipartFile.fromPath('multi-files', path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => oneCustomAlert(
            context,
            title: "Vehicle Documents Upload Succesful",
            content: " ",
            buttonLabel: "Proceed",
          ),
          barrierDismissible: false,
        );
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => oneCustomAlert(
            context,
            title: "Vehicle Documents Upload failed",
            content: "There was an issue with one of your files. Please go back and try again",
            buttonLabel: "Try again",
          ),
          barrierDismissible: false,
        );
      }

      // ScreenPref().setScreenPref(1);
      Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleDetails()));
    }

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomePage()));
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
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
                'Please Upload your Vehicle\nInspection Report',
                style: GoogleFonts.notoSans(
                  fontSize: 26.0,
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
              Center(
                child: Container(
                  height: 280.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/inspectionReport.png'),
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
                        'Finish',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0XffFFC885),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: saveImgP,
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0XffFFC885),
                        ),
                      ),
                    ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
