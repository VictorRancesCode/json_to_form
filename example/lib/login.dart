import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String form = json.encode({
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

  Map decorations = {
    'input1': const InputDecoration(
      prefixIcon: Icon(Icons.account_box),
      border: OutlineInputBorder(),
    ),
    'password1': const InputDecoration(
        prefixIcon: Icon(Icons.security), border: OutlineInputBorder()),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            const Text(
              "Login Form",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            JsonSchema(
              decorations: decorations,
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              buttonSave: Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: const Center(
                  child: Text("Login",
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
