import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbstructure/models/post.dart';
import 'package:dbstructure/models/user.dart';
import 'package:dbstructure/services/db_service.dart';
import 'package:dbstructure/services/db_service_view_model.dart';
import 'package:dbstructure/services/firebase/firebase_auth_service.dart';
import 'package:dbstructure/ui/components/standart_text.dart';
import 'package:dbstructure/ui/screens/NewProfilePage.dart';
import 'package:dbstructure/ui/screens/profilepage.dart';
import 'package:dbstructure/ui/screens/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  DatabaseService databaseService = DatabaseService();

  //var loggedInUser = firebaseAuthService

  @override
  Widget build(BuildContext context) {
    //var loggedInUser = firebaseAuthService.getCurrentUser();
    return MultiProvider(
      providers: [
        // StreamProvider<List<UserProfile>>.value(
        //   value: databaseService.getUserImages(),
        // ),
        FutureProvider<QuerySnapshot>(
          create: (_) async {
            return await FirebaseFirestore.instance.collection('users').get();
          },
          child: ProfilePage(),
        ),

        FutureProvider<DocumentSnapshot>(
          create: (_) async {
            return await FirebaseFirestore.instance
                .collection('users')
                .doc('user1')
                .get();
          },
          child: ProfilePage(),
        ),
        StreamProvider<DocumentSnapshot>(
          create: (_) {
            return FirebaseFirestore.instance
                .collection('users')
                .doc('user1')
                .snapshots();
          },
          child: ProfilePage(),
        ),
        //USERS
        StreamProvider<List<UserProfile>>(
          create: (_) {
            return FirebaseFirestore.instance
                .collection('users')
                .snapshots()
                .map((list) => list.docs
                    .map(
                      (doc) => UserProfile.fromFirestore(doc),
                    )
                    .toList());
          },
          child: ProfilePage(),
        ),
        //POSTS
        StreamProvider<List<Post>>(
          create: (_) {
            return FirebaseFirestore.instance
                .collection('posts')
                .snapshots()
                .map((list) => list.docs
                    .map(
                      (doc) => Post.fromFirestore(doc),
                    )
                    .toList());
          },
          child: ProfilePage(),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StandartText(
                text:
                    'Main Screen\nHoşgeldin\n${firebaseAuthService.loggedInUser.email}',
                //'Main Screen\nHoşgeldin\n${loggedInUser.email}', //yukarıyı uncommentlemen lazım
              ),
              CupertinoButton(
                child: StandartText(text: 'Profile'),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserProfilePage(),
                    ),
                  );
                },
              ),
              OrnekWidget(),
              CupertinoButton(
                child: StandartText(text: 'New Profile'),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => NewProfilePage(
                        nickname: 'user1',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrnekWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final documents = Provider.of<QuerySnapshot>(context)?.docs;
    // final doc = Provider.of<DocumentSnapshot>(context)?.data;
    // final snap = Provider.of<DocumentSnapshot>(context)?.data;
    final usersnap = Provider.of<List<UserProfile>>(context);
    final postsnap = Provider.of<List<Post>>(context);
    // final postsnap = Provider.of<QuerySnapshot>(context).docs;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Text('${documents[0].data()}'),
          // Text('${documents[1].data()}'),
          // Text('${documents[2].data()}'),
          // Text('${documents[3].data()}'),
          // Text('${doc().containsKey('name')}'),
          // Text('${snap()}'),
          Text('${usersnap[0].id}'),
          Text('${usersnap[1].id}'),
          Text('${usersnap[2].id}'),
          Text('${usersnap[3].id}'),
          Text('${postsnap[0].id}'),
          Text('${postsnap[1].id}'),
          Text('${postsnap[2].id}'),
          Text('${postsnap[3].id}'),
          Text('${usersnap[1].gender}'),

          ///FENAAAA.. Stream'e aşık oldum. Anlık.
        ],
      ),
    );
  }
}
