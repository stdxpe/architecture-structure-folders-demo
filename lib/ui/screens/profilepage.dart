import 'package:dbstructure/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dbstructure/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  final DatabaseService databaseService = DatabaseService();
  FirebaseAuth firebaseAuth;
  final UserProfile user1 = UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // StreamBuilder(stream: timeline,builder: (context, snapshot) {
                //   return snapshot.data
                // },),
                StreamBuilder(
                  stream: databaseService.streamUserProfiles(),
                  builder: (context, snapshot) {
                    List<UserProfile> list = snapshot.data;

                    return Column(
                      children: [
                        Text(snapshot.data[0].name),
                        Text(snapshot.data[1].name),
                        Text(snapshot.data[2].name),
                        Text(snapshot.data[3].name),
                        Text(list[3].name ?? 'null baba'),
                        //Text(snapshot.data[4].name),
                        // Text('${snapshot.data[0].name}'),
                      ],
                    );
                  },
                ),
                //FOLLOWERS COUNT
                StreamBuilder(
                  stream: databaseService.getFollowersCount('user1'),
                  builder: (context, snapshot) {
                    return Text('${snapshot.data.length}');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
