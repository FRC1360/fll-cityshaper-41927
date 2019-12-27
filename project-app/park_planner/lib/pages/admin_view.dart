import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Data.dart';
import '../types/Park.dart';
import '../types/User.dart';

class AdminView extends StatefulWidget {
  AdminView({Key key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  User u;
  Park p;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Column(children: <Widget>[
              Text("username:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    u.username = val.trim();
                  });
                },
              ),

              Text("password:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    u.password = val.trim();
                  });
                },
              ),

              Text("first name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    u.fName = val.trim();
                  });
                },
              ),

              Text("last name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    u.lName = val.trim();
                  });
                },
              ),

              RaisedButton(
                child: Text("Add User"),
                onPressed: () {
                  if(u.validate()) {
                    setState(() {
                      Data.addUser(u);
                    });
                  }
                },
              )
            ],),
          ),
          Card(
            child: Column(children: <Widget>[
              Text("name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    p.name = val.trim();
                  });
                },
              ),

              Text("address:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    p.address = val.trim();
                  });
                },
              ),

              Text("size:"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  setState(() {
                    p.size = int.tryParse(val.trim()) ?? -1;
                  });
                },
              ),

              RaisedButton(
                child: Text("Add Park"),
                onPressed: () {
                  if(p.validate()) {
                    setState(() {
                      Data.addPark(p);
                    });
                  }
                },
              )
            ],),
          )


        ],
      ),
    );
  }
}