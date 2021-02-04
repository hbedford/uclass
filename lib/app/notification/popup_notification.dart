import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/notification/button_notification.dart';

import 'notification_controller.dart';

class PopUpNotifications extends StatelessWidget {
  final Size size;
  PopUpNotifications({this.size});
  final controller = GetIt.I.get<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notificações',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                      width: size.width,
                      height: size.height,
                      child: ButtonNotification())
                  /* Container(
                    width: size.width,
                    height: size.height,
                    child: IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () => controller.showAndHide(context)),
                  ) */
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: controller.notifications,
              builder: (_, value, child) => Wrap(
                direction: Axis.vertical,
                children: controller.notificationsActives
                    .map((e) => ClipRect(
                        child: Container(
                            width: size.width * 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.05),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.15,
                                horizontal: size.width * 0.2),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right: size.width * 0.1),
                                                child: Icon(Icons.alarm)),
                                            Flexible(
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  e.title.value,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () =>
                                              e.changeDisable(true))
                                    ],
                                  ),
                                  Text(
                                    e.message.value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ))))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
