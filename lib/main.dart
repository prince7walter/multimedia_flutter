
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:multimedia_mob/provider/url.dart';
import 'package:multimedia_mob/view/addMore.dart';
import 'package:multimedia_mob/view/classe.dart';
import 'package:multimedia_mob/view/drawer/spDrawer.dart';
import 'package:multimedia_mob/view/l1Page.dart';
import 'package:multimedia_mob/view/newMail.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SP_APP',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
        routes: <String,WidgetBuilder>{
          '/spDrawer':(BuildContext context) => spDrawer(),
          '/classe':(BuildContext context) => classe(),
          '/etudiant':(BuildContext Context) => addMore(),

          //'/spadmin':(BuildContext context) => new drawersp(email:email,name: name),
          //'/etudiantadmin':(BuildContext context) => new draweret(email:email,name:name),
        }
    );
  }
  
}

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}


class _Home extends State<Home> {

  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController mdpController = new TextEditingController();

    Future<List> connect(String login, String mdp) async {
      var url = loginUrl;

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = '{"login":"$login","password":"$mdp"}';
      Response response = await http.post(
          Uri.parse(url), headers: headers, body: body);
      int statusCode = response.statusCode;
      //print(statusCode);
      if (statusCode == 200) {
        var rep = json.decode(response.body);
        var type = (rep["type"]);
        //var userName =(rep["nom"]);
        if (type == 1) {
          Navigator.pushReplacementNamed(context, '/spDrawer');
        } else if (type == 2) {
          Navigator.pushReplacementNamed(context, '/etudiantDrawer');
        }
      } else {
        print('erreur');
      }
    }
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.teal,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              TextFormField(
                                controller: emailController,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: "login",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (emailValue) {
                                  if (emailValue.isEmpty) {
                                    return 'Entrer votre login';
                                  }
                                  email = emailValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: mdpController,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue.isEmpty) {
                                    return 'Entrer votre pass';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      'Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.teal,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: () {connect(emailController.text, mdpController.text);},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
