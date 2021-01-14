import 'package:flutter/material.dart';
import 'package:uclass/src/models/menu_model.dart';
import 'package:uclass/src/utils/date_convert.dart';

import 'home_classes.dart';
import 'home_events.dart';
import 'home_resume.dart';

class HomeMobile extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  final List listMenu = [
    MenuModel(name: 'MEU DASH'),
    MenuModel(
      name: 'SALAS',
    ),
    MenuModel(name: 'SOCIAL'),
    MenuModel(name: 'CALENDARIO')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              HomeClasses(
                constraint: constraint,
              ),
              /* classes(constraint), */
              title('MINHAS SALAS', constraint),
              HomeClasses(
                constraint: constraint,
                withPercent: true,
              ),
              title('EVENTOS', constraint),
              HomeEvents(
                constraint: constraint,
              ),
              resume1()
            ],
          );
        }));
  }

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
                    builder: (_, constraint) =>
                        HomeResume(constraint: constraint)))
          ],
        ),
      );
  title(String t, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
        child: Text(
          t,
          style: style.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      );
}
