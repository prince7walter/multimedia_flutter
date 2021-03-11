import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

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

// Adapted from the text form demo in official gallery app:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/text_form_field_demo.dart
class _FormulairePageState extends State<FormulairePage> {


  String _name;
  String _surname;
  String _phoneNumber;
  String _niveau;
  String _email;
  String _matricule;


  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

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
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'Entrez Le Nom ',
              labelText: 'Nom ',
            ),
            onSaved: (String value) {
              this._name = value;
              print('name=$_name');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Surname" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'Entrez Le Prénom ',
              labelText: 'Prénom ',
            ),
            onSaved: (String value) {
              this._surname = value;
              print('surname=$_surname');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Niveau" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.book),
              hintText: 'Entrez Le Niveau ',
              labelText: 'Niveau ',
            ),
            onSaved: (String value) {
              this._niveau = value;
              print('niveau=$_niveau');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Entrez une adresse mail ',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String value) {
              this._email = value;
              print('email=$_email');
            },
          ),
          const SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: '+225XX XXXX XXXX',
              labelText: 'Numéro de téléphone ',

            ),
            keyboardType: TextInputType.phone,
            onSaved: (String value) {
              this._phoneNumber = value;
              print('phoneNumber=$_phoneNumber');
            },
            // TextInputFormatters are applied in sequence.
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          const SizedBox(height: 24.0),
          // "Matricule" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.art_track_sharp),
              hintText: 'CI0120100100',
              labelText: 'Matricule ',
            ),
            onSaved: (String value) {
              this._matricule = value;
              print('matricule=$_matricule');
            },
            validator: _validateName,
          ),
          const SizedBox(height: 24.0),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                textColor: Colors.red,
                padding: EdgeInsets.all(8.0),
                onPressed: () {},
                child: Text(
                  "Annuler".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(width: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.greenAccent)),
                onPressed: _makePostRequest(),
                color: Colors.greenAccent,
                textColor: Colors.white,
                child: Text("Valider".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          )
          // "Password" form.

          // "Re-type password" form.

        ],
      ),
    );
  }

  _makePostRequest() async {
    // set up POST request arguments
    String url = 'http://localhost:8000/api/students/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = {"nom":_name, "surname":_surname, "classe":_niveau, "matricule":_matricule , "mobile":_phoneNumber, "email":_email} as String;
    // make POST request
    Response response = await post(Uri.parse(url), headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }
}


