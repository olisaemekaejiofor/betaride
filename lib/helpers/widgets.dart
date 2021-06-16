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

Container buildIcon() {
  return Container(
    height: 16.0,
    width: 16.0,
    decoration: BoxDecoration(
      color: Color(0xffFF8C00),
      border: Border.all(color: Colors.white, width: 2.0),
      shape: BoxShape.circle,
    ),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFF8C00), width: 3.0),
          shape: BoxShape.circle,
          color: Colors.white),
    ),
  );
}

Padding buildIconRow({String label}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 17.0),
    child: Row(
      children: [
        buildIcon(),
        SizedBox(
          width: 6.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Center NextButton(BuildContext context, {Widget screen}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Text(
        'Next',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Color(0XffFFC885),
        ),
      ),
    ),
  );
}

GestureDetector CustomLongButton(BuildContext context,
    {String label, Color buttonColor, Color labelColor, Widget screen}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen != null ? screen : null),
      );
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFFFA73B),
          width: 4.0,
        ),
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 18,
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

GestureDetector ExitButton(BuildContext context, {Color color}) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
      Icons.chevron_left,
      color: color != null ? color : Colors.white,
      size: 30.0,
    ),
  );
}

Padding buildLicenseRow({String title}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}

Column BoxTextFormField({String hintText, String text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      TextFormField(
        decoration: InputDecoration(
            focusColor: Color(0XffFFF7ED),
            fillColor: Color(0XffFFF7ED),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0XffC78638),
              width: 1.0,
            )),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Color(0XffDCBC94),
            )),
      ),
    ],
  );
}
