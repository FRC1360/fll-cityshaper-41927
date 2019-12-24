import 'package:shared_preferences/shared_preferences.dart';

import 'types/Park.dart';
import 'types/Event.dart';
import 'types/User.dart';

class Data {
  static List<ParkEvent> events;
  static List<User> users;
  static List<Park> parks;

  static void getParks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strEvents = prefs.getStringList("events") ?? new List<String>();


  }
  static void getUsers() {

  }

  static void getEvents() {

  }
}