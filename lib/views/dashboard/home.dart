import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mybetaride/Providers/internetProvider.dart';
import 'package:mybetaride/helpers/nointernet.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/terminals_model.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/dashboard/profile.dart';
import 'package:http/http.dart' as http;
import 'package:mybetaride/views/dashboard/schedule.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  bool userBoardVisible;
  bool newSchedule;

  Home(this.userBoardVisible, this.newSchedule);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScheduleService client = ScheduleService();
  ProfileService profile = ProfileService();
  TerminalService terminal = TerminalService();
  VehicleService vehicle = VehicleService();
  CheckDriver driver = CheckDriver();
  Position currentPosition;
  LatLng initialcameraposition = LatLng(6.440641, 23.2549939);
  GoogleMapController controller;
  Location location = Location();
  String dropdownValue = 'Riders Delay';
  TextEditingController pickup = TextEditingController();
  TextEditingController destination = TextEditingController();
  List<String> list = [];
  String startTime;
  String startTimer;
  String endTime;
  String endTimer;
  List latLng = [];
  String terminalId;
  String stateId;
  bool changeTime = false;
  bool changeDate = false;

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
    // setState(() {
    //   widget.acceptRejectVisible = false;
    //   widget.userBoardVisible = true;
    //   // print(userBoardVisible);
    // });
  }

  void reject() {
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return homeScaffold(context, value: dropdownValue, onChanged: (newValue) {
    //       setState(() {
    //         dropdownValue = newValue;
    //       });
    //     });
    //   },
    // );
  }

  void pickStartTime() {
    DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      var change = date.day.toString() +
          "/" +
          date.month.toString() +
          "/" +
          date.year.toString() +
          "   " +
          date.hour.toString() +
          ":" +
          date.minute.toString();
      setState(() {
        startTime = change;
        startTimer = date.toIso8601String();
        changeDate = true;
      });
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void pickEndTime() {
    DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      var change = date.day.toString() +
          "/" +
          date.month.toString() +
          "/" +
          date.year.toString() +
          "   " +
          date.hour.toString() +
          ":" +
          date.minute.toString();
      setState(() {
        endTime = change;
        endTimer = date.toIso8601String();
        changeTime = true;
      });
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  Future sendNewSchedule() async {
    double calculateDistance(lat1, lon1, lat2, lon2) {
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      return 12742 * asin(sqrt(a));
    }

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
      var data = await profile.getProfile();
      String id = await vehicle.getVehicle();
      String token = await UserPref().getToken();
      var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
      var response = await http.post(
        Uri.parse("https://mybetaride.herokuapp.com/api/v1/schedule/$id"),
        headers: headers,
        body: jsonEncode({
          "paymentType": "Cash",
          "status": "Offline",
          "fromAddress": pickup.text,
          "toAddress": destination.text,
          "startTime": startTimer,
          "endTime": endTimer,
          "stateId": "6064ac06b862500015aa9dd9",
          "terminalId": terminalId,
          "distanceInMiles":
              calculateDistance(latLng[0], latLng[1], latLng[2], latLng[3]).toStringAsFixed(1) +
                  "Km",
          "driverId": data.id,
          "amount": 300.20
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule()));
      } else {
        print(response.body);
        print("Wahala Dey");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<InternetProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if (Navigator.canPop(context)) {
          SystemNavigator.pop();
        } else {
          Navigator.pop(context);
        }
      },
      child: pageUI(),
    );
  }

  Widget pageUI() {
    return Consumer<InternetProvider>(builder: (context, model, child) {
      if (model.isOnline != null) {
        return model.isOnline
            ? Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: (widget.newSchedule == true)
                    ? AppBar(backgroundColor: Color(0xffFF9411), elevation: 0)
                    : homeAppBar(),
                drawer: homeDrawer(context, profile.getProfile(), driver.check(),
                    width: MediaQuery.of(context).size.width * 85, fun: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                }, logout: () {
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
                    // FutureBuilder(
                    //     future: client.getSchedule(),
                    //     builder: (BuildContext context, AsyncSnapshot<List<ScheduleData>> snapshot) {
                    //       if (snapshot.hasData) {
                    //         List<ScheduleData> schedule = snapshot.data;
                    //         if (schedule.length == 0) {
                    //           return SizedBox();
                    //         } else {
                    //           return Visibility(
                    //             visible: widget.acceptRejectVisible,
                    //             child: Align(
                    //               alignment: Alignment.bottomCenter,
                    //               child: Container(
                    //                 height: MediaQuery.of(context).size.height * 0.35,
                    //                 child: PageView.builder(
                    //                   itemCount: schedule.length,
                    //                   itemBuilder: (context, index) {
                    //                     return Padding(
                    //                       padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
                    //                       child: acceptReject(
                    //                         context,
                    //                         schedule[index],
                    //                         containerWidth: MediaQuery.of(context).size.width * 0.9,
                    //                         rejectWidth: MediaQuery.of(context).size.width * 0.25,
                    //                         acceptWidth: MediaQuery.of(context).size.width * 0.25,
                    //                         reject: reject,
                    //                         accept: accept,
                    //                       ),
                    //                     );
                    //                   },
                    //                 ),
                    //               ),
                    //             ),
                    //           );
                    //         }
                    //       } else {
                    //         return SizedBox();
                    //       }
                    //     }),
                    Visibility(
                      visible: widget.userBoardVisible,
                      child: FutureBuilder(
                        future: HomePref().getHomeSchedule(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Positioned(
                              bottom: 0.0,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width * 1,
                                        height: MediaQuery.of(context).size.height * 0.5,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
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
                                            expansion(),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30),
                                      )),
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
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
                                      // SizedBox(height: 15),
                                      // expansion(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Positioned(
                              bottom: 0.0,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    )),
                                width: MediaQuery.of(context).size.width * 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("No active schedule\n this widget is still on work!")
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: widget.newSchedule,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            height: MediaQuery.of(context).size.height * 0.45,
                            color: Color(0xffFF9411),
                            child: Column(
                              children: [
                                form(
                                  double.infinity,
                                  label: "Set pickup terminal",
                                  controller: pickup,
                                  hint: "Select pickup",
                                ),
                                SizedBox(height: 20),
                                form(
                                  double.infinity,
                                  label: "Set destination terminal",
                                  controller: destination,
                                  hint: "Select destination",
                                ),
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
              )
            : NoInternet();
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: (widget.newSchedule == true)
            ? AppBar(backgroundColor: Color(0xffFF9411), elevation: 0)
            : homeAppBar(),
        drawer: homeDrawer(context, profile.getProfile(), driver.check(),
            width: MediaQuery.of(context).size.width * 85, fun: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        }, logout: () {
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
            // FutureBuilder(
            //     future: client.getSchedule(),
            //     builder: (BuildContext context, AsyncSnapshot<List<ScheduleData>> snapshot) {
            //       if (snapshot.hasData) {
            //         List<ScheduleData> schedule = snapshot.data;
            //         if (schedule.length == 0) {
            //           return SizedBox();
            //         } else {
            //           return Visibility(
            //             visible: widget.acceptRejectVisible,
            //             child: Align(
            //               alignment: Alignment.bottomCenter,
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height * 0.35,
            //                 child: PageView.builder(
            //                   itemCount: schedule.length,
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                       padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            //                       child: acceptReject(
            //                         context,
            //                         schedule[index],
            //                         containerWidth: MediaQuery.of(context).size.width * 0.9,
            //                         rejectWidth: MediaQuery.of(context).size.width * 0.25,
            //                         acceptWidth: MediaQuery.of(context).size.width * 0.25,
            //                         reject: reject,
            //                         accept: accept,
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ),
            //           );
            //         }
            //       } else {
            //         return SizedBox();
            //       }
            //     }),
            Visibility(
              visible: widget.userBoardVisible,
              child: FutureBuilder(
                future: HomePref().getHomeSchedule(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Positioned(
                      bottom: 0.0,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height: MediaQuery.of(context).size.height * 0.5,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
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
                                    expansion(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
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
                              // SizedBox(height: 15),
                              // expansion(),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Positioned(
                      bottom: 0.0,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            )),
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text("No active schedule\n this widget is still on work!")],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Visibility(
              visible: widget.newSchedule,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    height: MediaQuery.of(context).size.height * 0.45,
                    color: Color(0xffFF9411),
                    child: Column(
                      children: [
                        form(
                          double.infinity,
                          label: "Set pickup terminal",
                          controller: pickup,
                          hint: "Select pickup",
                        ),
                        SizedBox(height: 20),
                        form(
                          double.infinity,
                          label: "Set destination terminal",
                          controller: destination,
                          hint: "Select destination",
                        ),
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
    });
  }

  Column form(double width, {String label, TextEditingController controller, String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.notoSans(color: Colors.white)),
        SizedBox(height: 10),
        Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xffFFAF4E),
          ),
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              style: GoogleFonts.notoSans(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.notoSans(color: Colors.white),
              ),
              enableSuggestions: true,
            ),
            suggestionsCallback: (_) async {
              return await TerminalService().getTerminal();
            },
            itemBuilder: (BuildContext context, TerminalData terminals) {
              return ListTile(
                title: Text(terminals.terminalName),
                subtitle: Text(terminals.address),
              );
            },
            onSuggestionSelected: (TerminalData terminals) {
              controller.text = terminals.terminalName;
              setState(() {
                if (terminalId == '' || terminalId == null) {
                  terminalId = terminals.id;
                }
                print(terminals.id);
                print(terminalId);
                latLng.add(terminals.location.coordinates[0]);
                latLng.add(terminals.location.coordinates[1]);
                print(latLng);
              });
            },
          ),
        ),
      ],
    );
  }

  Row doubleForm() {
    return Row(
      children: [
        dateTime("Start Time", pickStartTime,
            text: (changeDate == false) ? "Select Date" : startTime),
        Spacer(),
        dateTime("End Time", pickEndTime, text: (changeTime == false) ? "Select Time" : endTime),
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
}
