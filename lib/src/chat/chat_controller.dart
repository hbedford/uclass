import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/conversation_model.dart';

class ChatController {
  final ValueNotifier<List<ConversationModel>> conversations;
  final notification;
  ChatController(
      {List<ConversationModel> conversations, bool notification = true})
      : this.conversations =
            ValueNotifier<List<ConversationModel>>(conversations),
        this.notification = ValueNotifier<bool>(notification);
  addConversation(ConversationModel c) => conversations.value.add(c);
  changeNotification(bool n) => notification.value = n;
}
