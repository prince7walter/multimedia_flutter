
import 'package:flutter/material.dart';
import 'package:multimedia_mob/Classe/listeC.dart';


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
            ListTile(
                leading: Icon(Icons.email_rounded),
                title: const Text('Mails'),
              onTap: () => Navigator.pushNamed(context,'/mail'),
            ),
            ListTile(
                leading: Icon(Icons.message),
                title: const Text('SMS'),
              onTap: () => Navigator.pushNamed(context,'/sms'),
            ),
          ],
        ),
    );
  }
}