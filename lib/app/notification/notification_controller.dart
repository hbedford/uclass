import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uclass/app/notification/popup_notification.dart';
import 'package:uclass/domain/entities/notificationinfo.dart';

class NotificationController {
  final LayerLink link = LayerLink();
  final ValueNotifier<OverlayEntry> overlayEntry;
  final ValueNotifier<bool> overlayIsShown;
  final ValueNotifier<List<NotificationInfo>> notifications;
  final ValueNotifier<NotificationInfo> newNotification;
  NotificationController({List<NotificationInfo> notifications = const []})
      : this.notifications =
            ValueNotifier<List<NotificationInfo>>(notifications),
        this.overlayEntry = ValueNotifier<OverlayEntry>(null),
        this.overlayIsShown = ValueNotifier<bool>(false),
        this.newNotification = ValueNotifier<NotificationInfo>(null);

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

  changeNewNotification(NotificationInfo value, BuildContext context) {
    newNotification.value = value;
    if (value != null) {
      overlayEntry.value = _newNotification(context);
      Overlay.of(context).insert(overlayEntry.value);
      overlayIsShown.value = true;
    } else {
      overlayIsShown.value = false;
      overlayEntry.value.remove();
    }
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

  OverlayEntry _newNotification(BuildContext context) {
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
          offset: Offset(-width, 0),
          child: Material(
            color: Colors.transparent,
            child: ClipRect(
                child: Container(
                    width: width * 5,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.05),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.15, horizontal: width * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54),
                    /* width: width, */
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(right: width * 0.1),
                                        child: Icon(Icons.alarm)),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          newNotification.value.title.value,
                                          softWrap: true,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    changeNewNotification(null, context);
                                    /* newNotification.value.changeDisable(true); */
                                  })
                            ],
                          ),
                          Text(
                            newNotification.value.message.value,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ))),
          ),
          /* ) */
        ),
      );
    });
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
