import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';
import 'package:uclass/app/user/user_controller.dart';
import 'package:uclass/domain/entities/user.dart';

import 'group.dart';
import 'message.dart';

class Conversation {
  final id;
  final isGroup;
  final ValueNotifier<Group> group;
  final ValueNotifier<Color> color;
  final ValueNotifier<User> user;
  final ValueNotifier<bool> isOpened;
  final ValueNotifier<DateTime> lastView;
  final ValueNotifier<bool> active;
  final ValueNotifier<List<Message>> messages;
  Conversation(
      {int id,
      bool isGroup,
      Group group,
      DateTime lastView,
      Color color,
      bool active = false,
      User user,
      bool isOpened = false,
      List<Message> messages})
      : this.id = ValueNotifier<int>(id),
        this.isGroup = ValueNotifier<bool>(isGroup),
        this.group = ValueNotifier<Group>(group),
        this.active = ValueNotifier<bool>(active),
        this.user = ValueNotifier<User>(user),
        this.color = ValueNotifier<Color>(color),
        this.lastView = ValueNotifier<DateTime>(lastView),
        this.isOpened = ValueNotifier<bool>(isOpened),
        this.messages = ValueNotifier<List<Message>>(messages ?? []);
  changeIsOpened() {
    isOpened.value = !isOpened.value;
    final controller = GetIt.I.get<ChatController>();
    controller.conversations.notifyListeners();
  }

  changeActive(bool value) {
    active.value = value;
    final controller = GetIt.I.get<ChatController>();
    controller.conversations.notifyListeners();
  }

  addMessage(Message value) {
    messages.value.add(value);
    final controller = GetIt.I.get<ChatController>();
    controller.conversations.notifyListeners();
  }

  List<Message> get orderByDateMessages {
    List<Message> list = messages.value;
    list.sort((a, b) => a.date.value.compareTo(b.date.value));
    return list;
  }

  //Falta verificar quando não tem mensagem na lista.
  DateTime get lastMessageDate => orderByDateMessages.last.date.value;
  DateTime get lastMessageDateReceivedNotView {
    final controller = GetIt.I.get<UserController>();
    List<Message> list = orderByDateMessages;
    list.reversed.toList();
    list.forEach((Message element) {
      if (!element.view.value &&
          element.userReceiveId.value == controller.user.value.id.value) {
        return element.date;
      }
    });
    return null;
  }
}
