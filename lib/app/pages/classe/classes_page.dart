import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/title_topic_widget.dart';

class ClassesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraint) => Column(
              children: [
                TitleTopicWidget(
                  title: 'SALAS RECENTES',
                ),
              ],
            ));
  }
}
