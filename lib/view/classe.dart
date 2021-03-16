import 'package:flutter/material.dart';

import 'l1Page.dart';


class classe extends StatelessWidget{

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
                  onPressed: () => Navigator.push(context,
                    MaterialPageRoute<void>(
                        builder:(BuildContext context) {
                          return l1Page(1);}
                    ),
                  )
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
                  onPressed: () => Navigator.push(context,
                    MaterialPageRoute<void>(
                        builder:(BuildContext context) {
                          return l1Page(2);}
                    ),
                  )
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
                  onPressed: () => Navigator.push(context,
                    MaterialPageRoute<void>(
                        builder:(BuildContext context) {
                          return l1Page(3);}
                    ),
                  )
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
                  onPressed: () => Navigator.push(context,
                    MaterialPageRoute<void>(
                        builder:(BuildContext context) {
                          return l1Page(4);}
                    ),
                  )
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
                  onPressed: () => Navigator.push(context,
                        MaterialPageRoute<void>(
                        builder:(BuildContext context) {
                          return l1Page(5);}
                    ),
                  )
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
                  }
              ),
            )
          ]
      ),
    );
  }
}
