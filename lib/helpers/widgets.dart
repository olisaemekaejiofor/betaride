import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DoubleFormField extends StatelessWidget {
  String label_1;
  String label_2;
  TextEditingController firstController;
  TextEditingController secondController;

  DoubleFormField({
    @required this.label_1,
    @required this.label_2,
    this.firstController,
    this.secondController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label_1,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff717171),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFF7ED),
                    border: Border(
                      top: BorderSide(color: Color(0xffC78638)),
                      bottom: BorderSide(color: Color(0xffC78638)),
                      left: BorderSide(color: Color(0xffC78638)),
                      right: BorderSide(color: Color(0xffC78638)),
                    ),
                  ),
                  child: TextFormField(
                    controller: firstController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: label_1,
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
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label_2,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff717171),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xffFFF7ED),
                    border: Border(
                      top: BorderSide(color: Color(0xffC78638)),
                      bottom: BorderSide(color: Color(0xffC78638)),
                      left: BorderSide(color: Color(0xffC78638)),
                      right: BorderSide(color: Color(0xffC78638)),
                    ),
                  ),
                  child: TextFormField(
                    controller: secondController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: label_2,
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
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SingleFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool obscure;

  SingleFormField({this.label, this.controller, this.obscure});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w300,
              color: Color(0xff717171),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xffFFF7ED),
              border: Border(
                top: BorderSide(color: Color(0xffC78638)),
                bottom: BorderSide(color: Color(0xffC78638)),
                left: BorderSide(color: Color(0xffC78638)),
                right: BorderSide(color: Color(0xffC78638)),
              ),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
                hintText: label,
                hintStyle: GoogleFonts.notoSans(
                  color: Color(0xffC78638),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FormDropdown extends StatefulWidget {
  String label;
  TextEditingController controller;

  FormDropdown({this.label, this.controller});

  @override
  _FormDropdownState createState() => _FormDropdownState();
}

class _FormDropdownState extends State<FormDropdown> {
  String dropdownValue = "+234";
  // List<String> countries = [
  //   "Nigeria",
  //   "Uganda",
  //   "Rwanda",
  //   "Kenya",
  //   "Tanzania",
  //   "Ghana",
  //   "Egypt",
  //   "Ethopia"
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w300,
              color: Color(0xff717171),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xffFFF7ED),
              border: Border(
                top: BorderSide(color: Color(0xffC78638)),
                bottom: BorderSide(color: Color(0xffC78638)),
                left: BorderSide(color: Color(0xffC78638)),
                right: BorderSide(color: Color(0xffC78638)),
              ),
            ),
            child: Container(
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      width: 65,
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              dropdownValue,
                              style: GoogleFonts.notoSans(
                                color: Color(0xff717171),
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff717171),
                              size: 18,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xffC78638),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  border: InputBorder.none,
                  hintText: "8123456789",
                  hintStyle: GoogleFonts.notoSans(
                    color: Color(0xffC78638),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
