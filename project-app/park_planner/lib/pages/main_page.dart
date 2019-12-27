import 'package:flutter/material.dart';

import '../types/User.dart';
import 'calender.dart';
import 'faq.dart';
import 'about_us.dart';
import 'report_page.dart';
import 'admin_view.dart';

class MainPage extends StatefulWidget {
  User currentuser;
  MainPage(this.currentuser);

  @override
  _MainPageState createState() => _MainPageState(currentuser);
}

class _MainPageState extends State<MainPage> {

  _MainPageState(this.currentUser);
  User currentUser;
  int selectedIndex = 0;

  List<String> titles = [
                        "Calender",
                        "Report",
                        "About Us",
                        "F and Q",
                        "Admin View"
  ];

  List<Widget> views = [
                        CalenderPage(),
                        ReportPage(),
                        AboutUs(),
                        Faq(),
                        AdminView()
                        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex]),),
      drawer: Drawer(
        //child: Expanded(
        //TODO make this into a listview builder
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
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Report"),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("About Us"),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("FAQ"),
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("AdminView"),
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
          ],
        )//),
      ),
      body: Column(children: <Widget>[

        Expanded(child: views[selectedIndex]),
      ],),
      floatingActionButton: fab(),
    );
  }

  Widget fab() {
    if(selectedIndex == 0) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: "fab_cal",
        onPressed: _showAddEvent,
      );
    }
    else {
      return null;
    }
  }

  void _showAddEvent() {
    showBottomSheet(context: context, builder: null);
  }
}