import '../Constants.dart';
import 'Park.dart';
import 'User.dart';

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
        + start.toString() + Constants.seperator
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
    //this.creator = dat[0]
    //this.location = dat[1]
    this.description = dat[2];
    this.title = dat[3];
    //this.start = dat[4];
    List<String> duration = dat[5].split(Constants.durSeperator);
    this.dur = new Duration(hours: int.tryParse(duration[0]) ?? 0, minutes: int.tryParse(duration[1]) ?? 0);
  }


}