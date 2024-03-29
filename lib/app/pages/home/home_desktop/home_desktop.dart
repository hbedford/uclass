import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/popup_last_conversations.dart';
import 'package:uclass/app/notification/button_notification.dart';
import 'package:uclass/app/notification/notification_controller.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/app/pages/home/home_desktop/classes_desktop/home_page_classes_desktop.dart';
import 'package:uclass/domain/entities/notificationinfo.dart';
import '../home_controller.dart';
import '../home_events.dart';
import '../home_leftside.dart';
import 'dashboard_desktop/home_page_dash_desktop.dart';
import 'classes_desktop/home_topbar_newclasse_desktop.dart';

class HomeDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  final controller = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      final notificationController = GetIt.I.get<NotificationController>();
      notificationController.changeNewNotification(
          NotificationInfo(
              id: 6,
              title: 'Você acabou de receber um convite',
              message: "Você foi convidado para participar da sala GO"),
          context);
    });
    return Scaffold(
      body: Row(
        children: [
          LeftSideDesktop(),
          Expanded(
              flex: 8,
              child: LayoutBuilder(
                builder: (_, constraint) => Container(
                  margin: EdgeInsets.only(
                    left: constraint.maxWidth * 0.02,
                    top: constraint.maxHeight * 0.05,
                    bottom: constraint.maxHeight * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topBar(),
                      Expanded(
                          flex: 10,
                          child: LayoutBuilder(
                              builder: (_, constraints) => Row(
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: controller.page,
                                          builder: (_, value, child) =>
                                              Expanded(
                                                flex: 9,
                                                child: value == 0
                                                    ? HomeDashDesktop()
                                                    : HomePageClassesDesktop(),
                                              )),
                                      Flexible(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                child: Column(
                                                  /*  crossAxisAlignment:
                                                      CrossAxisAlignment.center, */
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'EVENTOS',
                                                        style: style.copyWith(
                                                            color:
                                                                Colors.white54,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: LayoutBuilder(
                                                            builder:
                                                                (_, constraint) =>
                                                                    HomeEvents(
                                                                      constraint:
                                                                          constraint,
                                                                    )))
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: PopUpLastConversations(),
                                              )
                                            ],
                                          ))
                                    ],
                                  ))),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  topBar() {
    final notificationController = GetIt.I.get<NotificationController>();
    return Flexible(
      child: LayoutBuilder(
        builder: (_, constraint) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: LayoutBuilder(
                builder: (_, constraints) => Row(children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: constraints.maxWidth * 0.02,
                        top: constraints.maxHeight * 0.01,
                        bottom: constraints.maxHeight * 0.03),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/avatar.png'),
                      child: LayoutBuilder(
                        builder: (_, constraint) => Stack(
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: constraint.maxWidth * 0.1,
                              ),
                              bottom: 5,
                              right: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text('Nome', style: style),
                      ),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Instituição',
                          style:
                              style.copyWith(fontSize: 12, color: Colors.grey),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
            topCenterBar(),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: CompositedTransformTarget(
                          link: notificationController.link,
                          child: ButtonNotification())),
                  Flexible(
                    child: IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  topCenterBar() {
    final classeController = GetIt.I.get<ClasseController>();
    return Expanded(
        flex: 7,
        child: ValueListenableBuilder(
            valueListenable: classeController.step,
            builder: (_, value, child) =>
                value > 0 ? HomeTopBarNewClassDesktop() : Container()));
  }
}
