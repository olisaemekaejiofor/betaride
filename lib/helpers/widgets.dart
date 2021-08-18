import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/models/schedule_model.dart';
import 'package:mybetaride/views/home/home.dart';
import 'package:mybetaride/views/home/schedule.dart';
import 'package:mybetaride/views/home/settings/settings.dart';
import 'package:mybetaride/views/home/trip_history.dart';

Container doubleFormField({
  String label_1,
  String label_2,
  double width,
  Widget formChild1,
  Widget formChild2,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label_1,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff717171),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xffFFF7ED),
                  border: Border(
                    top: BorderSide(color: Color(0xffC78638)),
                    bottom: BorderSide(color: Color(0xffC78638)),
                    left: BorderSide(color: Color(0xffC78638)),
                    right: BorderSide(color: Color(0xffC78638)),
                  ),
                ),
                child: formChild1,
              ),
            ],
          ),
        ),
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label_2,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff717171),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xffFFF7ED),
                  border: Border(
                    top: BorderSide(color: Color(0xffC78638)),
                    bottom: BorderSide(color: Color(0xffC78638)),
                    left: BorderSide(color: Color(0xffC78638)),
                    right: BorderSide(color: Color(0xffC78638)),
                  ),
                ),
                child: formChild2,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container singleFormField({
  String label,
  Widget formChild,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w300,
            color: Color(0xff717171),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xffFFF7ED),
            border: Border(
              top: BorderSide(color: Color(0xffC78638)),
              bottom: BorderSide(color: Color(0xffC78638)),
              left: BorderSide(color: Color(0xffC78638)),
              right: BorderSide(color: Color(0xffC78638)),
            ),
          ),
          child: formChild,
        ),
      ],
    ),
  );
}

// ignore: must_be_immutable
Container formDropdown({
  String label,
  Widget formChild,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w300,
            color: Color(0xff717171),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: Color(0xffFFF7ED),
            border: Border(
              top: BorderSide(color: Color(0xffC78638)),
              bottom: BorderSide(color: Color(0xffC78638)),
              left: BorderSide(color: Color(0xffC78638)),
              right: BorderSide(color: Color(0xffC78638)),
            ),
          ),
          child: Container(
            child: formChild,
          ),
        ),
      ],
    ),
  );
}

InputDecoration decoration() {
  return InputDecoration(
    prefixIcon: Container(
      margin: EdgeInsets.only(left: 5.0),
      width: 65,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "+234",
              style: GoogleFonts.notoSans(
                color: Color(0xff717171),
                fontWeight: FontWeight.w300,
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xff717171),
              size: 18,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xffC78638),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 12.5,
    ),
    border: InputBorder.none,
    hintText: "8123456789",
    hintStyle: GoogleFonts.notoSans(
      color: Color(0xffC78638),
      fontWeight: FontWeight.w300,
      fontSize: 17,
    ),
  );
}

Container buildIcon() {
  return Container(
    height: 16.0,
    width: 16.0,
    decoration: BoxDecoration(
      color: Color(0xffFF8C00),
      border: Border.all(color: Colors.white, width: 2.0),
      shape: BoxShape.circle,
    ),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFF8C00), width: 3.0),
          shape: BoxShape.circle,
          color: Colors.white),
    ),
  );
}

