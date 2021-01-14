import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/conversation_model.dart';

class ChatController {
  final ValueNotifier<List<ConversationModel>> conversations;
  ChatController({List<ConversationModel> conversations})
      : this.conversations =
            ValueNotifier<List<ConversationModel>>(conversations);
  addConversation(ConversationModel c) => conversations.value.add(c);
}
