import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                radius: 25,
                child: Icon(Icons.keyboard_arrow_left, size: 25, color: Color(0xff000000))),
          ),
        ),
        title: Text(
          'Contact Us',
          style: GoogleFonts.notoSans(
              fontSize: 16, color: Color(0xFF000000), fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110),
              child: Container(
                width: 136,
                height: 136,
                decoration: BoxDecoration(color: Color(0xFFFFFBE9), shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Image.asset(
                    'assets/contact (1) 1.png',
                    width: 43,
                    height: 43,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Send us an E-mail\n info@Mybetaride.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                  fontSize: 16, color: Color(0xffF000000), fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 53),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (await canLaunch('tel:+2348167758317')) {
                            await launch('tel:+2348167758317');
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFFBE9),
                          radius: 25,
                          child: Image.asset('assets/phone-call-bold 1.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        '08167758317',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (await canLaunch('https://twitter.com/mybetaride')) {
                            await launch('https://twitter.com/mybetaride');
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFFBE9),
                          radius: 25,
                          child: Image.asset('assets/twitter-logo 2.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Mybetaride',
                        style: GoogleFonts.notoSans(
                            fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (await canLaunch('https://mybetaride.com')) {
                            await launch('https://mybetaride.com');
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFFBE9),
                          radius: 25,
                          child: Image.asset('assets/globe 1.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Mybetaride.com',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 50),
              child: SCustomLongButton(context, label: 'Send Email', fun: () async {
                if (await canLaunch('mailto:info@mybetaride.com?subject=Hello')) {
                  await launch('mailto:info@mybetaride.com?subject=Hello');
                }
              }, labelColor: Colors.white, buttonColor: Color(0xffFF9411)),
            )
          ],
        ),
      ),
    );
  }
}
