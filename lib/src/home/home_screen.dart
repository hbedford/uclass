import 'package:flutter/material.dart';
import 'package:uclass/src/models/activity_model.dart';
import 'package:uclass/src/models/class_model.dart';
import 'package:uclass/src/models/day_activity_model.dart';
import 'package:uclass/src/models/event_model.dart';
import 'package:uclass/src/models/teacher_model.dart';
import 'package:uclass/src/models/type_activity_model.dart';
import 'package:uclass/src/utils/date_convert.dart';
import 'package:uclass/src/utils/time_convert.dart';

class HomeScreen extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  final List<DayActivityModel> list = [
    DayActivityModel(date: DateTime(2021, 01, 25), activities: [
      TypeActivityModel(
          color: Colors.blue, name: 'Tempo Livre', activities: []),
      TypeActivityModel(color: Colors.purple, name: 'Exercicios', activities: [
        ActivityModel(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 35),
        ),
        ActivityModel(
          name: 'Exercicio 2',
          time: TimeOfDay(hour: 0, minute: 25),
        ),
        ActivityModel(
          name: 'Exercicio 3',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ]),
      TypeActivityModel(color: Colors.yellow, name: 'Videos', activities: [
        ActivityModel(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
        ActivityModel(
          name: 'Exercicio 2',
          time: TimeOfDay(hour: 0, minute: 10),
        ),
        ActivityModel(
          name: 'Exercicio 3',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ]),
      TypeActivityModel(color: Colors.green, name: 'Forum/Sala', activities: [
        ActivityModel(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 35),
        ),
        ActivityModel(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ])
    ])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: drawer(),
        body: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title('SALAS RECENTES', constraint),
              classes(constraint),
              title('MINHAS SALAS', constraint),
              myClasses(constraint),
              title('EVENTOS', constraint),
              events(constraint),
              resume(constraint)
            ],
          );
        }));
  }

  classes(BoxConstraints constraint) => Container(
        margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
        height: constraint.maxHeight * 0.15,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ClassModel(
                  teacherModel: TeacherModel(
                    name: 'Martin Marks',
                  ),
                  studentsNumber: 35,
                  name: 'Biologia Marinha',
                  color: Colors.green),
            ].map<Widget>((e) => classWithPercent(e, constraint)).toList(),
          ),
        ),
      );
  classWithPercent(ClassModel e, constraint) => Container(
        margin: EdgeInsets.only(
          left: constraint.maxWidth * 0.02,
        ),
        width: constraint.maxWidth * 0.5,
        decoration: BoxDecoration(
            color: e.color.value, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Text(
              e.title.value,
              style: style,
            ),
            Column(
              children: [
                Text(
                  'Prof:${e.teacher.value.name.value}',
                  style: style.copyWith(fontSize: 10),
                ),
                Text(
                  'Participantes:${e.students.value}',
                  style: style.copyWith(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      );
  myClasses(BoxConstraints constraint) => Container(
        margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
        height: constraint.maxHeight * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClassModel(
                      teacherModel: TeacherModel(
                        name: 'Martin Marks',
                      ),
                      studentsNumber: 35,
                      name: 'Biologia Marinha',
                      percent: 7,
                      color: Colors.green),
                ].map<Widget>((e) => classWidget(e, constraint)).toList(),
              ),
            ),
          ],
        ),
      );
  events(BoxConstraints constraint) => Container(
        height: constraint.maxHeight * 0.25,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventModel(
                title: 'Biologia Marinha',
                start: TimeOfDay(hour: 7, minute: 30),
                end: TimeOfDay(hour: 11, minute: 0),
                date: DateTime(2021, 01, 25),
              ),
              EventModel(
                title: 'Anatomia',
                start: TimeOfDay(hour: 14, minute: 30),
                end: TimeOfDay(hour: 15, minute: 45),
                date: DateTime(2021, 01, 25),
              ),
              EventModel(
                title: 'Biologia',
                start: TimeOfDay(hour: 08, minute: 30),
                end: TimeOfDay(hour: 09, minute: 45),
                date: DateTime(2021, 01, 26),
              ),
            ].map<Widget>((e) => event(e, constraint)).toList(),
          ),
        ),
      );
  classWidget(ClassModel c, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(
          left: constraint.maxWidth * 0.02,
        ),
        width: constraint.maxWidth * 0.5,
        height: constraint.maxHeight * 0.15,
        decoration: BoxDecoration(
            color: c.color.value, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: constraint.maxHeight * 0.03,
                  width: (constraint.maxWidth * 0.5) * (c.percent.value / 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                ),
                Container(
                  height: constraint.maxHeight * 0.03,
                  width: (constraint.maxWidth * 0.5) *
                      ((10 - c.percent.value) / 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20))),
                )
              ],
            ),
            Text(
              c.title.value,
              style: style,
            ),
            Column(
              children: [
                Text(
                  'Participantes:${c.students.value}',
                  style: style.copyWith(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      );
  event(EventModel e, BoxConstraints constraint) => Container(
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
      );
  resume(BoxConstraints constraint) => Container(
        child: Column(
          children: [
            Text(
              'Resumo de atividades',
              style: style,
            ),
            Container(
              child: SingleChildScrollView(
                child: Row(
                  children: list.map<Widget>((e) => resumeInfo(e)).toList(),
                ),
              ),
            )
          ],
        ),
      );
  resumeInfo(DayActivityModel d) => Container(
      child: LayoutBuilder(
          builder: (context, constraints) => Column(
                children: d.list
                    .map((e) => Container(
                          height: constraints.maxHeight *
                              (d.totalTime * (e.totalTime / 100)),
                          color: e.color.value,
                          width: constraints.maxWidth * 0.2,
                        ))
                    .toList(),
              )));
  title(String t, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
        child: Text(
          'SALAS RECENTES',
          style: style.copyWith(fontWeight: FontWeight.w900),
        ),
      );
  drawer() => Drawer(
        child: Column(),
      );
}
