import 'package:dbstructure/models/user.dart';

class Conversation {
  final int id;
  final String lastContent;
  final DateTime lastDatePosted;
  final List<UserProfile> participants;

  Conversation(
      {this.id, this.lastContent, this.lastDatePosted, this.participants});
}
