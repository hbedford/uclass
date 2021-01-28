import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/src/widgets/title_topic_widget.dart';

import '../home_classes.dart';
import '../home_resume.dart';

class HomeDashDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  final classeController = GetIt.I.get<ClasseController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTopicWidget(title: 'SALAS RECENTES', constraint: constraints),
          HomeListClassesWidget(
            list: classeController.studentClasses,
          ),
          /* classes(constraint), */
          TitleTopicWidget(title: 'MINHAS SALAS', constraint: constraints),
          HomeListClassesWidget(
            list: classeController.teacherClasses,
            withPercent: true,
          ),
          /* title('EVENTOS', constraints),
                                            HomeEvents(
                                              constraint: constraints,
                                            ), */
          Divider(
            color: Colors.grey,
          ),
          resume1(constraints)
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
}
