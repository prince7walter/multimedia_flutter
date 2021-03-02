import 'package:flutter/material.dart';

class listeSms extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('les differents sms'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}