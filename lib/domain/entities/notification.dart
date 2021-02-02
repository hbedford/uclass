import 'package:flutter/cupertino.dart';

class NotificationInfo {
  final ValueNotifier<int> id;
  final ValueNotifier<String> title;
  final ValueNotifier<String> message;
  final ValueNotifier<DateTime> date;
  final ValueNotifier<bool> view;
  NotificationInfo(
      {int id, String title, String message, DateTime date, bool view = false})
      : this.id = ValueNotifier<int>(id),
        this.title = ValueNotifier<String>(title),
        this.message = ValueNotifier<String>(message),
        this.date = ValueNotifier<DateTime>(date),
        this.view = ValueNotifier<bool>(view);
}
