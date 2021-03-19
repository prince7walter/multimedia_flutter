import 'package:flutter/material.dart';
import 'package:multimedia_mob/view/inboxPage.dart';

import '../../main.dart';

class stdDrawer extends StatefulWidget
{

  var userName;
  var userMail;
  var id;
  stdDrawer(userName, userMail, id){this.userName=userName; this.userMail=userMail; this.id=id;}

  @override
  State<StatefulWidget> createState() {
    return _stdDrawer(userName,userMail,id);
  }
}

class _stdDrawer extends State<stdDrawer>
{
  var userName;
  var userMail;
  var id;
  _stdDrawer(userName, userMail, id){this.userName=userName; this.userMail=userMail; this.id=id;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('DashBord'),
      ),
      drawer: drawer(userName,userMail,id), // Drawer
      body: const Center(
        child: Text('ICI LE DASHBORD ET AUTRE TOUT CA'),
      ),
    );
  }
}

class drawer extends StatelessWidget
{
  var userName;
  var userMail;
  var id;
  drawer(userName, userMail, id){this.userName=userName; this.userMail=userMail; this.id=id;}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userMail),
            currentAccountPicture: CircleAvatar(
              child: Image.asset('user.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: const Text('Boite de réception'),
            onTap: () => Navigator.push(context,
              MaterialPageRoute<void>(
                  builder:(BuildContext context) {
                    return inboxPage(id);}
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Deconnexion'),
            onTap: () => Navigator.push(context,
              MaterialPageRoute<void>(
                  builder:(BuildContext context) {
                    return Home();}
              ),
            ),
          ),
        ],
      ),
    );
  }
}