import 'package:shared_preferences/shared_preferences.dart';

import 'types/Park.dart';
import 'types/Event.dart';
import 'types/User.dart';
import 'types/Report.dart';

class Data {
  static List<ParkEvent> events = new List<ParkEvent>();
  static List<User> users = new List<User>();
  static List<Park> parks = new List<Park>();
  static List<Report> reports = new List<Report>();

  static bool loaded = false;

  static Future<bool> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("1");
    if(prefs.containsKey("users")) {
      List<String> strUsers = prefs.getStringList("users") ?? new List<String>();
      for(String s in strUsers) {
        users.add(new User.fromString(s));
      }
    }

    print("2");
    if(prefs.containsKey("parks")) {
      List<String> strParks = prefs.getStringList("parks") ?? new List<String>();
      for(String s in strParks) {
        parks.add(new Park.fromString(s));
      }
    }

    print("3");
    if(prefs.containsKey("events")) {
      List<String> strEvents = prefs.getStringList("events") ?? new List<String>();
      for(String s in strEvents) {
        events.add(new ParkEvent.fromString(s));
      }
    }

    print("4");
    if(prefs.containsKey("reports")) {
      List<String> strReports = prefs.getStringList("reports") ?? new List<String>();
      for(String s in strReports) {
        reports.add(new Report.fromString(s));
      }
    }
    print("5");
      return true;
    //loaded = true;
  }

  static void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> strUser = new List<String>();
    for(User u in users) {
      strUser.add(u.toStorableString());
    }
    prefs.setStringList("users", strUser);

    List<String> strParks = new List<String>();
    for(Park p in parks) {
      strParks.add(p.toStorableString());
    }
    prefs.setStringList("parks", strParks);

    List<String> strEvents = new List<String>();
    for(ParkEvent e in  events) {
      strEvents.add(e.toStorableString());
    }
    prefs.setStringList("events", strEvents);

    List<String> strReports = new List<String>();
    for(Report r in reports) {
      strReports.add(r.toStorableString());
    }
    prefs.setStringList("reports", strReports);

  }

  static void addReport(Report r) {
    reports.add(r);
    save();
  }

  static void addUser(User u) {
    users.add(u);
    save();
  }

  static void addPark(Park p) {
    parks.add(p);
    save();
  }

  static void addEvent(ParkEvent e) {
    events.add(e);
    save();
  }

  static User getUser(String username) {
    for (User u in users) {
      if(u.username == username) {
        return u;
      }
    }
    return null;
  }
  static Park getPark(String name) {
    for(Park p in parks) {
      if(p.name == name) {
        return p;
      }
    }
    return null;
  }
  static ParkEvent getEvent(String title) {

  }

}