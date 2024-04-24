import 'package:dbstructure/services/firebase/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfileService {
  // final String name;
  // final String gender;
  // final String about;
  // final String userPicture;

  // UserProfileService({this.name, this.gender, this.about, this.userPicture});

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'name': name,
  //         'gender': gender,
  //         'about': about,
  //         'userPicture': userPicture,
  //         'sender': firebaseAuthService.loggedInUser.email,
  //         'senderuid': firebaseAuthService.loggedInUser.uid,
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  Future<void> addUserDetail({
    String nickname,
    String name,
    String gender,
    String about,
    String userPicture,
  }) {
    // Call the user's CollectionReference to add a new user
    return users
        //.doc(firebaseAuthService.loggedInUser.uid)
        .doc(nickname)
        .set({
          'name': name,
          'gender': gender,
          'about': about,
          'userPicture': userPicture,
          'email': firebaseAuthService.loggedInUser.email,
          'uid': firebaseAuthService.loggedInUser.uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Widget getUserDetail({String nickname}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(nickname).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("User: ${data['name']} ${data['about']}");
        }

        return Text("loading");
      },
    );
  }

  //TODO: Buradan başladım. 13.09.2020

  getFollowingCount({String nickname}) {
    var db = FirebaseFirestore.instance;
    return FutureBuilder(
      future: db.collection('followings').doc(nickname).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Following: ${data['followingsCount']}");
        }
      },
    );
  }

  // getFollowingCount({String nickname}) {
  //   var db = FirebaseFirestore.instance;
  //   var followings = db.collection('followings').doc(nickname).get();
  //   var data = followings.data();
  //   return Text('${data['followingsCount']}');
  // }

  Future<void> updateUserDetail({String nickname, String post}) {
    //users collection'daki herhangi bir datayı güncelleyebiliriz. post eklemek için denedim.
    // Call the user's CollectionReference to add a new user
    return users
        .doc(nickname)
        .update({
          'posts': post,
        })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
}
