import 'package:flutter/material.dart';
import 'package:multimedia_mob/Classe/listeC.dart';
import 'package:multimedia_mob/Etudiant/addMore.dart';
import 'package:multimedia_mob/Mails/listeMail.dart';
import 'package:multimedia_mob/Menu/drawer.dart';
import 'package:multimedia_mob/SMS/listeSms.dart';
import 'package:multimedia_mob/Mails/newMail.dart';
import 'package:multimedia_mob/SMS/newSms.dart';
import 'package:multimedia_mob/login.dart';


void main ()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      title: 'Manager Tool\'s',
      theme: new ThemeData(
          primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/home': (context) => Home(),
        '/classe': (context) => listeC(),
        '/etudiant': (context) => addMore(),
        '/mail': (context) => listeMail(),
        '/sms': (context) => listeSms(),
        '/newmail': (context) => newMail(),
        '/newsms': (context) => newSms(),


      },
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

class _Home extends State<Home>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          title: new Text('DashBord'),
        ),
        drawer: drawer(), // Drawer
       body: const Center(
          child: Text('ICI LE DASHBORD ET AUTRE TOUT CA'),
      ),
    );
  }
}