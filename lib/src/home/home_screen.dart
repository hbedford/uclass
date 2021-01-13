import 'package:flutter/material.dart';
import 'package:uclass/src/models/activity_model.dart';
import 'package:uclass/src/models/class_model.dart';
import 'package:uclass/src/models/day_activity_model.dart';
import 'package:uclass/src/models/event_model.dart';
import 'package:uclass/src/models/menu_model.dart';
import 'package:uclass/src/models/teacher_model.dart';
import 'package:uclass/src/models/type_activity_model.dart';
import 'package:uclass/src/utils/date_convert.dart';
import 'package:uclass/src/utils/time_convert.dart';
import 'package:flutter/foundation.dart' as platform;

class HomeScreen extends StatelessWidget {
  final List listMenu = [
    MenuModel(name: 'MEU DASH'),
    MenuModel(
      name: 'SALAS',
    ),
    MenuModel(name: 'SOCIAL'),
    MenuModel(name: 'CALENDARIO')
  ];
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
    return platform.kIsWeb ? desktop(context) : mobile(context);
  }

  desktop(BuildContext context) => Scaffold(
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Color(0xff13191E),
                child: Column(
                  children: [
                    Flexible(
                      child: Center(
                        child: Text(
                          'Uclass',
                          style: style.copyWith(
                              fontWeight: FontWeight.w900, fontSize: 30),
                        ),
                      ),
                    ),
                    Flexible(
                        child: LayoutBuilder(
                            builder: (_, constraint) => Column(
                                  children: listMenu
                                      .map<Widget>((e) => Container(
                                            height: constraint.maxHeight * 0.1,
                                            width: constraint.maxWidth,
                                            color: listMenu.indexOf(e) == 0
                                                ? Theme.of(context)
                                                    .scaffoldBackgroundColor
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                e.name,
                                                style: style,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ))),
                    Flexible(
                        child: Column(
                      children: [
                        Text(
                          DateConvert().dayWeekComplet(DateTime.now()),
                          style: style,
                        ),
                        Text(
                          DateConvert().dateBrString(DateTime.now()),
                          style: style.copyWith(color: Colors.white30),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
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
                        Row(
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
                                backgroundImage:
                                    AssetImage('assets/avatar.png'),
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
                        ),
                        Expanded(
                            child: LayoutBuilder(
                                builder: (_, constraints) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'SALAS RECENTES',
                                            style: style.copyWith(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        )
                                      ],
                                    ))),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );
  mobile(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Uclass',
          style: style.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
      drawer: drawer(context),
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
            resume1()
          ],
        );
      }));
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
        height: constraint.maxHeight * 0.2,
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
            Container(
              height: constraint.maxHeight * 0.03,
              width: constraint.maxWidth,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Row(
                      children: [
                        Container(
                          height: constraint.maxHeight * 0.03,
                          width: (constraint.maxWidth * 0.5) *
                              (c.percent.value / 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                        ),
                        Container(
                          height: constraint.maxHeight * 0.03,
                          width: (constraint.maxWidth * 0.5) *
                              ((10 - c.percent.value) / 10),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20))),
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Progresso',
                          style: style,
                        )
                      ],
                    ),
                  )
                ],
              ),
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
  resume1() => Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Text('Resumo de atividades', style: style),
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
                  builder: (_, constraint) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (_, index) =>
                        resumeInfo1(list[index], constraint),
                  ),
                ))
          ],
        ),
      );
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
  resume(BoxConstraints constraint) => SizedBox(
        /* color: Colors.blue, */
        height: constraint.maxHeight * 0.2,
        width: constraint.maxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Resumo de atividades',
                style: style,
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (_, constraint) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                    color: Colors.blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: list
                          .map<Widget>((e) => resumeInfo(e, constraint))
                          .toList(),
                    ),
                  ),
                ),
              ),
            )
            /* Flexible(
              /* height: constraint.maxHeight * 0.15,
              width: constraint.maxWidth, */
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: list.map<Widget>((e) => resumeInfo(e)).toList(),
                ),
              ),
            ) */
          ],
        ),
      );
  resumeInfo(DayActivityModel d, BoxConstraints constraint) => Container(
        height: constraint.maxHeight,
        width: constraint.maxWidth * 0.2,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (_, constraints) => Column(
                  children: d.list.map<Widget>((e) {
                    print(
                        d.totalTime.toString() + ' ' + e.totalTime.toString());
                    return Container(
                      height:
                          constraints.maxHeight * (e.totalTime / d.totalTime),
                      color: e.color.value,
                      width: constraints.maxWidth * 0.2,
                    );
                  }).toList(),
                ),
              ),
            ),
            Text(
              DateConvert().dayWeek(d.date.value),
              style: style.copyWith(fontWeight: FontWeight.w700),
            )
          ],
        ),
      );
  title(String t, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
        child: Text(
          'SALAS RECENTES',
          style: style.copyWith(fontWeight: FontWeight.w900),
        ),
      );
  drawer(BuildContext context) => Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              DrawerHeader(
                  child: LayoutBuilder(
                      builder: (_, constraint) => Column(children: [
                            Container(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]))),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraint) => Column(
                    children: listMenu
                        .map<Widget>((e) => Container(
                              margin: EdgeInsets.only(
                                  bottom: constraint.maxHeight * 0.01),
                              height: constraint.maxHeight * 0.1,
                              width: constraint.maxWidth,
                              color: listMenu.indexOf(e) == 0
                                  ? Colors.white24
                                  : Colors.transparent,
                              child: Center(
                                child: Text(
                                  e.name,
                                  style: style.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    DateConvert().dayWeekComplet(DateTime.now()),
                    style: style,
                  ),
                  Text(
                    DateConvert().dateBrString(DateTime.now()),
                    style: style,
                  )
                ],
              )
            ],
          ),
        ),
      );
}
