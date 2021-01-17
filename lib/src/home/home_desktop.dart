import 'package:flutter/material.dart';

import 'home_classes.dart';
import 'home_events.dart';
import 'home_leftside.dart';
import 'package:flutter/foundation.dart' as platform;

import 'home_resume.dart';

class HomeDesktop extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
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
                              builder: (_, constraints) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      title('SALAS RECENTES', constraints),
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
                                      resume1(constraint)
                                    ],
                                  ))),
                    ],
                  ),
                ),
              )),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                'EVENTOS',
                style: style,
              ),
              Expanded(
                  child: LayoutBuilder(
                      builder: (_, constraint) => HomeEvents(
                            constraint: constraint,
                          )))
            ],
          ))
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
                children: [
                  Container(
                      margin: EdgeInsets.only(left: constraint.maxWidth * 0.00),
                      child: Text('Resumo de atividades', style: style)),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                right: constraint.maxWidth * 0.05,
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
            children: [
              Text('Nome', style: style),
              Text('Instituição', style: style)
            ],
          )
        ],
      );
  title(String t, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.00),
        child: Text(
          t,
          style: style.copyWith(fontWeight: FontWeight.w900, fontSize: 20),
        ),
      );
}
