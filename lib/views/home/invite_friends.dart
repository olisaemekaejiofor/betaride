import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xff525252),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/timeline-transport-taxi.png"),
            Spacer(),
            Text(
              "Invite Friends",
              style: GoogleFonts.notoSans(
                fontSize: 22,
                color: Color(0xffFF8C00),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                  "Invite your friemds and get free instant reward to your wallet, and also that of your friend. Invite as many as you want and watch your wallet increase",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                    fontSize: 17,
                  )),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/whatsapp-logo-bold 1.png", width: 50),
                SizedBox(width: 15),
                Image.asset("assets/linkedin-logo 1.png", width: 50),
                SizedBox(width: 15),
                Image.asset("assets/Vector.png", width: 50),
                SizedBox(width: 15),
                Image.asset("assets/google-logo 1.png", width: 50),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                onPressed: () {},
                elevation: 0,
                color: Color(0xffFF8C00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Text(
                      "Invite",
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
