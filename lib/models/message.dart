import 'package:dbstructure/models/conversation.dart';
import 'package:dbstructure/models/user.dart';

class Message {
  final int id;
  final String content;
  final DateTime datePosted;
  final Conversation conversation;
  final UserProfile sender;

  Message(
      {this.id, this.content, this.datePosted, this.conversation, this.sender});
}
