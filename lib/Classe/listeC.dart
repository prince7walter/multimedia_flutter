import 'package:flutter/material.dart';


class listeC extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classe'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.

        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: [

          Center(
              child:  FlatButton(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 0, bottom: 0, left: 0, right: 0),
                  child: Text(
                     'Licence1',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                color: Colors.teal,
                disabledColor: Colors.grey,
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(10.0)),
                onPressed: () => Navigator.pushNamed(context, '/student')
              ),
          ),

          Center(
            child:  FlatButton(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 0),
                child: Text(
                  'Licence2',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              color: Colors.teal,
              disabledColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(10.0)),
              onPressed:  () => Navigator.pushNamed(context, '/student')
            ),
          ),
          Center(
            child:  FlatButton(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 0),
                child: Text(
                  'Licence3',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              color: Colors.teal,
              disabledColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(10.0)),
              onPressed: () => Navigator.pushNamed(context, '/student')
            ),

          ),
          Center(
            child:  FlatButton(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 0),
                child: Text(
                  'Master1',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              color: Colors.teal,
              disabledColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(10.0)),
              onPressed: () => Navigator.pushNamed(context, '/student')
            ),
          ),
          Center(
            child:  FlatButton(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 0),
                child: Text(
                  'Master2',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              color: Colors.teal,
              disabledColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(10.0)),
              onPressed: () => Navigator.pushNamed(context, '/student')
            ),
          ),
          Center(
    child:  FlatButton(
    child: Padding(
    padding: EdgeInsets.only(
    top: 0, bottom: 0, left: 0, right: 0),
    child: Text(
    'Add More',
    textDirection: TextDirection.ltr,
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    ),
    ),
    ),
    color: Colors.teal,
    disabledColor: Colors.grey,
    shape: new RoundedRectangleBorder(
    borderRadius:
    new BorderRadius.circular(10.0)),
    onPressed: () {
    if (_formKey.currentState.validate()) {
    //_login();
    }
    },
    ),
          )
        ]
      ),
    );
  }
}

class LoginExample2 extends StatefulWidget {
  const LoginExample2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginExampleState();

}


class _LoginExampleState extends State<LoginExample2> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(''),
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children : <Widget>[
          const SizedBox(height: 24.0),
          // "Name" form.
          const SizedBox(height: 24.0),


          const SizedBox(height: 24.0),
          // "Password" form.

          const SizedBox(height: 24.0),
          // "Re-type password" form.
          ButtonBar(

            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _showSnack,
                child: const Text('Licence 1'),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _showSnack,
                child: const Text('Licence 2'),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _showSnack,
                child: const Text('Licence 3'),
              ),
            ],
          ),

          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _showSnack,
                child: const Text('Master  1'),
              ),
            ],
          ),

          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _showSnack,
                child: const Text('Master  2'),
              ),
            ],
          ),



        ],
      ),
    );
  }
}
