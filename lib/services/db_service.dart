import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbstructure/models/post.dart';
import 'package:dbstructure/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  //TODO : bu class uid ctor almalı.

  Future<UserProfile> getUser(String id) async {
    var snap = await _db.collection('users').doc(id).get();

    return UserProfile.fromFirestore(snap);
  }

  Stream<List<UserProfile>> getFollowersCount(String id) {
    var snap = _db.collection('users').doc(id).collection('followers');

    return snap.snapshots().map((list) =>
        list.docs.map((doc) => UserProfile.fromFirestore(doc)).toList());
  }

  Stream<DocumentSnapshot> getRefBaba(String id) {
    var snap = _db.collection('users').doc(id).collection('followers');

    return snap.doc('selma123').snapshots();
  }
  // Future<List<UserProfile>> getUserList() async {
  //   var snap = await _db.collection('users').get();

  //   //return snap.docs.map((doc) => UserProfile.fromFirestore(doc));
  //   //return snap.docs.map(UserProfile.fromFirestore());
  //   //List<UserProfile>.from(elements);
  // }

//TODO: buraya çalış. Profil image'ları doldurma yolu burada.
  Stream<List<UserProfile>> getUserImages() {
    var ref = _db.collection('users');

    return ref.snapshots().map((list) => list.docs
        .map(
          (doc) => UserProfile.fromFirestore(doc),
        )
        .toList());
  }

  //collection.where createdAt kullanıcaz unutma.
  // .collection('users').orderBy('createdAt', descending: true).get()
  //.collection('users').limit(5).get()
  //followersCount'ı Transactions'lar ile kaydediyoruz db'ye.

  //Get a stream of a single document
  Stream<Post> postStream(String id) {
    return _db
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => Post.fromFirestore(snap));
    //.map((snap) {  return Post.fromFirestore(snap); });  ////aynı şey
  }

  // //Get a stream of a single document
  // Stream<UserProfile> userStream(String id) {
  //   return _db
  //       .collection('users')
  //       .snapshots()
  //       .map((snap) => UserProfile.fromFirestore(snap));
  // }

  //Query a subcollection
  Stream<List<UserProfile>> streamUserProfiles() {
    var ref = _db.collection('users');
    // var ref = _db.collection('users').get();
    //  var snap = await _db.collection('users').doc(id).get();

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => UserProfile.fromFirestore(doc)).toList());
  }

  //Query a subcollection
  Stream<List<Post>> streamPosts(User user) {
    var ref = _db.collection('users').doc('yasin123').collection('posts');

    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

//////////////////////////////
  Stream<List<Post>> getPostsFromPostsCollection({String uid}) {
    var ref = _db.collection('posts').where('author' '==' '$uid');

    return ref.snapshots().map((list) => list.docs
        .map(
          (doc) => Post.fromFirestore(doc),
        )
        .toList());
  }

  getPostsFromUsersFollowings({String nickname}) {
    var ref = _db.collection('users').doc(nickname).collection('followings');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => getPostsFromPostsCollection(uid: doc.id)));
  }

  ////////////////////////////////
  ///Kullanıcı profili doldururken;
  ///
  Stream<UserProfile> getUserProfile({String nickname}) {
    var ref = _db.collection('users').doc(nickname);

    return ref.snapshots().map(
          (snap) => UserProfile.fromFirestore(snap),
        );
    // return UserProfile.fromFirestore(ref);
  }
}
