import 'package:flutter/material.dart';
import 'package:uclass/app/chat/chat_widget.dart';

import 'package:flutter/foundation.dart' as platform;

import 'home_desktop.dart';
import 'home_mobile.dart';

class HomeScreen extends StatelessWidget {
  /* final List recentClasses = [
    ClassModel(
        teacherModel: TeacherModel(
          name: 'Martin Marks',
        ),
        studentsNumber: 35,
        name: 'Biologia Marinha',
        color: Colors.green),
  ]; */

  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => /* Expanded(
          child: */
          Stack(
        children: [
          Positioned.fill(
              child: platform.kIsWeb && MediaQuery.of(context).size.width > 1320
                  ? HomeDesktop()
                  : HomeMobile()),
          ChatWidget(
            constraints: constraint,
          )
        ],
      ),
      /*  ), */
    );
  }

  /* event(EventModel e, BoxConstraints constraint) => Container(
        margin: EdgeInsets.symmetric(
            vertical: constraint.maxHeight * 0.02,
            horizontal: constraint.maxWidth * 0.05),
        child: Column(
          children: [
            Text(
              DateConvert().dayWeek(e.date.value).toString().toUpperCase(),
              style: style.copyWith(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Text(
              e.date.value.day.toString(),
              style: style.copyWith(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              e.title.value,
              style: style.copyWith(
                  color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            Text(
              TimeConvert().hAndMString(e.start.value) +
                  ' - ' +
                  TimeConvert().hAndMString(e.end.value),
              style: style.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
      ); */
}
