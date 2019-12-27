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

  String username = "";
  String pass = "";
  String fName = "";
  String lName = "";

  String name = "";
  String address = "";
  double size = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Column(children: <Widget>[
              Text("username:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    username = val.trim();
                  });
                },
              ),

              Text("password:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    pass = val.trim();
                  });
                },
              ),

              Text("first name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    fName = val.trim();
                  });
                },
              ),

              Text("last name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    lName = val.trim();
                  });
                },
              ),

              RaisedButton(
                child: Text("Add User"),
                onPressed: () {
                  if(username.isNotEmpty && pass.isNotEmpty && fName.isNotEmpty && lName.isNotEmpty && Data.getUser(username) == null) {
                    setState(() {
                      Data.addUser(new User(username: username,password: pass,fName: fName,lName: lName));
                    });
                  }
                },
              ),
              SizedBox(height: 30,),

              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: Data.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(Data.users[index].username + " -> " + Data.users[index].fName + " " + Data.users[index].lName)
                      );
                    }),
              )
            ],),
          ),
          Card(
            child: Column(children: <Widget>[
              Text("name:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    name = val.trim();
                  });
                },
              ),

              Text("address:"),
              TextField(
                onChanged: (val) {
                  setState(() {
                    address = val.trim();
                  });
                },
              ),

              Text("size:"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  setState(() {
                    size = int.tryParse(val.trim()) ?? -1;
                  });
                },
              ),

              RaisedButton(
                child: Text("Add Park"),
                onPressed: () {
                  if(name.isNotEmpty && address.isNotEmpty && size > -1 && Data.getPark(name) == null) {
                    setState(() {
                      Data.addPark(new Park(address,size,name));
                    });
                  }
                },
              ),

              SizedBox(height: 30,),

              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: Data.parks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(Data.parks[index].name)
                      );
                    })
              )
            ],),

          )


        ],
      ),
    );
  }
}