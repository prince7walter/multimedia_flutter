import 'package:flutter/material.dart';
import 'package:multimedia_mob/main.dart';

class spDrawer extends StatefulWidget
{
  var userName;
  var userMail;
  spDrawer(userName, userMail){this.userName=userName; this.userMail=userMail;}

  @override
  State<StatefulWidget> createState() {
    return _spDrawer(userName,userMail);
  }
}



class _spDrawer extends State<spDrawer>
{

  var userName;
  var userMail;
  _spDrawer(userName, userMail){this.userName=userName; this.userMail=userMail;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('DashBord'),
      ),
      drawer: drawer(userName,userMail), // Drawer
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
  drawer(userName, userMail){this.userName=userName; this.userMail=userMail;}

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
            leading: Icon(Icons.people_outline),
            title: const Text('Classes'),
            onTap: () => Navigator.pushNamed(context,'/classe'),
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: const Text('Etudiants'),
            onTap: () => Navigator.pushNamed(context,'/etudiant'),
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
