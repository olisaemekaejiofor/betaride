import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mybetaride/views/dashboard/home.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  TextEditingController model = TextEditingController();
  TextEditingController original = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController seats = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController license = TextEditingController();
  TextEditingController engine = TextEditingController();

  Future nextSave() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    String token = await UserPref().getToken();
    var data = {
      "vehicleMake": dropdownValue,
      "vehicleName": dropdownValue + " " + model.text,
      "vehicleModel": model.text,
      "originalOwner": original.text,
      "type": type.text,
      "year": year.text,
      "licenseNumber": license.text,
      "engineNumber": engine.text
    };
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    if (model.text == '' ||
        original.text == '' ||
        type.text == '' ||
        year.text == '' ||
        license.text == '' ||
        engine.text == '') {
      Navigator.pop(context);
      flushbar(context, "Please fill all fields");
    } else {
      var res = await http.post(
        Uri.parse(AppUrl.addVehicle),
        headers: headers,
        body: jsonEncode(data),
      );
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 201) {
        Navigator.pop(context);
        ScreenPref().setScreenPref(0);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home(true, false)));
      }
    }
  }

  String dropdownValue = 'Toyota';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF9411),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vehicle Details",
              style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              "This would help us get proper understanding of\nyour vehicle. Please do fill appropriately",
              style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vehicle Name/Make",
                            style: GoogleFonts.notoSans(
                                color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xffFF9411),
                              value: dropdownValue,
                              underline: Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              icon: Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.65),
                                  Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                                ],
                              ),
                              iconSize: 26,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              // documentUpload
                              items: [
                                'Toyota',
                                'Honda',
                                'BMW',
                                'Kia',
                                'Hyundai',
                                'Mazda',
                                'Benz',
                                'Lexus',
                                'Nissan'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    formField(
                        label: 'Vehicle Model', hintText: 'Toyota Corrola', controller: model),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Original Owner",
                                  style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))),
                                  child: TextField(
                                    controller: original,
                                    style: GoogleFonts.notoSans(color: Colors.white70),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Y/N",
                                      hintStyle: GoogleFonts.notoSans(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Car Type",
                                  style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))),
                                  child: TextField(
                                    controller: type,
                                    style: GoogleFonts.notoSans(color: Colors.white70),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type of Car",
                                      hintStyle: GoogleFonts.notoSans(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No of seats",
                                  style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))),
                                  child: TextField(
                                    controller: seats,
                                    style: GoogleFonts.notoSans(color: Colors.white70),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "4",
                                      hintStyle: GoogleFonts.notoSans(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Year of Production",
                                  style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))),
                                  child: TextField(
                                    controller: year,
                                    style: GoogleFonts.notoSans(color: Colors.white70),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Your car year of production",
                                      hintStyle: GoogleFonts.notoSans(color: Colors.white70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    formField(label: 'License no', hintText: '(AAA123AL)', controller: license),
                    SizedBox(height: 15),
                    formField(label: 'Engine no', hintText: '(52WVC10338)', controller: engine),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SCustomLongButton(
              context,
              labelColor: Color(0xffFF9411),
              buttonColor: Colors.white,
              label: "Verify",
              fun: nextSave,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
