import 'package:dbstructure/services/firebase/firebase_auth_service.dart';
import 'package:dbstructure/ui/components/standart_text.dart';
import 'package:dbstructure/ui/screens/mainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StandartText(
                text: 'DB Structure\nScreen One\nSign Up',
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
              ),
              CupertinoButton(
                onPressed: () async {
                  await firebaseAuthService.createUser(
                    email: email,
                    password: password,
                  );
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ));
                  // firebaseAuthService.isUserSignedIn(
                  //   user: user,
                  //   context: context,
                  //   screen: MainScreen(),
                  // );
                },
                child: StandartText(text: 'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
