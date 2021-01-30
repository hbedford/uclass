import 'package:flutter/cupertino.dart';
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
  final ValueNotifier<List<Message>> messages;
  Conversation(
      {int id,
      bool isGroup,
      Group group,
      Color color,
      User user,
      bool isOpened,
      List<Message> messages})
      : this.id = ValueNotifier<int>(id),
        this.isGroup = ValueNotifier<bool>(isGroup),
        this.group = ValueNotifier<Group>(group),
        this.user = ValueNotifier<User>(user),
        this.color = ValueNotifier<Color>(color),
        this.isOpened = ValueNotifier<bool>(isOpened),
        this.messages = ValueNotifier<List<Message>>(messages);
  changeIsOpened() => isOpened.value = !isOpened.value;
  addMessage(Message value) => messages.value.add(value);
  List<Message> get orderByDateMessages {
    List<Message> list = messages.value;
    list.sort((a, b) => a.date.value.compareTo(b.date.value));
    return list;
  }
}
