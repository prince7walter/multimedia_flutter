import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:multimedia_mob/main.dart';
import 'package:multimedia_mob/provider/url.dart';


class addMore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Etudiant'),
        ),
        body:FormulairePage()
    );
  }
}

// Formulaire pour enregistrer Etudiants FormulairePage
class FormulairePage extends StatefulWidget {
  const FormulairePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormulairePageState();
}


class _FormulairePageState extends State<FormulairePage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController matController = new TextEditingController();
  TextEditingController mobController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController classeController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            controller: nameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'Entrez Le Nom ',
              labelText: 'Nom ',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Surname" form.
          TextFormField(
            controller: surnameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'Entrez Le Prénom ',
              labelText: 'Prénom ',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Niveau" form.
          TextFormField(
            controller: classeController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.book),
              hintText: 'Entrez Le Niveau ',
              labelText: 'Niveau ',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            controller: mailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Entrez une adresse mail ',
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Phone number" form.

          TextFormField(
            controller: mobController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'XX XXXX XXXX',
              labelText: 'Numéro de téléphone ',
            ),
            keyboardType: TextInputType.phone,
            // TextInputFormatters are applied in sequence.
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          const SizedBox(height: 24.0),
          // "Matricule" form.

          //mi
          TextFormField(
            controller: matController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.art_track_sharp),
              hintText: 'CI0120100100',
              labelText: 'Matricule ',
            ),
          ),
          const SizedBox(height: 24.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.greenAccent)),
                onPressed: () {
                  makePostRequest(nameController.text,surnameController.text,classeController.text,
                      matController.text,mobController.text,mailController.text);
                },
                color: Colors.greenAccent,
                textColor: Colors.white,
                child: Text("Valider".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          )
        ],
      ),
    );
  }


  Future<void> makePostRequest(String nom,String pre,String niv,String mat,String pho,String ml) async {
    // set up POST request arguments
    var url = addUrl;

    Map<String, String> headers = {'Content-type': 'application/json'};
    String json = '{"name":"$nom", "surname":"$pre", "classe":"$niv", "matricule":"$mat" , "mobile":"$pho", "email":"$ml"}';
    // make POST request
    Response response = await post(Uri.parse(url), headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
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
}

