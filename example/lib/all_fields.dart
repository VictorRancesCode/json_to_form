import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class AllFields extends StatefulWidget {
  AllFields({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _AllFields createState() => new _AllFields();
}

class _AllFields extends State<AllFields> {
  String form = json.encode({
    'title': 'Test Form Json Schema',
    'description': 'My Description',
    'fields': [
      {
        'key': 'input1',
        'type': 'Input',
        'label': 'Hi Group',
        'placeholder': "Hi Group flutter",
        'value': 'defaultValue',
        'required': true
      },
      {
        'key': 'password1',
        'type': 'Password',
        'label': 'Password',
        'required': true
      },
      {
        'key': 'email1',
        'type': 'Email',
        'label': 'Email test',
        'placeholder': "hola a todos"
      },
      {
        'key': 'tareatext1',
        'type': 'TareaText',
        'label': 'TareaText test',
        'placeholder': "hola a todos"
      },
      {
        'key': 'radiobutton1',
        'type': 'RadioButton',
        'label': 'Radio Button tests',
        'value': 2,
        'items': [
          {
            'label': "product 1",
            'value': 1,
          },
          {
            'label': "product 2",
            'value': 2,
          },
          {
            'label': "product 3",
            'value': 3,
          }
        ]
      },
      {
        'key': 'switch1',
        'type': 'Switch',
        'label': 'Switch test',
        'value': false,
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'label': 'Checkbox test',
        'items': [
          {
            'label': "product 1",
            'value': true,
          },
          {
            'label': "product 2",
            'value': false,
          },
          {
            'label': "product 3",
            'value': false,
          }
        ]
      },
      {
        'key': 'select1',
        'type': 'Select',
        'label': 'Select test',
        'value': 'product 1',
        'items': [
          {
            'label': "product 1",
            'value': "product 1",
          },
          {
            'label': "product 2",
            'value': "product 2",
          },
          {
            'label': "product 3",
            'value': "product 3",
          }
        ]
      },
    ]
  });
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
        title: new Text("All Fields"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(children: <Widget>[
            new JsonSchema(
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
                print(response);
              },
              actionSave: (data) {
                print(data);
              },
              autovalidateMode: AutovalidateMode.always,
              buttonSave: new Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: Center(
                  child: Text("Send",
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
