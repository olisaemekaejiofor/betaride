import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';

class FeedbackMessage extends StatefulWidget {
  @override
  _FeedbackMessageState createState() => _FeedbackMessageState();
}

class _FeedbackMessageState extends State<FeedbackMessage> {
  bool showTextField = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFF9E28),
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
          )),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            color: Color(0xffFF9E28),
          )),
          Image.asset(
            'assets/Mask Group (2).png',
            fit: BoxFit.contain,
            width: width,
          ),
          Positioned(
            left: width * 0.3,
            top: height * 0.08,
            child: Image.asset(
              'assets/bookAsset.png',
              width: 200,
            ),
          ),
          Positioned(
            top: height * 0.3,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Color(0xffFDFDFD),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
                child: SingleChildScrollView(
                  child: showTextField
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Give feedback',
                                style: GoogleFonts.notoSans(
                                    fontSize: 24,
                                    color: Color(0xff262626),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'We would love to hear from you. You can\n '
                                'send us your complaints and feedbacks,\n we would definitely work on them',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans(
                                    fontSize: 16,
                                    color: Color(0xff262626),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/085-confused.png', width: 25),
                                  Image.asset('assets/084-confused-1.png', width: 25),
                                  Image.asset('assets/083-cool.png', width: 25),
                                  Image.asset('assets/015-smile-1.png', width: 25),
                                  Image.asset('assets/013-smiling-1.png', width: 25),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 190.0,
                              child: TextField(
                                maxLines: 100,
                                cursorColor: Color(0xffFF9E28),
                                keyboardType: TextInputType.multiline,
                                style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    color: Color(0xff262626),
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(0.13),
                                    filled: true,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Type your message',
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SCustomLongButton(
                              context,
                              label: "Send feedback",
                              buttonColor: Color(0xffFF9E28),
                              labelColor: Colors.white,
                              fun: () {
                                setState(() {
                                  showTextField = false;
                                });
                              },
                            )
                            // CustomButton(
                            //   onPress: () {
                            //     setState(() {
                            //       showTextField = false;
                            //     });
                            //   },
                            //   btnText: 'Send feedback',
                            // )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/013-smiling-1.png'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Thank you',
                                style: GoogleFonts.notoSans(
                                    fontSize: 24,
                                    color: Color(0xff262626),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Feedbacks well received. We would\n definitely work on your suggestions.\n Thank you for the commitment.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans(
                                    fontSize: 16,
                                    color: Color(0xff262626),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SCustomLongButton(
                              context,
                              label: "Send feedback",
                              buttonColor: Color(0xffFF9E28),
                              labelColor: Colors.white,
                              fun: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
