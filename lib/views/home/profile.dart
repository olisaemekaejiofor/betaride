import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybetaride/helpers/schedule_service.dart';
import 'package:mybetaride/helpers/widgets.dart';
import 'package:mybetaride/models/profile_model.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var state = ["Lagos", "Abia", "Delta", "Ogun", "Edo", "Enugu", "Osun", "Abuja"];
  String stateValue = "Lagos";
  ProfileService client = ProfileService();
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
                              singleFormField(
                                label: "Full Name",
                                formChild: TextFormField(
                                  // controller: nameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: profile.firstname + " " + profile.lastname,
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
                                  obscureText: true,
                                  // controller: emailController,
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
                                  obscureText: true,
                                  // controller: emailController,
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
                              doubleFormField(
                                label_1: "State",
                                label_2: "City",
                                width: MediaQuery.of(context).size.width * 0.40,
                                formChild1: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: DropdownButton(
                                    icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffC78638)),
                                    underline: Container(),
                                    value: stateValue,
                                    style: GoogleFonts.notoSans(
                                      color: Color(0xffC78638),
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (newValue) {
                                      setState(() {
                                        stateValue = newValue;
                                      });
                                    },
                                    items: state.map((val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: Text(val),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                formChild2: TextFormField(
                                  // controller: lastNameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "City",
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
                      fun: () {},
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
