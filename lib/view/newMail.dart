import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class newMail extends StatelessWidget {

  int cls;

  newMail(int cls){this.cls=cls;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Message'),
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

  String _object;
  String _corps;

  @override
  Widget build(BuildContext context) {
    TextEditingController objectController = new TextEditingController();
    TextEditingController corpsController = new TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 34.0),

          // "Objet" form.
          TextFormField(
            controller: objectController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.wallpaper),
              hintText: '',
              labelText: 'Objet ',
            ),
          ),
          const SizedBox(height: 35.0),
          // "Email" form.
          // "Life story" form.
          TextFormField(
            controller: corpsController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '',
              helperText: '',
              labelText: 'Votre message',
            ),
            maxLines: 15,
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
        ],
      ),
    );
  }
}

