import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //State Listener Stream,
  //Stream returns User
  void isUserSignedIn({User user, BuildContext context, Widget screen}) {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        print(
            '${user.uid} uid\'ye sahip ${user.email} kullanıcısı giriş yaptı. Navigate baba!');
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => screen,
            ));
      }
    });
  }

  createUser({String email, String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null) print('Kayıt başarılı!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signInUser({String email, String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null) print('Login başarılı!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //bu metodu anasayfada initstate içinde ya da state'ın override'ı içinde loggedInUser'a eşitleyeceğiz.
  //çünkü User döndürüyor. loggedInUser'ı anasayfada istediğin gibi kullanabilirsin.
  getCurrentUser() {
    if (_auth.currentUser != null) return _auth.currentUser;
  }

  //getCurrentUser metoduyla aynı şeyi başarıyor. hangisi daha güvenli bilmiyorum. bu getter o metod.
  User get loggedInUser => _auth.currentUser;
}
