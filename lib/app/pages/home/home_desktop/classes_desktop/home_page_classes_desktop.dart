import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/app/pages/home/home_desktop/classes_desktop/home_page_newclasse_desktop.dart';
import 'package:uclass/src/widgets/classes_desktop_widget.dart';
import 'package:uclass/src/widgets/title_topic_widget.dart';

class HomePageClassesDesktop extends StatelessWidget {
  final controller = GetIt.I.get<ClasseController>();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.step,
      builder: (_, value, child) => value > 0
          ? HomePageNewClassDesktop()
          : LayoutBuilder(
              builder: (_, constraint) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTopicWidget(
                    constraint: constraint,
                    title: 'SALAS RECENTES',
                  ),
                  ValueListenableBuilder(
                      valueListenable: controller.classes,
                      builder: (_, value, child) => ClassesDesktopWidget(
                            list: controller.recentsClassesWithAdd,
                          )),
                  TitleTopicWidget(
                    constraint: constraint,
                    title: 'MINHAS SALAS',
                  ),
                  ValueListenableBuilder(
                      valueListenable: controller.classes,
                      builder: (_, value, child) => ClassesDesktopWidget(
                            list: controller.teacherClasses,
                            withPercent: true,
                          )),
                  TitleTopicWidget(
                    constraint: constraint,
                    title: 'SALAS QUE PARTICIPO',
                  ),
                  ValueListenableBuilder(
                      valueListenable: controller.classes,
                      builder: (_, value, child) =>
                          ClassesDesktopWidget(list: controller.studentClasses))
                ],
              ),
            ),
    );
  }
}
