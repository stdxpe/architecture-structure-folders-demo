import 'package:dbstructure/ui/components/standart_text.dart';
import 'package:dbstructure/ui/screens/screen0.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreInitialization extends StatelessWidget {
  final Future _initialization = Firebase.initializeApp();

  // final Widget goToScreen;
  // FirebaseCoreInitialization({this.goToScreen});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return StandartText(
              text: 'An error has accured during\nDB Initialization');

        if (snapshot.connectionState == ConnectionState.done)
          // return user == null ? Screen2() : MainScreen();
          return Screen0();

        return StandartText(text: 'Please wait for\nDB Initialization');
      },
    );
  }
}
