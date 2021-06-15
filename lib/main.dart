import 'package:flutter/material.dart';
import 'package:mybetaride/views/onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyBetaRide',
      home: OnBoard(),
    );
  }
}
