import 'package:flutter/material.dart';

import 'home_classes.dart';
import 'home_events.dart';
import 'home_leftside.dart';
import 'package:flutter/foundation.dart' as platform;

import 'home_resume.dart';

class HomeDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftSideDesktop(),
          Expanded(
              flex: 8,
              child: LayoutBuilder(
                builder: (_, constraint) => Container(
                  margin: EdgeInsets.symmetric(
                      vertical: constraint.maxHeight * 0.05,
                      horizontal: constraint.maxWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topBar(constraint),
                      Expanded(
                          child: LayoutBuilder(
                              builder: (_, constraints) => Row(
                                    children: [
                                      Expanded(
                                        flex: 9,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            title(
                                                'SALAS RECENTES', constraints),
                                            HomeClasses(
                                              constraint: constraints,
                                            ),
                                            /* classes(constraint), */
                                            title('MINHAS SALAS', constraints),
                                            HomeClasses(
                                              constraint: constraints,
                                              withPercent: true,
                                            ),
                                            /* title('EVENTOS', constraints),
                                          HomeEvents(
                                            constraint: constraints,
                                          ), */
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                            resume1(constraint)
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'EVENTOS',
                                                style: style.copyWith(
                                                    color: Colors.white54,
                                                    fontSize: 14),
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

  resume1(BoxConstraints constraint) => Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: constraint.maxWidth * 0.00),
                      child: Text('Resumo de atividades',
                          style: style.copyWith(color: Colors.white54))),
                  TextButton(
                      onPressed: () => null,
                      child: Text(
                        'Ver mais',
                        style: style.copyWith(fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
            Spacer(),
            Expanded(
                flex: 8,
                child: LayoutBuilder(
                    builder: (_, constraint) =>
                        HomeResume(constraint: constraint)))
          ],
        ),
      );
  topBar(BoxConstraints constraint) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              margin: EdgeInsets.only(
                  right: constraint.maxWidth * 0.02,
                  top: constraint.maxHeight * 0.01,
                  bottom: constraint.maxHeight * 0.03),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/avatar.png'),
                child: Stack(
                  children: [
                    Positioned(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 4,
                      ),
                      bottom: 5,
                      right: 5,
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome', style: style),
                Text('Instituição',
                    style: style.copyWith(fontSize: 12, color: Colors.grey))
              ],
            )
          ]),
          Row(
            children: [
              Icon(
                Icons.notification_important,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              )
            ],
          ),
        ],
      );
  title(String t, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.00),
        child: Text(
          t,
          style: style.copyWith(fontWeight: FontWeight.w100, fontSize: 16),
        ),
      );
}
