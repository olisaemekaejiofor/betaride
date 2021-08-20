import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/home/profile.dart';

class History {
  final String name;
  final String distance;
  final double rating;
  final double amount;
  History({this.name, this.distance, this.rating, this.amount});
}

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  var selectedDate;

  List<History> historyList = [
    History(name: 'Bamidele Badmus', distance: '12km', rating: 4.0, amount: 200),
    History(name: 'Dr. Dele Musa', distance: '15km', rating: 4.5, amount: 200),
    History(name: 'Adeola Gbemisola', distance: '25km', rating: 4.5, amount: 200),
    History(name: 'Usman Isreal', distance: '32km', rating: 5.0, amount: 200),
    History(name: 'Dada Alice', distance: '15km', rating: 4.0, amount: 200)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffffffff),
        title: Text(
          'Trip History',
          style: GoogleFonts.notoSans(
            fontSize: 16,
            color: Color(0xff3A3A3A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: homeDrawer(context,
          width: MediaQuery.of(context).size.width * 85, name: "Toyin Omobolanle", fun: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      }, logout: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
        ScreenPref().setScreenPref(0);
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: AnimatedHorizontalCalendar(
                tableCalenderIcon: Icon(
                  Icons.calendar_today,
                  color: Color(0xffF1F1F1),
                ),
                selectedBoxShadow: BoxShadow(blurRadius: 0),
                unSelectedBoxShadow: BoxShadow(blurRadius: 0),
                tableCalenderButtonColor: Color(0xffFF9411),
                date: DateTime.now(),
                textColor: Color(0xff848383),
                backgroundColor: Color(0xffF1F1F1),
                // tableCalenderThemeData: ThemeData.light().copyWith(
                //   primaryColor: Color(0xffFFCF94),
                //   accentColor: Colors.brown,
                //   colorScheme: ColorScheme.light(primary: Color(0xffFFCF94)),
                //   buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                // ),
                selectedColor: Color(0xffFF9411),
                onDateSelected: (date) {
                  selectedDate = date;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card('assets/car 1.png', 'Total Spent', '0'),
                SizedBox(width: 20.0),
                card('assets/earn 1.png', 'Total Spent', 'N0.00'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Today',
              style: GoogleFonts.notoSans(
                color: Color(0xffACABAB),
              ),
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: historyList.length,
            //   itemBuilder: (ctx, i) => Container(
            //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //     child: Container(
            //       padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 10.0),
            //       decoration: BoxDecoration(
            //         color: Color(0xffffffff),
            //         boxShadow: [
            //           BoxShadow(
            //               // blurRadius: ,
            //               color: Color(0xffFFEFE0),
            //               offset: Offset(0, 2),
            //               spreadRadius: 0.5)
            //         ],
            //       ),
            //       child: Column(
            //         children: [
            //           Row(
            //             children: [
            //               CircleAvatar(
            //                 child: Image.asset('assets/bgdraw.png'),
            //               ),
            //               SizedBox(width: 10.0),
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(historyList[i].name),
            //                   Row(
            //                     children: [
            //                       Icon(
            //                         Icons.star,
            //                         color: Color(0xffFFA941),
            //                       ),
            //                       Text(historyList[i].rating.toString()),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Spacer(),
            //               Column(
            //                 children: [
            //                   Text(
            //                     historyList[i].amount.toString(),
            //                     style: TextStyle(fontWeight: FontWeight.bold),
            //                   ),
            //                   Text(
            //                     historyList[i].distance,
            //                     style: TextStyle(
            //                       color: Color(0xffD27400),
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //           Icon(
            //             Icons.keyboard_arrow_down,
            //             color: Color(0xffD27400),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            child: Center(
              child: Text(
                "You havent been on any trips yet\nOpen your schedules screen to start a trip.",
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget card(image, text1, text2) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xffFFCF94),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.notoSans(
                      fontSize: 12, color: Color(0xffD87600), fontWeight: FontWeight.normal),
                ),
                Text(
                  text2,
                  style: GoogleFonts.notoSans(
                      fontSize: 14, color: Color(0xff133660), fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ));
  }
}
