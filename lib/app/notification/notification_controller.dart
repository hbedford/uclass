import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/notification.dart';

class NotificationController {
  final LayerLink link = LayerLink();
  final ValueNotifier<List<NotificationInfo>> notifications;
  NotificationController({List<NotificationInfo> notifications = const []})
      : this.notifications =
            ValueNotifier<List<NotificationInfo>>(notifications);

  bool get haveNotification =>
      notifications.value.indexWhere(
          (NotificationInfo element) => element.view.value == false) !=
      -1;
}
