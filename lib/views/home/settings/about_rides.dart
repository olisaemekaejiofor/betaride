import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AboutRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Material(
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.13),
          child: Container(
            child: ExpandablePanel(
              header: Text(
                'About rides, Is this platform for Nigerians only?',
                style: TextStyle(color: Color(0xFF5F7DA1), fontSize: 17),
              ),
              collapsed: Text(
                '',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                'NO, this platform is targetted towards providing good\n'
                'and naccurate transportation system first within Africa.\n'
                'Our first target at the moment is Nigeria but not limited\n'
                'to that.',
                softWrap: true,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.13),
          child: ExpandablePanel(
            header: Text(
              'About rides, Is this platform for Nigerians only?',
              style: TextStyle(color: Color(0xFF5F7DA1), fontSize: 17),
            ),
            collapsed: Text(
              '',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'NO, this platform is targetted towards providing good\n'
              'and naccurate transportation system first within Africa.\n'
              'Our first target at the moment is Nigeria but not limited\n'
              'to that.',
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.13),
          child: Container(
            child: ExpandablePanel(
              header: Text(
                'About rides, Is this platform for Nigerians only?',
                style: TextStyle(color: Color(0xFF5F7DA1), fontSize: 17),
              ),
              collapsed: Text(
                '',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                'NO, this platform is targetted towards providing good\n'
                'and naccurate transportation system first within Africa.\n'
                'Our first target at the moment is Nigeria but not limited\n'
                'to that.',
                softWrap: true,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.13),
          child: ExpandablePanel(
            header: Text(
              'About rides, Is this platform for Nigerians only?',
              style: TextStyle(color: Color(0xFF5F7DA1), fontSize: 17),
            ),
            collapsed: Text(
              '',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'NO, this platform is targetted towards providing good\n'
              'and naccurate transportation system first within Africa.\n'
              'Our first target at the moment is Nigeria but not limited\n'
              'to that.',
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
