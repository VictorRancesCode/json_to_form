library json_to_form;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CoreForm extends StatefulWidget {
  const CoreForm({
    @required this.form,
    @required this.onChanged,
    this.padding,
    this.form_map,
  });

  final String form;
  final dynamic form_map;
  final double padding;
  final ValueChanged<dynamic> onChanged;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(form_map ?? json.decode(form));
}

class _CoreFormState extends State<CoreForm> {
  final dynamic form_items;

  int radioValue;

  List<Widget> JsonToForm() {
    List<Widget> list_widget = new List<Widget>();

    for (var count = 0; count < form_items.length; count++) {
      Map item = form_items[count];


      if (item['type'] == "Input" ||
          item['type'] == "Password" ||
          item['type'] == "Email" ||
          item['type'] == "TareaText") {
        list_widget.add(new Container(
            padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(
              item['title'],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )));
        list_widget.add(new TextField(
          controller: null,
          decoration: new InputDecoration(
            hintText: item['placeholder'] ?? "",
          ),
          maxLines: item['type'] == "TareaText" ? 10 : 1,
          onChanged: (String value) {
            form_items[count]['response'] = value;
            _handleChanged();
          },
          obscureText: item['type'] == "Password" ? true : false,
        ));
      }

      if (item['type'] == "RadioButton") {
        list_widget.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(item['title'],
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0))));
        radioValue = item['value'];
        for (var i = 0; i < item['list'].length; i++) {
          list_widget.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(form_items[count]['list'][i]['title'])),
            new Radio<int>(
                value: form_items[count]['list'][i]['value'],
                groupValue: radioValue,
                onChanged: (int value) {
                  this.setState(() {
                    radioValue = value;
                    form_items[count]['value'] = value;
                    _handleChanged();
                  });
                })
          ]));
        }
      }

      if (item['type'] == "Switch") {
        list_widget.add(
          new Row(children: <Widget>[
            new Expanded(child: new Text(item['title'])),
            new Switch(
                value: item['switchValue'],
                onChanged: (bool value) {
                  this.setState(() {
                    form_items[count]['switchValue'] = value;
                    _handleChanged();
                  });
                })
          ]),
        );
      }

      if (item['type'] == "Checkbox") {
        list_widget.add(new Container(
            margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Text(item['title'],
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0))));
        for (var i = 0; i < item['list'].length; i++) {
          list_widget.add(new Row(children: <Widget>[
            new Expanded(
                child: new Text(form_items[count]['list'][i]['title'])),
            new Checkbox(
                value: form_items[count]['list'][i]['value'],
                onChanged: (bool value) {
                  this.setState(() {
                    form_items[count]['list'][i]['value'] = value;
                    _handleChanged();
                  });
                })
          ]));
        }
      }
    }
    return list_widget;
  }

  _CoreFormState(this.form_items);

  void _handleChanged() {
    widget.onChanged(form_items);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.all(widget.padding ?? 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: JsonToForm(),
      ),
    );
  }
}
