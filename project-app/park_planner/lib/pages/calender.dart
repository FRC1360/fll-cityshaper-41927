import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:park_planner/types/Event.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Data.dart';
import '../types/Park.dart';
import '../types/User.dart';

class CalenderPage extends StatefulWidget {
  CalenderPage({Key key}) : super(key: key);

  @override
  _CalenderPageState createState() {
    return _CalenderPageState();
  }
}

class _CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {

  Map<DateTime, List> _events = new Map<DateTime, List>();
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    print("calender init");

    for(ParkEvent e in Data.events) {
      print(e.title);
      if(_events[e.start] == null) _events[e.start] = new List();
      _events[e.start].add(e);

    }

    Data.selectedEvents = _events[DateTime.now()] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

         Container(
           child: _buildTableCalendar(),
         ),

         SizedBox(
         height: 200,

         child: Card(child: _eventList())
         )

        ],
      ),
    );
  }

  Widget _eventList() {
    return Column(children: <Widget>[Expanded(
        child: ListView.builder(
        itemCount: Data.selectedEvents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Data.selectedEvents[index].title),
            onTap: () {
              _showDialog(Data.selectedEvents[index]);
            },

          );

    }))]);
  }
  
  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      Data.selectedDate = day;
      Data.selectedEvents = events;
    });
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      //holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  void _showDialog(ParkEvent e) {
    // flutter defined function
    print("hmm");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(e.title),
          content: Column(children: <Widget>[
            Text(e.description),
            SizedBox(
              height: 500,
              width: 300,
            child: ListView.builder(
                itemCount: e.attendees.length,
                itemBuilder: (context,index) {
                  return ListTile(
                    title: Text(e.attendees[index].fName + " " + e.attendees[index].lName),
                  );
            }))
          ],),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text("Join"),
                onPressed: () {
                  setState(() {
                    e.attendees.add(Data.currentUser);
                    Data.save();
                  });
                  Navigator.pop(context);

                },
              ),
             FlatButton(
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