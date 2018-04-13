# json_to_form

A flutter plugin to use convert Json to Form
* [Example](https://github.com/VictorRancesCode/json_to_form/tree/master/example)


<p align="center">
  <img src="image1.png" width="350"/>
  <img src="image2.png" width="350"/>
</p>


## Instalation
* Import it Now in your Dart code, you can use:
```
 import 'package:json_to_form/json_to_form.dart'; 
```
## Usage
* TextField
```
  String form = json.encode([
    {
      'type': 'Input',
      'title': 'Hi Group',
      'placeholder': "Hi Group flutter"
    },
    {
      'type': 'Password',
      'title': 'Password',
    },
    {
      'type': 'Email', 
      'title': 'Email test',
      'placeholder': "hola a todos"
    },
    {
      'type': 'TareaText',
      'title': 'TareaText test',
      'placeholder': "hola a todos"
    },
  ]);
```
* Radio
```
 String form = json.encode([
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
  ]);
```
* Switch
```
String form = json.encode([
    {
      'type': 'Switch',
      'title': 'Switch test',
      'switchValue': false,
    },
  ]);
```
* Checkbox
```
String form = json.encode([
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
```



* Example
``` 
 String form_send_email = json.encode([
    {'type': 'Input', 'title': 'Subject', 'placeholder': "Subject"},
    {'type': 'TareaText', 'title': 'Message', 'placeholder': "Content"},
  ]);
 dynamic response;
 
 @override
   Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text(widget.title),
       ),
       body: new SingleChildScrollView(
         child: new Container(
           child: new Column(children: <Widget>[
             new CoreForm(
               form: form,
               onChanged: (dynamic response) {
                 this.response = response;
               },
             ),
             new RaisedButton(
                 child: new Text('Send'),
                 onPressed: () {
                   print(this.response.toString());
                 })
           ]),
         ),
       ),
     );
   }
```
## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).

