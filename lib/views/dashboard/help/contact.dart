import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                child: Icon(Icons.keyboard_arrow_left)),
          ),
        ),
        title: Text(
          'Contact Us',
          style: GoogleFonts.notoSans(
              fontSize: 16.sp, color: Color(0xFF000000), fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110.w),
              child: Container(
                width: 136.w,
                height: 136.h,
                decoration: BoxDecoration(color: Color(0xFFFFFBE9), shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Image.asset(
                    'assets/contact(1) 1.png',
                    width: 43.w,
                    height: 43.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 21.h,
            ),
            Text(
              'Send us an E-mail\n info@Mybetaride.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                  fontSize: 16, color: Color(0xffF000000), fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 53.w),
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
                          radius: 25.w,
                          child: Image.asset('assets/phone-call-bold 1.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        '08167758317',
                        style: GoogleFonts.notoSans(
                          fontSize: 12.w,
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
                          radius: 25.w,
                          child: Image.asset('assets/images/twitter-logo 2.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'Mybetaride',
                        style: GoogleFonts.notoSans(
                            fontSize: 12.w, color: Color(0xFF000000), fontWeight: FontWeight.w400),
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
                          radius: 25.w,
                          child: Image.asset('assets/globe 1.png'),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'Mybetaride.com',
                        style: GoogleFonts.notoSans(
                          fontSize: 12.sp,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 151.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
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
