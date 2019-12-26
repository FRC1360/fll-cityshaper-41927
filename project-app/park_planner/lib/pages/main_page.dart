import 'package:flutter/material.dart';

import '../types/User.dart';
import 'calender.dart';
import 'faq.dart';
import 'about_us.dart';
import 'report_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  User currentUser;
  int selecctedIndex = 0;

  List<Widget> views = [Calender(),
                        Report(),
                        AboutUs(),
                        Faq(),
                        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Calender"),
              onTap: () {
                setState(() {
                  selecctedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Report"),
              onTap: () {
                setState(() {
                  selecctedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("About Us"),
              onTap: () {
                setState(() {
                  selecctedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("FAQ"),
              onTap: () {
                setState(() {
                  selecctedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: views[selecctedIndex],
    );
  }
}