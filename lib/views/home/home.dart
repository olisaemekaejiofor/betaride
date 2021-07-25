import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mybetaride/Providers/userProvider.dart';
import 'package:mybetaride/helpers/schedule_service.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/schedule_model.dart';
import 'package:mybetaride/models/user.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/profile.dart';
import 'package:provider/provider.dart';

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
  // bool acceptRejectVisible = true;
  // bool userBoardVisible = false;
  String dropdownValue = 'Riders Delay';

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

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    print(user.token);
    return Scaffold(
      appBar: homeAppBar(),
      drawer: homeDrawer(
          width: MediaQuery.of(context).size.width * 85,
          fun: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
          },
          logout: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
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
                  if (snapshot.data.length < 1) {
                    return Visibility(
                      visible: widget.acceptRejectVisible,
                      child: acceptReject(
                        positionedHeight: MediaQuery.of(context).size.height * 0.35,
                        positionedLeft: MediaQuery.of(context).size.width * 0.050,
                        containerWidth: MediaQuery.of(context).size.width * 0.9,
                        rejectWidth: MediaQuery.of(context).size.width * 0.25,
                        acceptWidth: MediaQuery.of(context).size.width * 0.25,
                        reject: reject,
                        accept: accept,
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                } else {
                  return SizedBox();
                }
              }),
          // Positioned(
          //   bottom: MediaQuery.of(context).size.height * 0.42,
          //   left: MediaQuery.of(context).size.width * 0.82,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         CircleAvatar(
          //           radius: 22,
          //           backgroundColor: Color(0xffFF8C00),
          //           child: Icon(Icons.zoom_in_sharp, color: Colors.white, size: 30),
          //         ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         CircleAvatar(
          //           radius: 22,
          //           backgroundColor: Color(0xffFF8C00),
          //           child: Icon(Icons.zoom_out_sharp, color: Colors.white, size: 30),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
                    userP(),
                    userP(),
                    userP(),
                    userP(),
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
                  height: MediaQuery.of(context).size.height * 0.38,
                  color: Color(0xffFF9411),
                  child: Column(),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SCustomLongButton(
                    context,
                    labelColor: Colors.white,
                    buttonColor: Color(0xffFF9411),
                    label: "Create Schedule",
                    fun: () {},
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

  GestureDetector userP() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.acceptRejectVisible = true;
          widget.userBoardVisible = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Color(0xffFF8C00), width: 3),
          ),
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
                Text("Dutsenara Abuja, Nigeria", style: GoogleFonts.notoSans()),
              ],
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_right, color: Color(0xffFF8C00))
          ],
        ),
      ),
    );
  }
}
