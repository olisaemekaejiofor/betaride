import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/Providers/internetProvider.dart';
import 'package:mybetaride/helpers/nointernet.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/views/auth_screens/login_screen.dart';
import 'package:mybetaride/views/auth_screens/register.dart';
import 'package:provider/provider.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  void initState() {
    super.initState();
    Provider.of<InternetProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if (Navigator.canPop(context)) {
          SystemNavigator.pop();
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pageUI(),
      ),
    );
  }

  Widget pageUI() {
    return Consumer<InternetProvider>(builder: (context, model, child) {
      if (model.isOnline != null) {
        return model.isOnline
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 60,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        "Become a Driver with\nEase and more cash",
                        style: GoogleFonts.notoSans(
                          fontSize: 26,
                          color: Color(0xff6C1B4F),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/onboard.png",
                        width: double.infinity,
                        filterQuality: FilterQuality.high,
                      ),
                      Spacer(),
                      SecCustomLongButton(
                        context,
                        labelColor: Colors.white,
                        buttonColor: Color(0xffFF9411),
                        label: "Get Registered!",
                        screen: Register(),
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LogInScreen()));
                        },
                        child: Text(
                          "Already have an account?",
                          style: GoogleFonts.notoSans(
                            color: Color(0xff1B1C1C),
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            : NoInternet();
      }
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 60,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Become a Driver with\nEase and more cash",
                style: GoogleFonts.notoSans(
                  fontSize: 26,
                  color: Color(0xff6C1B4F),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Image.asset(
                "assets/onboard.png",
                width: double.infinity,
                filterQuality: FilterQuality.high,
              ),
              Spacer(),
              SecCustomLongButton(
                context,
                labelColor: Colors.white,
                buttonColor: Color(0xffFF9411),
                label: "Get Registered!",
                screen: Register(),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                child: Text(
                  "Already have an account?",
                  style: GoogleFonts.notoSans(
                    color: Color(0xff1B1C1C),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
