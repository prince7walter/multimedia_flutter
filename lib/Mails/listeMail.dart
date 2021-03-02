import 'package:flutter/material.dart';

class listeMail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('les differents mails'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }

}