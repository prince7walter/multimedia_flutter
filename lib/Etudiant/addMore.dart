import 'package:flutter/material.dart';

class addMore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etudiant'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('add student'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
