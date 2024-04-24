import 'package:dbstructure/models/post.dart';
import 'package:dbstructure/models/user.dart';

class PostComment {
  final int id;
  final String text;
  final Post post;
  final UserProfile author;

  PostComment({this.id, this.text, this.post, this.author});
}
