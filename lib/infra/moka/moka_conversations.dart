import 'package:uclass/domain/entities/conversation.dart';
import 'package:uclass/domain/entities/message.dart';
import 'package:uclass/infra/moka/moka_users.dart';

class MokaConversations {
  final List<Conversation> conversations = [
    Conversation(
        id: 0,
        active: false,
        user: MokaUsers().userLogin,
        messages: [
          Message(
              id: 0,
              userSenderId: 1,
              userReceiveId: 0,
              view: false,
              message: 'Teste',
              date: DateTime(2021, 02, 01))
        ],
        lastView: DateTime.now())
  ];
  MokaConversations();
}
