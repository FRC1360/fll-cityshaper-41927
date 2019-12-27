import 'dart:ffi';

import '../Constants.dart';
import 'Park.dart';
import 'User.dart';
import '../Data.dart';

class ParkEvent {
  List<User> attendees;

  User creator;

  Park location;

  String description;
  String title;

  DateTime start;
  Duration dur;

  String toStorableString() {
    return  creator.username + Constants.seperator
          + location.name + Constants.seperator
        + description + Constants.seperator
        + title + Constants.seperator
        + Data.getDateString(start) + Constants.seperator
        + dur.toString() + Constants.seperator;
  }
  
  ParkEvent(User c, Park l, String desc, String title, DateTime dt, Duration duration) {
    creator = c;
    location = l;
    this.title = title;
    this.description = desc;
    this.start = dt;
    this.dur = duration;

    attendees = new List<User>();
    attendees.add(c);
  }
  ParkEvent.fromString(String eventData) {
    List<String> dat = eventData.split(Constants.seperator);
    this.creator = Data.getUser(dat[0]) ?? new User(username: "user",password: "pass", fName: "user",lName: "deleted");
    this.location = Data.getPark(dat[1]) ?? new Park("deleted park", 50 , "deleted");
    this.description = dat[2];
    this.title = dat[3];
    this.start = Data.getDateFromString(dat[4]);
    List<String> duration = dat[5].split(Constants.durSeperator);
    this.dur = new Duration(hours: int.tryParse(duration[0]) ?? 0, minutes: int.tryParse(duration[1]) ?? 0);


  }


}