import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: "Get paid at\n an instant",
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
                            height: 15,
                            width: (index == _currentPage) ? 15 : 15,
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
                                  top: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.white),
                                ),
                                color: (index == _currentPage) ? Colors.white : Colors.transparent),
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: (_currentPage == 2)
                          ? () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => OnBoard()));
                            }
                          : () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      height: 30,
                      minWidth: 100,
                      child: Text("Next",
                          style: GoogleFonts.notoSans(
                              color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ],
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
              height: MediaQuery.of(context).size.height * 0.50,
              color: Color(0xffFFE2BF),
            ),
            SizedBox(height: 75),
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
