import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Planyourparkoakville was designed by an FLL team called “The Wheel Deal“. This group of 8 designed this website to help with the problem – underutilisation of parks and green spaces in our community"),
          Text("Planyourparkoakville is a home for all your park activities. Check back frequently for new activities to be added to the park schedule."),
          Text("Contact Us: ")
        ],
      ),
    );
  }
}
