import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String name;
  final String nickname;
  final String gender;
  final String about;
  final String profilePicture;
  final bool publicProfile;
  final int followingsCount;
  final int followersCount;
  final int postsCount;
  // final List<User> followings;
  // final List<User> followers;
  //final int postLikes;
  //final DateTime dateOfBirth;
  //final String location;
  //final Geoposition location;

  UserProfile(
      {this.id,
      this.name,
      this.nickname,
      this.gender,
      this.about,
      this.profilePicture,
      this.publicProfile,
      this.followingsCount,
      this.followersCount,
      this.postsCount});

  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserProfile(
      id: doc.id,
      name: data['name'] ?? '',
      nickname: data['nickname'] ?? '',
      gender: data['gender'] ?? '',
      about: data['about'] ?? '',
      profilePicture: data['userPicture'] ?? '',
      publicProfile: data['publicProfile'] ?? true,
      followingsCount: data['followingsCount'] ?? 0,
      followersCount: data['followersCount'] ?? 0,
      postsCount: data['postsCount'] ?? 0,
    );
  }

  //TODO toJSON method yaz. createUser metodu için. ref.collection('users').document(user.id).setData(user.toJson); gibi

  //Fireship.io : Deserialize our data from a map into an actual dart class. (engin dbcontext yapısı?)
  //Because firestore always returns data as a map
  //https://www.youtube.com/watch?v=vFxk_KJCqgk&list=PL0vfts4VzfNiQYtnn1TZ6U0Ec_vjCN9VY&index=8&ab_channel=Fireship dk 7

  //     factory User.fromDocument(DocumentSnapshot doc) {
  //   return User(
  //       id: doc['id'],
  //       username: doc['username'],
  //       email: doc['email'],
  //       displayName: doc['displayName'],
  //       photoUrl: doc['photoUrl'],
  //       bio: doc['bio']);
  // }
}
