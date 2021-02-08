import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Message {
  final ValueNotifier<int> id;
  final ValueNotifier<int> userSenderId;
  final ValueNotifier<int> userReceiveId;
  final ValueNotifier<String> message;
  final ValueNotifier<bool> view;
  final ValueNotifier<DateTime> date;
  Message({
    @required int id,
    @required int userSenderId,
    @required int userReceiveId,
    @required bool view,
    @required String message,
    @required DateTime date,
  })  : this.id = ValueNotifier<int>(id),
        this.userSenderId = ValueNotifier<int>(userSenderId),
        this.view = ValueNotifier<bool>(view),
        this.userReceiveId = ValueNotifier<int>(userReceiveId),
        this.message = ValueNotifier<String>(message),
        this.date = ValueNotifier<DateTime>(date);
}
