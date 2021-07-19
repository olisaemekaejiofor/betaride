import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mybetaride/helpers/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng initialcameraposition = LatLng(6.440641, 23.2549939);
  GoogleMapController controller;
  Location location = Location();
  bool acceptRejectVisible = true;
  bool userBoardVisible = false;
  String dropdownValue = 'Riders Delay';

  void _onMapCreated(GoogleMapController cntlr) {
    controller = cntlr;
    location.onLocationChanged.listen((l) {
      print(l.latitude.toString() + l.longitude.toString());
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void accept() {
    setState(() {
      acceptRejectVisible = false;
      userBoardVisible = true;
      print(userBoardVisible);
    });
  }

  void reject() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white60,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/mini_x_2 3.png"),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Rejected?",
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Color(0xffFF8C00),
                      ),
                      SizedBox(height: 5),
                      Text("Please let us know why", style: GoogleFonts.notoSans()),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffFF8C00),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          underline: Container(),
                          icon: Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.45),
                              Icon(
                                Icons.keyboard_arrow_down,
                              ),
                            ],
                          ),
                          iconSize: 26,
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: [
                            'Riders Delay',
                            'Rider gives poor Rating',
                            'Rider harass driver',
                            'No specific reason',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.notoSans(),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        color: Color(0xffFF8C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Forward Response",
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      drawer: homeDrawer(width: MediaQuery.of(context).size.width * 85),
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
          Visibility(
            visible: acceptRejectVisible,
            child: acceptReject(
              positionedHeight: MediaQuery.of(context).size.height * 0.35,
              positionedLeft: MediaQuery.of(context).size.width * 0.050,
              containerWidth: MediaQuery.of(context).size.width * 0.9,
              rejectWidth: MediaQuery.of(context).size.width * 0.25,
              acceptWidth: MediaQuery.of(context).size.width * 0.25,
              reject: reject,
              accept: accept,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.82,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xffFF8C00),
                    child: Icon(Icons.zoom_in_sharp, color: Colors.white, size: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xffFF8C00),
                    child: Icon(Icons.zoom_out_sharp, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: userBoardVisible,
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
                    user(),
                    user(),
                    user(),
                    user(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector user() {
    return GestureDetector(
      onTap: () {
        setState(() {
          acceptRejectVisible = true;
          userBoardVisible = false;
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
