import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:park_planner/types/Report.dart';

import '../types/User.dart';
import '../Data.dart';


class ReportPage extends StatefulWidget {
  ReportPage({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportPage> {
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
                if(reportMsg.length > 300) {
                  _showDialog();
                }
                else {
                  setState(() {
                      Data.addReport(new Report(u: u, report: reportMsg));
                  });
                }
            },
          )
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Report Count too large"),
          content: new Text("It seems your report is too large, please ensure that it is within 300 words"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}