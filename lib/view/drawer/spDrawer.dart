import 'package:flutter/material.dart';

class spDrawer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _spDrawer();
  }
}



class _spDrawer extends State<spDrawer>
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

class drawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Super Admin'),
            accountEmail: Text('adname@super.com'),
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
        ],
      ),
    );
  }
}
