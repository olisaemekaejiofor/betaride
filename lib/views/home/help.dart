import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpOptions {
  final String image;
  final String text;
  final String text1;
  final Function screen;
  HelpOptions({this.screen, this.image, this.text, this.text1});
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    List<HelpOptions> cardOptions = [
      HelpOptions(
          image: 'assets/appointment 1.png',
          text: 'Request \nAppointment',
          text1: '',
          screen: () {}),
      HelpOptions(
          image: 'assets/contact.png',
          text: 'Contact Us',
          screen: () {},
          text1: 'Get across to us via \nour contacts'),
      HelpOptions(
          image: 'assets/appointment 1.png',
          text: 'Chat Us',
          screen: () {},
          text1: 'Talk to MyBetaRide'),
      HelpOptions(
          image: 'assets/feedback.png',
          text: 'Feedbacks',
          screen: () {
            // Navigator.of(context).pushNamed('/feedback');
          },
          text1: 'Complaints and feedbacks'),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffFF9E28),
        title: Text(
          'Help',
          style: GoogleFonts.notoSans(
              fontSize: 16, color: Color(0xffffffff), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            color: Color(0xffFF9E28),
          )),
          Image.asset(
            'assets/help 1.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: height * 0.36,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffFDFDFD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: GridView.builder(
                    itemCount: cardOptions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2.99,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15),
                    itemBuilder: (ctx, i) => InkWell(
                          onTap: cardOptions[i].screen,
                          child: Container(
                            padding: EdgeInsets.all(30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    // blurRadius: ,
                                    color: Color(0xffEDE9E9),
                                    offset: Offset(0, 2),
                                    spreadRadius: 0.5)
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xffFFF6EA)),
                                    child: Image.asset(
                                      cardOptions[i].image,
                                      width: 30,
                                    )),
                                SizedBox(height: 8.0),
                                Text(
                                  cardOptions[i].text,
                                  style: GoogleFonts.notoSans(color: Color(0xffEA9F44)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    cardOptions[i].text1,
                                    style: GoogleFonts.notoSans(
                                        color: Color(0xff858585), fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))),
          ),
        ],
      ),
    );
  }

  Widget container(String image, String text, String text1) {
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
              // blurRadius: ,
              color: Color(0xffEDE9E9),
              offset: Offset(0, 2),
              spreadRadius: 0.5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Color(0xffFFF6EA)),
              child: Image.asset(image, height: 30)),
          SizedBox(height: 20.0),
          Text(
            text,
            style: GoogleFonts.notoSans(color: Color(0xffEA9F44)),
          ),
          Text(
            text1,
            style: GoogleFonts.notoSans(color: Color(0xff858585), fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
