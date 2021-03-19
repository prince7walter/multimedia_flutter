
import 'package:flutter/material.dart';
import 'package:multimedia_mob/provider/inboxProvider.dart';
import 'package:multimedia_mob/model/inboxData.dart';
import 'package:multimedia_mob/provider/inboxProvider.dart';
import 'package:multimedia_mob/view/classe.dart';
import 'package:multimedia_mob/view/newMail.dart';
import 'package:provider/provider.dart';

class inboxPage extends StatelessWidget {

  var etd;

  inboxPage(a){this.etd=a;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des messages reçus'),
      ),
      body: ChangeNotifierProvider<inboxProvider>(
        create: (context) => inboxProvider(etd),
        child: Consumer<inboxProvider>(
          builder: (context,provider,child){
            if(provider.data==null){
              provider.getData(context);
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Objet'),tooltip: 'le matricule de l\'etudiant'),
                    DataColumn(label: Text('Message'),tooltip: 'le nom de l\'etudiant'),
                    DataColumn(label: Text('Date'),tooltip: 'le prenom de l\'etudiant'),
                  ],
                  rows: provider.data.listes.map((inbox_data) =>
                      DataRow(
                          cells: [
                            DataCell(Text(inbox_data.object)),
                            DataCell(Text(inbox_data.corps)),
                            DataCell(Text(inbox_data.createdAt)),
                          ]
                      )
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

