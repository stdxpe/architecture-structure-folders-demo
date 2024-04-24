import 'package:dbstructure/models/user.dart';
import 'package:dbstructure/services/db_service.dart';
import 'package:dbstructure/services/db_service_view_model.dart';
import 'package:flutter/material.dart';

class NewProfilePage extends StatelessWidget {
  final String nickname;
  NewProfilePage({this.nickname});

  final DBServiceViewModel dbServiceViewModel = DBServiceViewModel();
  final DatabaseService dBService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    // UserProfile user = dbServiceViewModel.getUserProfile(nickname: nickname);
    UserProfile user;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            StreamBuilder<UserProfile>(
                stream: dBService.getUserProfile(nickname: nickname),
                builder: (context, snapshot) {
                  user = snapshot.data;

                  return Text(user.name);
                }),
            // Text(user.name),
            //Text(user.nickname),
            // Text(user.gender),
            // Text(user.about),
            // Text('${user.profilePicture}'),
            // Text('${user.publicProfile}'),
            // Text('${user.followingsCount}'),
            // Text('${user.followersCount}'),
            // Text('${user.postsCount}'),
          ],
        ),
      ),
    );
  }
}
