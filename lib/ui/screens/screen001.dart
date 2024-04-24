import 'package:dbstructure/ui/screens/mainscreen.dart';
import 'package:dbstructure/ui/screens/screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen001 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return user == null ? Screen2() : MainScreen();
  }
}
