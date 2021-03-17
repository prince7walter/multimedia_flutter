import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multimedia_mob/main.dart';
import 'package:multimedia_mob/provider/url.dart';

class newMail extends StatelessWidget {

  int cls;

  newMail(int cls){ this.cls=cls;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Message'),
      ),
      body: SMSPage(cls),
    );
  }
}

class SMSPage extends StatefulWidget {

  int cls;
  SMSPage(int cls,  {Key key}) {this.cls= cls; }

  @override
  _SMSPageState createState() => _SMSPageState(cls);
}

class _SMSPageState extends State<SMSPage> {

  String _object;
  String _corps;


  int cls;

  _SMSPageState(int cls){this.cls=cls;}


  @override
  Widget build(BuildContext context) {
    TextEditingController objectController = new TextEditingController();
    TextEditingController corpsController = new TextEditingController();

    Future<List> send(String object, String corps) async {
      var url = messageUrl;

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = '{"classe":$cls,"object":"$object","corps":"$corps"}';
      http.Response response = await http.post(
          Uri.parse(url), headers: headers, body: body);
      int statusCode = response.statusCode;
      //print(statusCode);
      if (statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute<void>(
            builder:(BuildContext context) {
          return Home();}
          ),
        );
      }else {
        print('erreur');
      }
    }

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
                onPressed: () { send(objectController.text, corpsController.text);},
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

