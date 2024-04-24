import 'package:dbstructure/services/firebase/user_profile_service.dart';
import 'package:dbstructure/ui/components/standart_text.dart';
import 'package:dbstructure/ui/screens/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMoreDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nickname;
    String name;
    String gender;
    String about;
    String userPicture;
    String post;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                onChanged: (value) {
                  gender = value;
                },
              ),
              TextField(
                onChanged: (value) {
                  about = value;
                },
              ),
              TextField(
                onChanged: (value) {
                  userPicture = value;
                },
              ),
              TextField(
                onChanged: (value) {
                  nickname = value;
                },
              ),
              //TextFormField(),
              CupertinoButton(
                onPressed: () {
                  UserProfileService userProfileService = UserProfileService();
                  userProfileService.addUserDetail(
                    nickname: nickname,
                    name: name,
                    gender: gender,
                    about: about,
                    userPicture: userPicture,
                  );
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserProfilePage(),
                    ),
                  );
                },
                //onPressed: addUser,
                child: StandartText(text: 'Save'),
              ),
              Divider(),
              TextField(
                onChanged: (value) {
                  post = value;
                },
              ),
              CupertinoButton(
                onPressed: () {
                  UserProfileService userProfileService = UserProfileService();
                  userProfileService.updateUserDetail(
                    nickname: nickname,
                    post: post,
                  );
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserProfilePage(),
                    ),
                  );
                },
                //onPressed: addUser,
                child: StandartText(text: 'Share Post via Update'),
              ),
              Divider(),
              TextField(
                onChanged: (value) {
                  post = value;
                },
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserProfilePage(),
                    ),
                  );
                },
                //onPressed: addUser,
                child: StandartText(text: 'Share Post via Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
