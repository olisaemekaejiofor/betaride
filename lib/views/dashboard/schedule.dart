import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/Providers/internetProvider.dart';
import 'package:mybetaride/helpers/nointernet.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/schedule_model.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/dashboard/home.dart';
import 'package:mybetaride/views/dashboard/profile.dart';
import 'package:provider/provider.dart';

import '../welcomeScreen.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  ProfileService profile = ProfileService();
  ScheduleService client = ScheduleService();
  CheckDriver driver = CheckDriver();
  void move() => Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomePage()));

  void show() {
    showDialog(
      context: context,
      builder: (context) {
        return customAlert(
          context,
          move,
          title: "You have not uploaded your vehicle details",
          content:
              "If you have uploaded your vahicle details please ignore and wait till you're verified",
          buttonLabel2: "Ignore",
          buttonLabel: "Upload Details",
        );
      },
    );
  }

  Future<List<ScheduleData>> gettt() async {
    return await client.getSchedule();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<InternetProvider>(context, listen: false).startMonitoring();
    gettt();
    // client.getSchedule();
  }

  @override
  void dispose() {
    super.dispose();
    gettt();
  }

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return Consumer<InternetProvider>(builder: (context, model, child) {
      if (model.isOnline != null) {
        return model.isOnline
            ? Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: Builder(
                    builder: (context) => IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(Icons.menu, color: Colors.white),
                    ),
                  ),
                ),
                drawer: homeDrawer(context, profile.getProfile(), driver.check(),
                    width: MediaQuery.of(context).size.width * 85, fun: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                }, logout: () {
                  UserPref().removeUser();
                  HomePref().removeSchedule();
                  ScreenPref().setScreenPref(0);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                }),
                body: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffFF9411), Color(0xffE56000)],
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 70),
                              Text("Create a Schedule",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 10),
                              Text("You want to start a new trip\nfrom your destination",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.notoSans(
                                      fontSize: 17.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.26,
                            child: FutureBuilder(
                              future: gettt(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return GestureDetector(
                                    onTap: (snapshot.data == true)
                                        ? () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Home(false, true)));
                                          }
                                        : show,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      height: 50,
                                      decoration: BoxDecoration(color: Color(0xffFF9411)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ImageIcon(AssetImage("assets/calendar.png"),
                                              color: Colors.white),
                                          SizedBox(width: 10),
                                          Text("New Schedule",
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 50,
                                  decoration: BoxDecoration(color: Color(0xffFF9411)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageIcon(AssetImage("assets/calendar.png"),
                                          color: Colors.white),
                                      SizedBox(width: 10),
                                      Text("New Schedule",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        children: [
                          Text(
                            "Availabe schedules",
                            style:
                                GoogleFonts.notoSans(fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: gettt(),
                        builder:
                            (BuildContext context, AsyncSnapshot<List<ScheduleData>> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length == 0) {
                              return Center(
                                child: Text(
                                  'No Schedule found. Click on \n"New Schedule" to create one',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            } else {
                              List<ScheduleData> schedule = snapshot.data;
                              return ListView.builder(
                                itemCount: schedule.length,
                                itemBuilder: (context, index) {
                                  return schedulePost(
                                    schedule[index],
                                    context,
                                    containerHeight: 200,
                                    containerWidth: MediaQuery.of(context).size.width * 0.9,
                                    rejectWidth: MediaQuery.of(context).size.width * 0.25,
                                    acceptWidth: MediaQuery.of(context).size.width * 0.25,
                                    accept: () {
                                      client.activate(context, schedule[index].id);
                                    },
                                  );
                                },
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              )
            : NoInternet();
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
