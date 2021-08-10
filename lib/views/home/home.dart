import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/schedule_model.dart';

import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/profile.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  bool userBoardVisible;
  bool acceptRejectVisible;
  bool newSchedule;

  Home(this.userBoardVisible, this.acceptRejectVisible, this.newSchedule);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScheduleService client = ScheduleService();
  LatLng initialcameraposition = LatLng(6.440641, 23.2549939);
  GoogleMapController controller;
  Location location = Location();
  String dropdownValue = 'Riders Delay';
  TextEditingController pickup = TextEditingController();
  TextEditingController destination = TextEditingController();
  DateTime selectedDate;
  TimeOfDay selectedDay;
  bool changeTime = false;
  bool changeDate = false;

  String convertTime() {
    var time = selectedDay;
    var finalTime = time.hour.toString() + ":" + time.minute.toString();
    return finalTime;
  }

  String convertDate() {
    var date = selectedDate;
    var finalDate = date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString();
    return finalDate;
  }

  void _onMapCreated(GoogleMapController cntlr) {
    controller = cntlr;
    location.onLocationChanged.listen((l) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void accept() {
    setState(() {
      widget.acceptRejectVisible = false;
      widget.userBoardVisible = true;
      // print(userBoardVisible);
    });
  }

  void reject() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return homeScaffold(context, value: dropdownValue, onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        });
      },
    );
  }

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickDate) {
      if (pickDate == null) {}
      setState(() {
        selectedDate = pickDate;
        changeDate = true;
      });
    });
  }

  void selectTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickTime) {
      if (pickTime == null) {}
      setState(() {
        selectedDay = pickTime;
        changeTime = true;
      });
    });
  }

  Future sendNewSchedule() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (pickup.text == '' || destination.text == '') {
      Navigator.pop(context);
      flushbar(context, "All Feilds are required");
    } else {
      String token = await UserPref().getToken();
      var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
      var response = await http.post(
        Uri.parse(""),
        headers: headers,
        body: jsonEncode({}),
      );

      if (response.statusCode == 201) {
        print(response.body);
      } else {
        print("Wahala Dey");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: (widget.newSchedule == true)
          ? AppBar(backgroundColor: Color(0xffFF9411), elevation: 0)
          : homeAppBar(),
      drawer: homeDrawer(
          width: MediaQuery.of(context).size.width * 85,
          fun: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          },
          logout: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
            UserPref().removeUser();
            ScreenPref().setScreenPref(0);
          }),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: initialcameraposition),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            tiltGesturesEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
          ),
          FutureBuilder(
              future: client.getSchedule(),
              builder: (BuildContext context, AsyncSnapshot<List<ScheduleData>> snapshot) {
                if (snapshot.hasData) {
                  List<ScheduleData> schedule = snapshot.data;
                  if (schedule.length == 0) {
                    return SizedBox();
                  } else {
                    return Visibility(
                      visible: widget.acceptRejectVisible,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: PageView.builder(
                            itemCount: schedule.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
                                child: acceptReject(
                                  context,
                                  schedule[index],
                                  containerWidth: MediaQuery.of(context).size.width * 0.9,
                                  rejectWidth: MediaQuery.of(context).size.width * 0.25,
                                  acceptWidth: MediaQuery.of(context).size.width * 0.25,
                                  reject: reject,
                                  accept: accept,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return SizedBox();
                }
              }),
          Visibility(
            visible: widget.userBoardVisible,
            child: Positioned(
              bottom: 0.0,
              left: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/coolicon.png", width: 25),
                        SizedBox(width: 10),
                        Text(
                          "Users on Board",
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    ExpansionPanelList(
                      elevation: 0,
                      animationDuration: Duration(seconds: 2),
                      children: [
                        ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: true,
                          headerBuilder: (BuildContext context, bool header) {
                            return userP();
                          },
                          body: Container(
                            height: 20,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    // userP(),
                    // userP(),
                    // userP(),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.newSchedule,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  height: MediaQuery.of(context).size.height * 0.38,
                  color: Color(0xffFF9411),
                  child: Column(
                    children: [
                      form(double.infinity,
                          label: "Set pickup station", controller: pickup, hint: "Select pickup"),
                      SizedBox(height: 20),
                      form(double.infinity,
                          label: "Set your destination",
                          controller: destination,
                          hint: "Select destination"),
                      SizedBox(height: 20),
                      doubleForm(),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SCustomLongButton(
                    context,
                    labelColor: Colors.white,
                    buttonColor: Color(0xffFF9411),
                    label: "Create Schedule",
                    fun: () {
                      sendNewSchedule();
                    },
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column form(double width, {String label, TextEditingController controller, String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.notoSans(color: Colors.white)),
        SizedBox(height: 10),
        Container(
          height: 45,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xffFFAF4E),
          ),
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.notoSans(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.notoSans(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Row doubleForm() {
    return Row(
      children: [
        dateTime("Date", selectDate, text: (changeDate == false) ? "Select Date" : convertDate()),
        Spacer(),
        dateTime("Time", selectTime, text: (changeTime == false) ? "Select Time" : convertTime()),
      ],
    );
  }

  GestureDetector dateTime(String label, void Function() function, {String text}) {
    return GestureDetector(
      onTap: function,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSans(color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            padding: EdgeInsets.only(left: 10, top: 10),
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              color: Color(0xffFFAF4E),
            ),
            child: Text(
              text,
              style: GoogleFonts.notoSans(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector userP() {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   widget.acceptRejectVisible = true;
        //   widget.userBoardVisible = false;
        // });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            // border: Border(
            //   right: BorderSide(color: Color(0xffFF8C00), width: 3),
            // ),
            ),
        child: Row(
          children: [
            Image.asset("assets/bgdraw.png", width: 60),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tobi Dayo",
                    style: GoogleFonts.notoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  "Dutsenara Abuja, Nigeria",
                  style: GoogleFonts.notoSans(),
                ),
              ],
            ),
            Spacer(),
            // Icon(Icons.keyboard_arrow_right, color: Color(0xffFF8C00))
          ],
        ),
      ),
    );
  }
}
