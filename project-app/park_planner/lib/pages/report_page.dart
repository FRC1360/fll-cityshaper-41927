import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../types/User.dart';


class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  User u;
  String reportMsg = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("If you meet an error or find a problem with our service, please leave a report below"),
          TextField(onChanged: (val) {
            setState(() {
              reportMsg = val;
            });
          },),
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}