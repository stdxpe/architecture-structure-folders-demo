import 'package:dbstructure/models/user.dart';
import 'package:dbstructure/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class DBServiceViewModel extends StatelessWidget {
//   final String nickname;

//   DBServiceViewModel({this.nickname});

//   DatabaseService databaseService = DatabaseService();
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<UserProfile>(
//         stream: databaseService.getUserProfile(nickname: nickname),
//         builder: (context, snapshot) {
//           UserProfile userProfile = snapshot.data;
//           return userProfile;
//         });
//   }
// }

class DBServiceViewModel {
  // final String nickname;
  // DBServiceViewModel({this.nickname});
  DatabaseService databaseService = DatabaseService();

  UserProfile getUserProfile({String nickname}) {
    UserProfile userProfile;
    StreamBuilder<UserProfile>(
        stream: databaseService.getUserProfile(nickname: nickname),
        builder: (context, snapshot) {
          userProfile = snapshot.data;

          return Text(userProfile.name);
        });
    return userProfile;
  }

  // StreamProvider<UserProfile>
}
