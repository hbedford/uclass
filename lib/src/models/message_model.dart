import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageModel {
  final id;
  final ValueNotifier<int> userSenderId;
  final ValueNotifier<int> userReceiveId;
  final ValueNotifier<String> message;
  final ValueNotifier<DateTime> date;
  /* final ValueNotifier<TimeOfDay> time; */
  MessageModel({
    int id,
    int userSenderId,
    int userReceiveId,
    String message,
    DateTime date,
    /*  TimeOfDay time */
  })  : this.id = ValueNotifier<int>(id),
        this.userSenderId = ValueNotifier<int>(userSenderId),
        this.userReceiveId = ValueNotifier<int>(userReceiveId),
        this.message = ValueNotifier<String>(message),
        this.date = ValueNotifier<DateTime>(date);
  /*  this.time = ValueNotifier<TimeOfDay>(time); */
}
