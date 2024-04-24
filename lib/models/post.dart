import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String text;
  final String image;
  final String senderUser;
  //final int likesCount;
  //final int commentsCount;
  //final User author;

  Post({
    this.id,
    this.text,
    this.image,
    this.senderUser,
  });

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Post(
      id: doc.id ?? '',
      text: data['text'] ?? '',
      image: data['image'] ?? '',
      senderUser: data['senderUser'] ?? '',
    );
  }

  //     factory Post.fromDocument(DocumentSnapshot doc) {
  //   return Post(
  //     postId: doc['postId'],
  //     ownerId: doc['ownerId'],
  //     username: doc['username'],
  //     location: doc['location'],
  //     description: doc['description'],
  //     mediaUrl: doc['mediaUrl'],
  //     likes: doc['likes'],
  //   );
  // }

  // int getLikeCount(likes) {
  //   if (likes == {}) {
  //     return 0;
  //   }

  //   int count = 0;
  //   likes.values.forEach((val) {
  //     if (val == true) {
  //       count += 1;
  //     }
  //   });
  //   return count;
  // }
}
