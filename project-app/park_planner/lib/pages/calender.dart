import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

    for(ParkEvent e in Data.events) {
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
          //Text("Event Calender"),
          Container(
            child: _buildTableCalendar(),
          ),

          _eventList()

        ],
      ),
    );
  }

  Widget _eventList() {
    return Expanded(
        child: ListView.builder(
        itemCount: Data.selectedEvents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Data.selectedEvents[index].title),
            onTap: null,

          );

    }));
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
}