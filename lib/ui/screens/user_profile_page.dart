import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbstructure/services/firebase/user_profile_service.dart';
import 'package:dbstructure/ui/components/standart_text.dart';
import 'package:dbstructure/ui/screens/add_more_detail.dart';
import 'package:dbstructure/ui/screens/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  // final String documentId;
  // UserProfilePage(this.documentId);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    UserProfileService userProfileService = UserProfileService();
    //final documents = Provider.of<QuerySnapshot>(context)?.docs;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StandartText(
              text: 'Hello'
              //'Main Screen\nHoşgeldin\n${firebaseAuthService.loggedInUser.email}',
              //'Main Screen\nHoşgeldin\n${loggedInUser.email}', //yukarıyı uncommentlemen lazım
              ,
            ),
            // userProfileService.getUserDetail(
            //     nickname: firebaseAuthService.loggedInUser.uid),
            userProfileService.getUserDetail(nickname: 'yasin123'),
            userProfileService.getFollowingCount(nickname: 'yasin123'),

            CupertinoButton(
              child: StandartText(text: 'Add more detail'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => AddMoreDetail(),
                  ),
                );
              },
            ),
            CupertinoButton(
              child: StandartText(text: 'User Profile JeffStyle'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            CupertinoButton(
              child: StandartText(text: 'See timeline'),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   new MaterialPageRoute(
                //     builder: (context) => AddMoreDetail(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
