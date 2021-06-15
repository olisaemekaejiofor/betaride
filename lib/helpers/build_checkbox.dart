import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  Map<String, bool> numbers = {
    'Show your Whole face and tips of your\nShoulder': false,
    'No Sunglasses or Hat please': false,
    'Take your photo in a well-lit environment': false,
  };

  var holder_1 = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: numbers.keys.map((String key) {
        return new ListTile(
          leading: Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.red,
              value: numbers[key],
              onChanged: (bool value) {
                setState(() {
                  numbers[key] = value;
                });
              }),
          title: Text(
            key,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