Padding buildIconRow({String label}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 17.0),
    child: Row(
      children: [
        buildIcon(),
        SizedBox(
          width: 6.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Center NextButton(BuildContext context, {Widget screen}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Text(
        'Next',
        style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
GestureDetector CustomLongButton(BuildContext context,
    {String label, Color buttonColor, Color labelColor, Widget screen}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen != null ? screen : null),
      );
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
GestureDetector SecCustomLongButton(BuildContext context,
    {String label, Color buttonColor, Color labelColor, Widget screen}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => screen != null ? screen : null),
      );
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
GestureDetector SCustomLongButton(BuildContext context,
    {String label, Color buttonColor, Color labelColor, void Function() fun}) {
  return GestureDetector(
    onTap: fun,
    child: Container(
      margin: EdgeInsets.only(top: 10),
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
GestureDetector ExitButton(BuildContext context, {Color color}) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
      Icons.chevron_left,
      color: color != null ? color : Colors.white,
      size: 30.0,
    ),
  );
}

Padding buildLicenseRow({String title}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      title,
      style: GoogleFonts.notoSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Column BoxTextFormField({String hintText, String text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      TextFormField(
        decoration: InputDecoration(
            focusColor: Color(0XffFFF7ED),
            fillColor: Color(0XffFFF7ED),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0XffC78638),
              width: 1.0,
            )),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Color(0XffDCBC94),
            )),
      ),
    ],
  );
}

Column formField({String label, String hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.notoSans(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 3),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.notoSans(color: Colors.white70),
          ),
        ),
      ),
    ],
  );
}

// Container customDropdown({String label}) {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.notoSans(
//               color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
//         ),
//         DropdownButton<String>(
//           value: "dropdownValue",
//           icon: Icon(Icons.keyboard_arrow_down),
//           iconSize: 26,
//           onChanged: (newValue) {
//             setState(() {
//               dropdownValue = newValue;
//             });
//           },
//           items: ['one', 'two', 'three', 'four'].map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         )
//       ],
//     ),
//   );
// }
AppBar homeAppBar() {
  OnlineOffline client = OnlineOffline();

  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: Builder(
      builder: (context) => IconButton(
        iconSize: 30,
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.menu,
          color: Color(0xff525252),
        ),
      ),
    ),
    title: FutureBuilder(
        future: client.check(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return Container(
                width: 150,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xffE1FFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Available",
                    style: GoogleFonts.notoSans(
                        color: Color(0xff0698D7), fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            }
            return Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                color: Color(0xffE1FFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Unavailable",
                  style: GoogleFonts.notoSans(
                      color: Color(0xff0698D7), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            );
          } else {
            return Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Unavailable",
                  style: GoogleFonts.notoSans(
                      color: Color(0xff0698D7), fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            );
          }
        }),
  );
}

