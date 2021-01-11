import 'package:flutter/material.dart';
import 'package:uclass/src/models/class_model.dart';
import 'package:uclass/src/models/event_model.dart';
import 'package:uclass/src/models/teacher_model.dart';
import 'package:uclass/src/utils/date_convert.dart';
import 'package:uclass/src/utils/time_convert.dart';

class HomeScreen extends StatelessWidget {
  TextStyle style;
  @override
  Widget build(BuildContext context) {
    style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: drawer(),
        body: LayoutBuilder(builder: (context, constraint) {
          print((constraint.maxWidth * 0.5) * ((10 - 8) / 10));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                child: Text(
                  'SALAS RECENTES',
                  style: style,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
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
                    ]
                        .map((e) => Container(
                              margin: EdgeInsets.only(
                                left: constraint.maxWidth * 0.02,
                              ),
                              width: constraint.maxWidth * 0.5,
                              decoration: BoxDecoration(
                                  color: e.color.value,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            ))
                        .toList(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                child: Text(
                  'MINHAS SALAS',
                  style: style,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
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
                        ]
                            .map((e) => Container(
                                  margin: EdgeInsets.only(
                                    left: constraint.maxWidth * 0.02,
                                  ),
                                  width: constraint.maxWidth * 0.5,
                                  height: constraint.maxHeight * 0.15,
                                  decoration: BoxDecoration(
                                      color: e.color.value,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: constraint.maxHeight * 0.03,
                                            width: (constraint.maxWidth * 0.5) *
                                                (e.percent.value / 10),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20))),
                                          ),
                                          Container(
                                            height: constraint.maxHeight * 0.03,
                                            width: (constraint.maxWidth * 0.5) *
                                                ((10 - e.percent.value) / 10),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20))),
                                          )
                                        ],
                                      ),
                                      Text(
                                        e.title.value,
                                        style: style,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Participantes:${e.students.value}',
                                            style: style.copyWith(fontSize: 10),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                child: Text(
                  'Eventos',
                  style: style,
                ),
              ),
              Container(
                height: constraint.maxHeight * 0.15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EventModel(
                        title: 'Biologia Marinha',
                        start: TimeOfDay(hour: 7, minute: 30),
                        end: TimeOfDay(hour: 11, minute: 0),
                        date: DateTime(2021, 01, 25),
                      )
                    ]
                        .map((e) => Container(
                              child: Column(
                                children: [
                                  Text(
                                    DateConvert()
                                        .dayWeek(e.date.value)
                                        .toString()
                                        .toUpperCase(),
                                    style: style.copyWith(color: Colors.grey),
                                  ),
                                  Text(e.date.value.day.toString()),
                                  Text(
                                    e.title.value,
                                    style: style.copyWith(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Text(
                                    TimeConvert().hAndMString(e.start.value) +
                                        ' - ' +
                                        TimeConvert().hAndMString(e.end.value),
                                    style: style,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          );
        }));
  }

  drawer() => Drawer(
        child: Column(),
      );
}
