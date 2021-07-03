import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  Future nextSave() async {}
  String dropdownValue = 'Toyota';
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                              elevation: 1,
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
                                      color: Colors.white,
                                      fontSize: 18,
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
                    formField(label: 'Vehicle Model', hintText: 'Toyota Corrola'),
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
                                  "Plate No",
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
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Your car plate no",
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
                    formField(label: 'Chasis/VIN no', hintText: '(5YJSA1DG9DFP14705)'),
                    SizedBox(height: 15),
                    formField(label: 'Engine no', hintText: '(52WVC10338)'),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            CustomLongButton(
              context,
              labelColor: Color(0xffFF9411),
              buttonColor: Colors.white,
              label: "Verify",
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setInt('pageIndex', 2);
                  print(prefs.getInt('pageIndex'));
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LogInScreen()));
                },
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
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
