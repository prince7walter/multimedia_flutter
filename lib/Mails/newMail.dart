import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class newMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Mail'),
      ),
      body: SMSPage(),
    );
  }
}

  class SMSPage extends StatefulWidget {
  const SMSPage({Key key}) : super(key: key);

  @override
  _SMSPageState createState() => _SMSPageState();
  }

  class _SMSPageState extends State<SMSPage> {


  String _name;
  String _obj;
  String _phoneNumber;


  String _validateName(String value) {
  if (value.isEmpty) return 'Name is required.';
  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
  if (!nameExp.hasMatch(value)) {
  return 'Please enter only alphabetical characters.';
  }
  return null;
  }



  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
  const SizedBox(height: 24.0),

  // "Name" form.
  TextFormField(
  textCapitalization: TextCapitalization.words,
  decoration: const InputDecoration(
  border: UnderlineInputBorder(),
  filled: true,
  icon: Icon(Icons.person),
  hintText: '',
  labelText: 'À :',
  ),
  onSaved: (String value) {
  this._name = value;
  print('name=$_name');
  },
  validator: _validateName,
  ),
  const SizedBox(height: 24.0),
  // "Phone number" form.

  // "Objet" form.
  TextFormField(
  textCapitalization: TextCapitalization.words,
  decoration: const InputDecoration(
  border: UnderlineInputBorder(),
  filled: true,
  icon: Icon(Icons.wallpaper),
  hintText: '',
  labelText: 'Objet ',
  ),
  onSaved: (String value) {
  this._obj = value;
  print('obj=$_obj');
  },
  validator: _validateName,
  ),
  const SizedBox(height: 24.0),
  // "Email" form.
  // "Life story" form.
  TextFormField(
  decoration: const InputDecoration(
  border: OutlineInputBorder(),
  hintText: '',
  helperText: '',
  labelText: 'Votre message',
  ),
  maxLines: 10,
  ),
  const SizedBox(height: 24.0),




  Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[

  RaisedButton(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.greenAccent)),
  onPressed: () {},
  color: Colors.greenAccent,
  textColor: Colors.white,
  child: Text("Envoyer".toUpperCase(),
  style: TextStyle(fontSize: 14)),
  ),
  ],
  )

  // "Salary" form.
  // "Password" form.
  // "Re-type password" form.
  ],
  ),
  );
  }
  }

