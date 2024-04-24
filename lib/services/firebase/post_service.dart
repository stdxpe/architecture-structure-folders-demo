import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_auth_service.dart';

class PostService {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  Future<void> addPost(
      {String nickname,
      String text,
      String postImage,
      DocumentReference reference}) {
    // Call the user's CollectionReference to add a new user
    return posts
        //.doc(firebaseAuthService.loggedInUser.uid)
        .doc(nickname)
        .set({
          'text': text,
          'image': postImage,
          'sender': firebaseAuthService.loggedInUser.uid,
          'reference': reference,
        })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
}
