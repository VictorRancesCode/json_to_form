import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_to_form.dart';

class AllFieldsV1 extends StatefulWidget {
  AllFieldsV1({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _AllFieldsV1 createState() => _AllFieldsV1();
}

class _AllFieldsV1 extends State<AllFieldsV1> {
  String sendEmailForm = json.encode([
    {'type': 'Input', 'title': 'Subject', 'placeholder': "Subject"},
    {'type': 'TareaText', 'title': 'Message', 'placeholder': "Content"},
  ]);
  String form = json.encode([
    {
      'type': 'Input',
      'title': 'Hi Group',
      'placeholder': "Hi Group flutter",
      'validator': 'digitsOnly'
    },
    {
      'type': 'Password',
      'title': 'Password',
    },
    {'type': 'Email', 'title': 'Email test', 'placeholder': "hola a todos"},
    {
      'type': 'TareaText',
      'title': 'TareaText test',
      'placeholder': "hola a todos"
    },
    {
      'type': 'RadioButton',
      'title': 'Radio Button tests',
      'value': 2,
      'list': [
        {
          'title': "product 1",
          'value': 1,
        },
        {
          'title': "product 2",
          'value': 2,
        },
        {
          'title': "product 3",
          'value': 3,
        }
      ]
    },
    {
      'type': 'Switch',
      'title': 'Switch test',
      'switchValue': false,
    },
    {
      'type': 'Checkbox',
      'title': 'Checkbox test',
      'list': [
        {
          'title': "product 1",
          'value': true,
        },
        {
          'title': "product 2",
          'value': false,
        },
        {
          'title': "product 3",
          'value': false,
        }
      ]
    },
    {
      'type': 'Checkbox',
      'title': 'Checkbox test 2',
      'list': [
        {
          'title': "product 1",
          'value': true,
        },
        {
          'title': "product 2",
          'value': true,
        },
        {
          'title': "product 3",
          'value': false,
        }
      ]
    },
  ]);
  dynamic response;

  @override
  Widget build(BuildContext context) {
    print(form);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("All Fields V1"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(children: <Widget>[
            CoreForm(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              form: form,
              onChanged: (dynamic response) {
                print(response);
                this.response = response;
              },
            ),
            TextButton(
                child: const Text('Send'),
                onPressed: () {
                  print(this.response.toString());
                })
          ]),
        ),
      ),
    );
  }
}
