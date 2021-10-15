import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mybetaride/views/uploading_details_screens/vehicle_details.dart';
// 5F:7A:1F:01:47:F2:17:D5:BD:2D:53:BB:A6:27:CD:8F:A0:AD:DF:E1:68:10:5C:9C:C5:D1:36:95:01:F5:06:71

class UploadInspectionReport extends StatefulWidget {
  @override
  _UploadInspectionReportState createState() => _UploadInspectionReportState();
}

class _UploadInspectionReportState extends State<UploadInspectionReport> {
  String path;

  Future finish() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    String token = await UserPref().getToken();

    String profilePic = await VehicleDetailsPref().getProfilePic();
    String licence = await VehicleDetailsPref().getLicense();
    String insurance = await VehicleDetailsPref().getInsurance();
    String roadWorthiness = await VehicleDetailsPref().getRoadWorthiness();
    String inspectionReport = await VehicleDetailsPref().getInspectionReport();

    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://mybetaride.herokuapp.com/api/v1/documentupload'));
    request.files.add(await http.MultipartFile.fromPath('multi-files', profilePic));
    request.files.add(await http.MultipartFile.fromPath('multi-files', licence));
    request.files.add(await http.MultipartFile.fromPath('multi-files', roadWorthiness));
    request.files.add(await http.MultipartFile.fromPath('multi-files', insurance));
    request.files.add(await http.MultipartFile.fromPath('multi-files', inspectionReport));
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
          fun: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VehicleDetails())),
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
          fun: () => Navigator.pop(context),
        ),
        barrierDismissible: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future saveImgP() async {
      var doc = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ["png", "jpg"], allowCompression: false);
      setState(() {
        path = doc.paths.first;
        print(path);
        VehicleDetailsPref().setInspectionReport(path);
      });
    }

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
                : Center(
                    child: TextButton(
                      onPressed: finish,
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0XffFFC885),
                        ),
                      ),
                    ),
                  ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
