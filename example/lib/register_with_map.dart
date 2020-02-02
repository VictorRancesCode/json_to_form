import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class RegisterMap extends StatefulWidget {
  RegisterMap({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RegisterMap createState() => new _RegisterMap();
}

class _RegisterMap extends State<RegisterMap> {
  Map form = {
    'autoValidated': false,
    'fields': [
      {
        'key': 'name',
        'type': 'Input',
        'label': 'Name',
        'placeholder': "Enter Your Name",
        'required': true,
      },
      {
        'key': 'username',
        'type': 'Input',
        'label': 'Username',
        'placeholder': "Enter Your Username",
        'required': true,
        'decoration': InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
        ),
      },
      {
        'key': 'email',
        'type': 'Email',
        'label': 'email',
        'required': true,
        'decoration': InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      },
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Password',
        'required': true,
        'decoration': InputDecoration(
            prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
      },
    ]
  };
  dynamic response;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Register Form with Map"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(children: <Widget>[
            new Container(
              child: new Text(
                "Register Form With Map",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(top: 10.0),
            ),
            new JsonSchema(
              formMap: form,
              onChanged: (dynamic response) {
                this.response = response;
                print(response);
              },
              actionSave: (data) {
                print(data);
              },
              buttonSave: new Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: Center(
                  child: Text("Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
