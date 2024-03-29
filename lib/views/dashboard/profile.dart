import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/app_url.dart';
import 'package:mybetaride/helpers/services.dart';
import 'package:mybetaride/helpers/shared_prefs.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/profile_model.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var state = ["Lagos", "Abia", "Delta", "Ogun", "Edo", "Enugu", "Osun", "Abuja"];
  String stateValue = "Lagos";
  ProfileService client = ProfileService();
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController cityController = TextEditingController();
  check(String controller, String newValue) {
    if (controller == '') {
      controller = newValue;
      print(controller);
    }
    return controller;
  }

  void move() => Navigator.push(context, MaterialPageRoute(builder: (_) => Home(true, false)));

  Future update() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    String token = await UserPref().getToken();
    var data = await client.getProfile();
    print(data.firstname);
    var body = {
      "firstName": check(firstNameController.text, data.firstname),
      "lastName": check(lastNameController.text, data.lastname),
      "address": check(cityController.text + "" + stateValue, data.address),
      "stateOfResidence": stateValue,
    };

    var res = await http.put(
      Uri.parse(AppUrl.updateProfile),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => customAlert(context, move,
              title: "Profile Updated Successfully",
              content: " ",
              buttonLabel: "Go home",
              buttonLabel2: "Make more changes"));
      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      //   return Home(true, false);
      // }));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF9411),
        title: Text(
          "My Profile",
          style: GoogleFonts.notoSans(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: client.getProfile(),
          builder: (BuildContext context, AsyncSnapshot<ProfileData> snapshot) {
            if (snapshot.hasData) {
              ProfileData profile = snapshot.data;
              firstNameController = TextEditingController(text: profile.firstname);
              lastNameController = TextEditingController(text: profile.lastname);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/bgdraw.png", width: 50),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(profile.firstname + " " + profile.lastname,
                                style: GoogleFonts.notoSans(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          child: Column(
                            children: [
                              doubleFormField(
                                label_1: "FirstName",
                                label_2: "LastName",
                                width: MediaQuery.of(context).size.width * 0.40,
                                formChild1: TextFormField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.firstname,
                                    hintStyle: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                formChild2: TextFormField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.lastname,
                                    hintStyle: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              singleFormField(
                                label: "E-mail Address",
                                formChild: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.email,
                                    hintStyle: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              singleFormField(
                                label: "Phone number",
                                formChild: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.phone,
                                    hintStyle: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              singleFormField(
                                label: "Address",
                                formChild: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.address,
                                    hintStyle: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SCustomLongButton(
                      context,
                      labelColor: Colors.white,
                      buttonColor: Color(0xffFF9411),
                      label: "Save Changes",
                      fun: () {
                        update();
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
