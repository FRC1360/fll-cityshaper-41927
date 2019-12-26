import 'package:flutter/material.dart';
import '../types/User.dart';
import '../Data.dart';
import 'main_page.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {

  String user = "";
  String pass = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          if(validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage())
            );
          }
          else{
            //
          }
        },
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              TextField(
                onChanged: (val) {
                  user = val;
                },
              ),
              TextField(
                onChanged: (val) {
                  pass = val;
                },
              ),
        ],),
      ),
    );
  }

  bool validate() {
    if(!Data.loaded) {
      return false;
    }
    User u = Data.getUser(this.user);
    if( u == null) {
      return false;
    }
    if( u.password == this.pass)
      {
        return true;
      }
    return false;
  }
}