import 'package:uclass/domain/entities/conversation.dart';
import 'package:uclass/infra/moka/moka_users.dart';

class MokaConversations {
  final List<Conversation> conversations = [
    Conversation(id: 0, user: MokaUsers().userLogin, messages: [])
  ];
  MokaConversations();
}
