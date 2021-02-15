import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../functions.dart';

class SimpleText extends StatefulWidget {
  SimpleText({
    Key key,
    @required this.item,
    @required this.onChange,
    @required this.position,
    this.errorMessages = const {},
    this.validations = const {},
    this.decorations = const {},
    this.keyboardTypes = const {},
  }) : super(key: key);
  final dynamic item;
  final Function onChange;
  final int position;
  final Map errorMessages;
  final Map validations;
  final Map decorations;
  final Map keyboardTypes;

  @override
  _SimpleText createState() => new _SimpleText();
}

class _SimpleText extends State<SimpleText> {
  dynamic item;

  String isRequired(item, value) {
    if (value.isEmpty) {
      return widget.errorMessages[item['key']] ?? 'Please enter some text';
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    Widget label = SizedBox.shrink();
    if (Fun.labelHidden(item)) {
      label = new Container(
        child: new Text(
          item['label'],
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      );
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label,
          new TextFormField(
            controller: null,
            initialValue: item['value'] ?? null,
            decoration: item['decoration'] ??
                widget.decorations[item['key']] ??
                new InputDecoration(
                  hintText: item['placeholder'] ?? "",
                  helperText: item['helpText'] ?? "",
                ),
            maxLines: item['type'] == "TextArea" ? 10 : 1,
            onChanged: (String value) {
              item['value'] = value;
              // _handleChanged();
            //  print(value);
              widget.onChange(widget.position, value);
            },
            obscureText: item['type'] == "Password" ? true : false,
            keyboardType: item['keyboardType'] ??
                widget.keyboardTypes[item['key']] ??
                TextInputType.text,
            validator: (value) {
              if (widget.validations.containsKey(item['key'])) {
                return widget.validations[item['key']](item, value);
              }
              if (item.containsKey('validator')) {
                if (item['validator'] != null) {
                  if (item['validator'] is Function) {
                    return item['validator'](item, value);
                  }
                }
              }
              if (item['type'] == "Email") {
                return Fun.validateEmail(item, value);
              }

              if (item.containsKey('required')) {
                if (item['required'] == true ||
                    item['required'] == 'True' ||
                    item['required'] == 'true') {
                  return isRequired(item, value);
                }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
