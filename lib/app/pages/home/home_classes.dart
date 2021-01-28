import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/domain/entities/class.dart';

class ListClassesWidget extends StatelessWidget {
  /* final BoxConstraints constraint; */
  final bool withPercent;
  final List<Class> list;
  ListClassesWidget({this.withPercent = false, @required this.list});

  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return platform.kIsWeb && MediaQuery.of(context).size.width > 1320
        ? classesDesktop()
        : classesMobile();
  }

  classesDesktop() => Flexible(
      flex: 1,
      child: LayoutBuilder(
        builder: (_, constraint) => Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (_, constraints) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (_, index) => withPercent
                      ? classWithPercentDesktop(list[index], constraints)
                      : classDesktop(list[index], constraints),
                ),
              ),
            ),
            Container(height: constraint.maxHeight * 0.05)
          ],
        ),
      ));
  classesMobile() => Flexible(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, constraint) => Container(
            margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
            height: constraint.maxHeight * 0.15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (_, index) => withPercent
                    ? classWithPercentMobile(list[index], constraint)
                    : classMobile(list[index], constraint)),
            /*  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recentClasses
                    .map<Widget>((e) => classWithPercent(e, constraint))
                    .toList(),
              ),
            ), */
          ),
        ),
      );
  classDesktop(Class e, constraint) => Container(
        margin: EdgeInsets.only(
            left: constraint.maxWidth * 0.02,
            top: constraint.maxHeight * 0.1,
            bottom: constraint.maxHeight * 0.1),
        width: constraint.maxWidth * 0.2,
        decoration: BoxDecoration(
            color: e == null ? Colors.grey : e.color.value,
            borderRadius: BorderRadius.circular(20)),
        child: e == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), Text('Adicionar Sala')],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          e.title.value,
                          style: style.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(),
                        Text(
                          'Prof:${e.teacher.value.name.value}',
                          style: style.copyWith(fontSize: 10),
                        ),
                        Text(
                          'Participantes:${e.members.value.length}',
                          style: style.copyWith(fontSize: 10),
                        ),
                        Container(),
                      ],
                    ),
                  )
                ],
              ),
      );
  classMobile(Class e, constraint) => Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Prof:${e.teacher.value.name.value}',
                  style: style.copyWith(fontSize: 10),
                ),
                Text(
                  'Participantes:${e.members.value.length}',
                  style: style.copyWith(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      );
  classWithPercentMobile(Class c, BoxConstraints constraint) => Container(
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Text(
                    c.title.value,
                    style: style,
                  ),
                  Text(
                    'Participantes:${c.members.value.length}',
                    style: style.copyWith(fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  classWithPercentDesktop(Class c, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(
            left: constraint.maxWidth * 0.02,
            top: constraint.maxHeight * 0.1,
            bottom: constraint.maxHeight * 0.1),
        width: constraint.maxWidth * 0.2,
        height: constraint.maxHeight * 0.1,
        decoration: BoxDecoration(
            color: c.color.value, borderRadius: BorderRadius.circular(20)),
        child: LayoutBuilder(
          builder: (_, constraint) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: constraint.maxHeight * 0.2,
                width: constraint.maxWidth,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      height: constraint.maxHeight,
                      width: constraint.maxWidth,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                    )),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: constraint.maxHeight,
                            width: (constraint.maxWidth * 0.5) *
                                (c.percent.value / 10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20))),
                          ),
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
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    c.title.value,
                    style: style.copyWith(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Participantes: ${c.members.value.length}',
                  style: style.copyWith(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      );
}
