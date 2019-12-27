import 'package:park_planner/Constants.dart';
import '../Data.dart';

class User {
  String fName;
  String lName;

  String username;
  String password;

  //bool isAdmin; assuming that creation of parks isn't needed

  User.fromNothing();
  User({this.username,this.password,this.fName,this.lName});
  User.fromString(String userData) {
    List<String> dat = userData.split(Constants.seperator);
    this.username = dat[0];
    this.password = dat[1];
    this.fName = dat[2];
    this.lName = dat[3];
  }

  //before the user is added to the global users group, ensure that it's unique and valid
  bool validate() {
    return username.isNotEmpty && password.isNotEmpty && fName.isNotEmpty && lName.isNotEmpty && Data.getUser(username) == null;
  }

  String toStorableString() {
    return username + Constants.seperator +
            password + Constants.seperator +
            fName + Constants.seperator +
            lName + Constants.seperator;
  }

}