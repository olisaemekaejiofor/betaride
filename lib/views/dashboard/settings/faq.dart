import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/views/dashboard/settings/about_rides.dart';
import 'package:mybetaride/views/dashboard/settings/get_started.dart';
import 'package:mybetaride/views/dashboard/settings/user_guide.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  int pageViewIndex;
  PageController _pageController = PageController(initialPage: 1, keepPage: true);
  List pageContent = [GetStarted(), AboutRides(), UsageGuides()];
  bool clicked1 = false;
  bool clicked2 = false;
  bool clicked3 = false;
  bool showBorder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                radius: 25,
                child: Icon(Icons.keyboard_arrow_left, color: Colors.white)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          color: Color(0xFFFAFAFA),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text('Hello, how can we help?',
                  style: GoogleFonts.notoSans(
                      fontSize: 24, color: Color(0xff262626), fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 18,
                shadowColor: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15.0),
                child: TextField(
                  cursorColor: Colors.grey,
                  style: TextStyle(color: Colors.blueGrey),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(width: 0, color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(width: 0, color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFB5D5FF),
                      ),
                      hintText: 'ask a question',
                      hintStyle: TextStyle(color: Color(0xFFB5D5FF)),
                      suffixIcon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        margin: EdgeInsets.only(
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFF9E28),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          'send',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('or choose a category to quickly find the help you need',
                  style: GoogleFonts.notoSans(
                      fontSize: 12, color: Color(0xff000000), fontWeight: FontWeight.w400)),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: () => setState(() {
                        pageViewIndex = 0;
                        _pageController.animateToPage(
                          pageViewIndex,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                        );
                        clicked1 = true;
                        clicked2 = false;
                        clicked3 = false;
                      }),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: clicked1
                                ? Border.all(color: Color(0xffFF9E28))
                                : Border.all(color: Colors.transparent)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/coolicon.png',
                              width: 21,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Get Started",
                              style: TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkResponse(
                      onTap: () => setState(() {
                        pageViewIndex = 1;
                        _pageController.animateToPage(
                          pageViewIndex,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                        );
                        clicked1 = false;
                        clicked2 = true;
                        clicked3 = false;
                      }),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: clicked2
                                ? Border.all(color: Color(0xffFF9E28))
                                : Border.all(color: Colors.transparent)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/steering-wheel (1).png',
                              width: 21,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "About Rides",
                              style: TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkResponse(
                      onTap: () => setState(() {
                        pageViewIndex = 2;
                        _pageController.animateToPage(
                          pageViewIndex,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                        );
                        clicked1 = false;
                        clicked2 = false;
                        clicked3 = true;
                      }),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: clicked3
                                ? Border.all(color: Color(0xffFF9E28))
                                : Border.all(color: Colors.transparent)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/friends.png',
                              width: 21,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "User guide",
                              style: TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pageContent.length,
                    itemBuilder: (context, pageViewIndex) {
                      return pageContent[pageViewIndex];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
