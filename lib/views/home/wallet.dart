import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/Mask Group (2).png"),
              ),
              color: Color(0xffFF8C00),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Wallet",
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "N0.00",
                  style: GoogleFonts.notoSans(
                    fontSize: 54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Total Earn",
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            child: MaterialButton(
              elevation: 15,
              onPressed: () {},
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/atm.png", width: 20)),
                      SizedBox(width: 20),
                      Text(
                        "Withdraw",
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 30,
            child: Column(
              children: [
                Text(
                  "Payment History",
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    SizedBox(width: 35),
                    Text(
                      "All",
                      style: GoogleFonts.notoSans(fontSize: 16, color: Color(0xffFF8C00)),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Card",
                      style: GoogleFonts.notoSans(fontSize: 16, color: Color(0xffFF8C00)),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Cash",
                      style: GoogleFonts.notoSans(fontSize: 16, color: Color(0xffFF8C00)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
