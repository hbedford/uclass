import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/conversation.dart';

class ChatController {
  final ValueNotifier<List<Conversation>> conversations;
  final notification;
  final LayerLink link = LayerLink();
  /* final ValueNotifier<Conversation> conversation; */

  ChatController(
      {List<Conversation> conversations,
      bool notification = true,
      Conversation conversation})
      : this.conversations =
            ValueNotifier<List<Conversation>>(conversations ?? []),
        this.notification = ValueNotifier<bool>(
            notification) /* ,
        this.conversation = ValueNotifier<Conversation>(conversation) */
  ;
  addConversation(Conversation c) => conversations.value.add(c);
  changeNotification(bool n) => notification.value = n;
  /* changeConversation(Conversation value) => conversation.value = value; */

  List<Conversation> get conversationsOrderByView {
    List<Conversation> list = conversations.value;
    list.sort((a, b) =>
        a.lastMessageDateReceived.compareTo(b.lastMessageDateReceived));
    return list;
  }

  List<Conversation> get activeConversations {
    List<Conversation> list = [];
    list.addAll(conversations.value);
    list.removeWhere((element) => element.active.value == false);
    return list;
  }

  List<Conversation> get disableConversations {
    List<Conversation> list = [];
    list.addAll(conversationsOrderByView);
    list.removeWhere((element) => element.active.value == true);
    return list;
  }
}
