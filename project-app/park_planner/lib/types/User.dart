import 'package:park_planner/Constants.dart';

class User {
  String fName;
  String lName;

  String username;
  String password;

  //bool isAdmin; assuming that creation of parks isn't needed

  User({this.username,this.password,this.fName,this.lName});
  User.fromString(String userData) {
    List<String> dat = userData.split(Constants.seperator);
    this.username = dat[0];
    this.password = dat[1];
    this.fName = dat[2];
    this.lName = dat[3];
  }

  String toStorableString() {
    return username + Constants.seperator +
            password + Constants.seperator +
            fName + Constants.seperator +
            lName + Constants.seperator;
  }

}