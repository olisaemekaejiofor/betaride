import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/views/auth_screens/register.dart';

import 'onboard.dart';

class OnboardPages extends StatefulWidget {
  @override
  _OnboardPagesState createState() => _OnboardPagesState();
}

class _OnboardPagesState extends State<OnboardPages> {
  int _currentPage = 0;
  PageController _controller = PageController();
  List<Widget> _pages = [
    Slider(
      title: "Create a\ntravel schedule",
      subtitle: "You create a travel scedule\nsetting your pick up terminal\nand destination",
      image: "assets/Group 22.png",
    ),
    Slider(
      title: "Drive Safely",
      subtitle: "Your safety and your happy\nriders are very important\nto us",
      image: "assets/Group 21.png",
    ),
    Slider(
      title: "Get paid at\nan instant",
      subtitle: "You recieve your payment\non your wallet immediately",
      image: "assets/Group 20.png",
    ),
  ];
  onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PageView.builder(
                itemBuilder: (context, int index) {
                  return _pages[index];
                },
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: onChanged,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          _pages.length,
                          (int index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 10,
                              width: (index == _currentPage) ? 20 : 20,
                              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage) ? Color(0xffFF9411) : Colors.grey),
                            );
                          },
                        ),
                      ),
                      MaterialButton(
                        onPressed: (_currentPage == 2)
                            ? () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Register()));
                              }
                            : () {
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              },
                        color: Color(0xffFF9411),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        height: 45,
                        minWidth: 120,
                        child: Text(
                          "Next",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
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

class Slider extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  Slider({this.title, this.subtitle, this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              color: Color(0xffFFE2BF),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                title,
                style: GoogleFonts.notoSans(
                  color: Color(0xffFF9411),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                subtitle,
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.scaleDown),
          ),
        ),
      ],
    );
  }
}
