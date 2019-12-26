import 'User.dart';
import '../Constants.dart';
import '../Data.dart';

class Report {

  User u;
  String report;

  String toSavableString() {
    return u.username + Constants.seperator + report;
  }

  Report({this.u,this.report});
  Report.fromString(String s) {
    List<String> dat = s.split(Constants.seperator);
    this.u = Data.getUser(dat[0]) ?? new User(username: "[user removed]", password: "password", fName: "User", lName:"Removed");
    this.report = dat[1];
  }
}