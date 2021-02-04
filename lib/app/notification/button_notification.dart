import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'notification_controller.dart';

class ButtonNotification extends StatefulWidget {
  @override
  _ButtonNotificationState createState() => _ButtonNotificationState();
}

class _ButtonNotificationState extends State<ButtonNotification> {
  final controller = GetIt.I.get<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Material(
        color: Colors.transparent,
        child: Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (_, constraint) => Container(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  child: IconButton(
                    onPressed: () => controller.showAndHide(context),
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller.notifications,
                builder: (_, value, child) => Positioned(
                  right: 30,
                  top: 40,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: controller.haveNotification
                            ? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* return LayoutBuilder(
      builder: (_, constraint) => Material(
        color: Colors.transparent,
        child: Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight * 0.4,
          child: Stack(
            children: [
              CompositedTransformTarget(
                  link: controller.link,
                  child: LayoutBuilder(
                    builder: (_, constraint) => Container(
                      height: constraint.maxHeight,
                      width: constraint.maxWidth,
                      child: IconButton(
                        onPressed: () => controller.showAndHide(context),
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              ValueListenableBuilder(
                valueListenable: controller.notifications,
                builder: (_, value, child) => Positioned(
                  right: 30,
                  top: 20,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: controller.haveNotification
                            ? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
