import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8C00),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 57.0,
          right: 22.0,
          left: 22.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Spacer(),
            Text(
              'Vehicle Details',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              'This would help us get proper understanding of\nyour Vehicle. Please do fill appropriately.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
