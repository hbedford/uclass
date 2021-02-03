import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/notification/notification_controller.dart';

class NotificationInfo {
  final ValueNotifier<int> id;
  final ValueNotifier<String> title;
  final ValueNotifier<String> message;
  final ValueNotifier<DateTime> date;
  final ValueNotifier<bool> view;
  final ValueNotifier<bool> disable;
  NotificationInfo(
      {int id,
      String title,
      String message,
      DateTime date,
      bool view = false,
      bool disable = false})
      : this.id = ValueNotifier<int>(id),
        this.title = ValueNotifier<String>(title),
        this.message = ValueNotifier<String>(message),
        this.date = ValueNotifier<DateTime>(date),
        this.view = ValueNotifier<bool>(view),
        this.disable = ValueNotifier<bool>(disable);
  changeView(bool value) => view.value = value;
  changeDisable(bool value) {
    disable.value = value;
    changeView(true);
    final controller = GetIt.I.get<NotificationController>();
    controller.notifications.notifyListeners();
    controller.checkNotifications();
  }
}
