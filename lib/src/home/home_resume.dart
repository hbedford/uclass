import 'package:flutter/material.dart';
import 'package:uclass/src/models/activity_model.dart';
import 'package:uclass/src/models/day_activity_model.dart';
import 'package:uclass/src/models/type_activity_model.dart';
import 'package:uclass/src/utils/date_convert.dart';

class HomeResume extends StatelessWidget {
  final BoxConstraints constraint;
  HomeResume({@required this.constraint});
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
    ]),
    DayActivityModel(date: DateTime(2021, 01, 26), activities: []),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (_, index) => resumeInfo1(list[index], constraint),
    );
  }

  resumeInfo1(DayActivityModel d, BoxConstraints constraint) => Container(
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
