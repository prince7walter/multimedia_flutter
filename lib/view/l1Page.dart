
import 'package:flutter/material.dart';
import 'package:multimedia_mob/provider/l1Provider.dart';
import 'package:multimedia_mob/model/studentData.dart';
import 'package:multimedia_mob/provider/l1Provider.dart';
import 'package:multimedia_mob/view/classe.dart';
import 'package:multimedia_mob/view/newMail.dart';
import 'package:provider/provider.dart';

class l1Page extends StatelessWidget {

  int cls;

  l1Page(a){this.cls=a;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants'),
      ),
      body: ChangeNotifierProvider<l1Provider>(
        create: (context) => l1Provider(cls),
        child: Consumer<l1Provider>(
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
                    DataColumn(label: Text('Matricule'),tooltip: 'le matricule de l\'etudiant'),
                    DataColumn(label: Text('Nom'),tooltip: 'le nom de l\'etudiant'),
                    DataColumn(label: Text('Prenom'),tooltip: 'le prenom de l\'etudiant'),
                    DataColumn(label: Text('Contact'),tooltip: 'le contact de l\'etudiant'),
                    DataColumn(label: Text('Email'),tooltip: 'l\'email de l\'etudiant'),
                  ],
                  rows: provider.data.listes.map((student_data) =>
                    DataRow(
                        cells: [
                          DataCell(Text(student_data.matricule)),
                          DataCell(Text(student_data.nom)),
                          DataCell(Text(student_data.prenom)),
                          DataCell(Text(student_data.contact)),
                          DataCell(Text(student_data.email)),
                        ]
                    )
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute<void>(
            builder:(BuildContext context) {
              return newMail(cls);}
              ),
            ),
        tooltip: 'Increment',
        child: Icon(Icons.message),

      ),
    );
  }
}

