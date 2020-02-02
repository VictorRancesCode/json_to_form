import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  String form = json.encode({
    'autoValidated': false,
    'fields': [
      {
        'key': 'input1',
        'type': 'Input',
        'label': 'Username',
        'placeholder': "Enter Your Username",
        'required': true
      },
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Password',
        'required': true
      },
    ]
  });
  dynamic response;


  Map decorations={
    'input1':InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        border: OutlineInputBorder(),
    ),
    'password1':InputDecoration(
        prefixIcon: Icon(Icons.security),
        border: OutlineInputBorder()
    ),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            new Text("Login Form",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            new JsonSchema(
              decorations: decorations,
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
              },
              buttonSave: new Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: Center(
                  child: Text("Login",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