Drawer homeDrawer(BuildContext context,
    {double width, String name, void Function() fun, void Function() logout}) {
  return Drawer(
    child: Container(
      width: width,
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xffFF8C00),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/Mask Group (2).png",
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/bgdraw.png", width: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: UserPref().getName(),
                      builder: (context, snapshot) => Text(
                        snapshot.data ?? "null null",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: fun,
                        child: Container(
                          width: 120,
                          height: 30,
                          child: Center(
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.notoSans(
                                color: Color(0xffFF8C00),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        CustomTile(name: "Home", iconName: "home 1", widget: Home(false, true, false)),
        ListTile(
          onTap: () {
            comingSoonFlush(context);
          },
          leading: Image.asset("assets/credit-card.png", width: 25.0),
          title: Text(
            "My Wallet",
            style: GoogleFonts.notoSans(
                color: Color(0xff3e3e3e), fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        CustomTile(name: "Schedule", iconName: "calendar", widget: Schedule()),
        CustomTile(name: "Trip History", iconName: "steering-wheel (1)", widget: RideHistory()),
        ListTile(
          onTap: () {
            comingSoonFlush(context);
          },
          leading: Image.asset("assets/friends.png", width: 25.0),
          title: Text(
            "Invite Friends",
            style: GoogleFonts.notoSans(
                color: Color(0xff3e3e3e), fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        CustomTile(name: "Settings", iconName: "settings", widget: Settings()),
        ListTile(
          onTap: () {
            comingSoonFlush(context);
          },
          leading: Image.asset("assets/call-center.png", width: 25.0),
          title: Text(
            "Help",
            style: GoogleFonts.notoSans(
                color: Color(0xff3e3e3e), fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        Expanded(child: SizedBox()),
        ListTile(
          onTap: logout,
          leading: Image.asset("assets/logout 2.png", width: 25.0),
          title: Text(
            "Logout",
            style: GoogleFonts.notoSans(
                color: Color(0xff3e3e3e), fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 10),
      ]),
    ),
  );
}

class CustomTile extends StatelessWidget {
  final String name;
  final String iconName;
  final Widget widget;
  CustomTile({this.name, this.iconName, this.widget});
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      },
      leading: Image.asset("assets/" + iconName + ".png", width: 25.0),
      title: Text(
        name,
        style: GoogleFonts.notoSans(
            color: Color(0xff3e3e3e), fontWeight: FontWeight.w400, fontSize: 20.0),
      ),
    );
  }
}

Widget acceptReject(
  BuildContext context,
  ScheduleData schedule, {
  double containerWidth,
  double acceptWidth,
  double rejectWidth,
  void Function() reject,
  void Function() accept,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: containerWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/bgdraw.png", width: 50),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toyin Omobolanle",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "+2348167758317",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "₦2500",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "200km",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset("assets/Ellipse 29.png", width: 15),
                    Image.asset("assets/Line 2.png", height: 40),
                    Image.asset("assets/Rectangle 40.png", width: 15),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick Up location",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "Dutse-nara, Abuja, Nigeria",
                      style: GoogleFonts.notoSans(
                        color: Color(0xff3e3e3e),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Destination",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "Iwo, Osun state, Nigeria",
                      style: GoogleFonts.notoSans(
                        color: Color(0xff3e3e3e),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "pickup time",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "0.15ms",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Est. time",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "2.30 hrs",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: reject,
                  child: Container(
                    width: rejectWidth,
                    child: Center(
                      child: Text(
                        "Reject",
                        style: GoogleFonts.notoSans(
                          color: Color(0xffFF8C00),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: accept,
                  color: Color(0xffFF8C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: acceptWidth,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Accept",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget flushbar(BuildContext context, String message) {
  return Flushbar(
    icon: Icon(Icons.error, size: 26, color: Colors.white),
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 5),
    message: message,
    shouldIconPulse: true,
    backgroundColor: Colors.red[400],
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.symmetric(vertical: 20),
    margin: EdgeInsets.symmetric(horizontal: 10),
  )..show(context);
}

Widget homeScaffold(BuildContext context, {String value, Function(String) onChanged}) {
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
                    value: value,
                    underline: Container(),
                    icon: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                    iconSize: 26,
                    onChanged: onChanged,
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
}

Widget schedulePost(
  ScheduleData schedule,
  BuildContext context, {
  double containerHeight,
  double containerWidth,
  double acceptWidth,
  double rejectWidth,
  void Function() reject,
  void Function() accept,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/bgdraw.png", width: 50),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toyin Omobolanle",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "+2348167758317",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      schedule.paymentType ?? "₦2500",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      schedule.distance ?? "200km",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset("assets/Ellipse 29.png", width: 15),
                    Image.asset("assets/Line 2.png", height: 40),
                    Image.asset("assets/Rectangle 40.png", width: 15),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick Up location",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      schedule.fromAddress ?? "Dutse-nara, Abuja, Nigeria",
                      style: GoogleFonts.notoSans(
                        color: Color(0xff3e3e3e),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Destination",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      schedule.toAddress ?? "Iwo, Osun state, Nigeria",
                      style: GoogleFonts.notoSans(
                        color: Color(0xff3e3e3e),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "pickup time",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "0.15ms",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Est. time",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      "2.30 hrs",
                      style: GoogleFonts.notoSans(
                        color: Color(0xffFF8C00),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: reject,
                  child: Container(
                    width: rejectWidth,
                    child: Center(
                      child: Text(
                        "Reject",
                        style: GoogleFonts.notoSans(
                          color: Color(0xffFF8C00),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
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
                    width: acceptWidth,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Accept",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
    ],
  );
}

Widget comingSoonFlush(BuildContext context) {
  return Flushbar(
    message: "Coming soon!!!",
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
  )..show(context);
}
