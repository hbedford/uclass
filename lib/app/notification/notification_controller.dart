import 'package:flutter/material.dart';
import 'package:uclass/app/notification/popup_notification.dart';
import 'package:uclass/domain/entities/notificationinfo.dart';

class NotificationController {
  final LayerLink link = LayerLink();
  final ValueNotifier<OverlayEntry> overlayEntry;
  final ValueNotifier<bool> overlayIsShown;
  final ValueNotifier<List<NotificationInfo>> notifications;
  NotificationController({List<NotificationInfo> notifications = const []})
      : this.notifications =
            ValueNotifier<List<NotificationInfo>>(notifications),
        this.overlayEntry = ValueNotifier<OverlayEntry>(null),
        this.overlayIsShown = ValueNotifier<bool>(false);

  List<NotificationInfo> get notificationsOrderByDate {
    List<NotificationInfo> list = [];
    list = List.of(notifications.value);
    list.sort((a, b) => a.date.value.compareTo(b.date.value));
    return list;
  }

  List<NotificationInfo> get notificationsActives {
    List<NotificationInfo> list = [];
    notificationsOrderByDate.forEach((element) {
      if (!element.disable.value) list.add(element);
    });
    return list;
  }

  bool get haveNotification =>
      notifications.value.indexWhere(
          (NotificationInfo element) => element.view.value == false) !=
      -1;

  void showAndHide(BuildContext context) {
    if (overlayIsShown.value) {
      overlayIsShown.value = false;
      overlayEntry.value.remove();
    } else {
      if (notifications.value
              .indexWhere((element) => element.view.value == false) !=
          -1) {
        overlayEntry.value = _createOverlayEntry(context);
        Overlay.of(context).insert(overlayEntry.value);
        overlayIsShown.value = true;
      }
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    final width = link.leaderSize.width;
    final height = link.leaderSize.height;
    return OverlayEntry(builder: (contt) {
      return /* Positioned(
          child: */
          Positioned(
        width: link.leaderSize.width * 5,
        child: CompositedTransformFollower(
          followerAnchor: Alignment.topRight,
          targetAnchor: Alignment.topRight,
          link: link,
          offset: Offset(0, 0),
          child: PopUpNotifications(size: Size(width, height)),
          /* ) */
        ),
      );
    });
  }

  void checkNotifications() {
    if (notifications.value
            .indexWhere((element) => element.view.value == false) ==
        -1) {
      hideOverlay();
    }
  }

  void hideOverlay() {
    overlayIsShown.value = false;
    overlayEntry.value.remove();
  }
}
