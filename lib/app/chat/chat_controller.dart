import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/conversation.dart';

class ChatController {
  final ValueNotifier<List<Conversation>> conversations;
  final notification;
  ChatController({List<Conversation> conversations, bool notification = true})
      : this.conversations = ValueNotifier<List<Conversation>>(conversations),
        this.notification = ValueNotifier<bool>(notification);
  addConversation(Conversation c) => conversations.value.add(c);
  changeNotification(bool n) => notification.value = n;
}
