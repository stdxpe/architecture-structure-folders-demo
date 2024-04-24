import 'package:dbstructure/services/db_service.dart';
import 'package:dbstructure/ui/screens/screen001.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen0 extends StatelessWidget {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: FirebaseAuth.instance.authStateChanges(),
        ),
        // StreamProvider<List<Post>>.value(
        //   value: databaseService.streamPosts(FirebaseAuth.instance.currentUser),
        //   child: ProfilePage(),
        // ),
        // StreamProvider<List<UserProfile>>.value(
        //   value: databaseService.getUserImages(),
        //   child: ProfilePage(),
        // ),
      ],
      child: Screen001(),
    );
  }
}
