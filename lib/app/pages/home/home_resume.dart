import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/activity.dart';
import 'package:uclass/domain/entities/day_activity.dart';
import 'package:uclass/domain/entities/type_activity.dart';
import 'package:uclass/src/utils/date_convert.dart';

class HomeResume extends StatelessWidget {
  final BoxConstraints constraint;
  HomeResume({@required this.constraint});
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  final List<DayActivity> list = [
    DayActivity(date: DateTime(2021, 01, 25), activities: [
      TypeActivity(color: Colors.blue, name: 'Tempo Livre', activities: []),
      TypeActivity(color: Colors.purple, name: 'Exercicios', activities: [
        Activity(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 35),
        ),
        Activity(
          name: 'Exercicio 2',
          time: TimeOfDay(hour: 0, minute: 25),
        ),
        Activity(
          name: 'Exercicio 3',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ]),
      TypeActivity(color: Colors.yellow, name: 'Videos', activities: [
        Activity(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
        Activity(
          name: 'Exercicio 2',
          time: TimeOfDay(hour: 0, minute: 10),
        ),
        Activity(
          name: 'Exercicio 3',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ]),
      TypeActivity(color: Colors.green, name: 'Forum/Sala', activities: [
        Activity(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 35),
        ),
        Activity(
          name: 'Exercicio 1',
          time: TimeOfDay(hour: 0, minute: 15),
        ),
      ])
    ]),
    DayActivity(date: DateTime(2021, 01, 26), activities: []),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (_, index) => resumeInfo1(list[index], constraint),
    );
  }

  resumeInfo1(DayActivity d, BoxConstraints constraint) => Container(
        width: constraint.maxWidth * 0.2,
        child: Column(
          children: [
            Expanded(
                child: LayoutBuilder(
              builder: (_, constraints) => Column(
                  children: d.list
                      .map((e) => Container(
                            color: e.color.value,
                            height: constraints.maxHeight *
                                (e.totalTime / d.totalTime),
                            width: constraints.maxWidth * 0.05,
                          ))
                      .toList()),
            )),
            Text(
              DateConvert().dayWeek(d.date.value),
              style: style.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );
}
