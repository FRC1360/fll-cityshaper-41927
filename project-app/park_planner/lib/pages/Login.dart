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

    if(!Data.loaded) {
      Data.getAll().then((success){
        setState(() {
          Data.loaded = true;
        });
      });
//      while(!Data.loaded) {
//        // print("waiting for data to load");
//      }
    }
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
          if(_validate()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(Data.getUser(user)))
            );
          }
          else{
            _askToRegister();
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
                  user = val.trim();
                },
              ),
              TextField(
                onChanged: (val) {
                  pass = val.trim();
                },
              ),
        ],),
      ),
    );
  }

  bool _validate() {
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

  void _askToRegister() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("User not recognized"),
          content: new Text("It seems your report is too large, please ensure that it is within 300 words"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(children: <Widget> [
              FlatButton(
                child: Text("Add User"),
                onPressed: () {
                  setState(() {
                      Data.addUser(new User(username: user, password: pass, fName: user, lName: user));
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(Data.getUser(user))));
                },
              ),
            FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ]),
          ],
        );
      },
    );
  }
}