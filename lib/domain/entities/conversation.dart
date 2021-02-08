import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';
import 'package:uclass/app/user/user_controller.dart';
import 'package:uclass/domain/entities/user.dart';
import 'package:uclass/src/utils/date_convert.dart';

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
  final ValueNotifier<TextEditingController> message =
      ValueNotifier<TextEditingController>(TextEditingController());
  Conversation(
      {@required int id,
      bool isGroup,
      Group group,
      @required DateTime lastView,
      Color color,
      bool active = false,
      @required User user,
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

  changeActive() {
    active.value = !active.value;
    final controller = GetIt.I.get<ChatController>();
    controller.conversations.notifyListeners();
  }

  addMessage() {
    if (message.value.text.length > 0) {
      messages.value.add(Message(
          id: messages.value.last.id.value + 1,
          userSenderId: 0,
          userReceiveId: 1,
          view: true,
          message: message.value.text,
          date: DateTime.now()));
      message.value.clear();
      final controller = GetIt.I.get<ChatController>();
      controller.conversations.notifyListeners();
    }
  }

  List<Message> get orderByDateMessages {
    List<Message> list = messages.value;
    list.sort((a, b) => a.date.value.compareTo(b.date.value));
    return list;
  }

  List<DateTimeWithListMessage> get orderByDateMessageView {
    List<DateTimeWithListMessage> list = [];
    orderByDateMessages.forEach((element) {
      if (!list.contains((DateTimeWithListMessage e) =>
          DateConvert().date(e.date) ==
          DateConvert().date(element.date.value))) {
        list.add(DateTimeWithListMessage(
            date: element.date.value, messages: [element]));
      } else {
        int index = list.indexWhere((e) =>
            DateConvert().date(e.date) ==
            DateConvert().date(element.date.value));
        list[index].messages.add(element);
      }
    });
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

  DateTime get lastMessageDateReceived {
    final controller = GetIt.I.get<UserController>();
    List<Message> list = orderByDateMessages;
    list.reversed.toList();
    list.forEach((Message element) {
      if (element.userReceiveId.value == controller.user.value.id.value) {
        return element.date;
      }
    });
    return null;
  }
}

class DateTimeWithListMessage {
  DateTime date;
  List<Message> messages = [];
  DateTimeWithListMessage({this.date, this.messages});
}
