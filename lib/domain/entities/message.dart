import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Message {
  final id;
  final ValueNotifier<int> userSenderId;
  final ValueNotifier<int> userReceiveId;
  final ValueNotifier<String> message;
  final ValueNotifier<bool> view;
  final ValueNotifier<DateTime> date;
  Message({
    int id,
    int userSenderId,
    int userReceiveId,
    bool view,
    String message,
    DateTime date,
  })  : this.id = ValueNotifier<int>(id),
        this.userSenderId = ValueNotifier<int>(userSenderId),
        this.view = ValueNotifier<bool>(view),
        this.userReceiveId = ValueNotifier<int>(userReceiveId),
        this.message = ValueNotifier<String>(message),
        this.date = ValueNotifier<DateTime>(date);
}
