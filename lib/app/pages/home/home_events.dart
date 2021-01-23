import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/domain/entities/event.dart';
import 'package:uclass/src/utils/date_convert.dart';
import 'package:uclass/src/utils/time_convert.dart';

class HomeEvents extends StatelessWidget {
  final BoxConstraints constraint;
  HomeEvents({@required this.constraint});
  final List eventsList = [
    Event(
      title: 'Biologia Marinha',
      start: TimeOfDay(hour: 7, minute: 30),
      end: TimeOfDay(hour: 11, minute: 0),
      date: DateTime(2021, 01, 25),
    ),
    Event(
      title: 'Anatomia',
      start: TimeOfDay(hour: 14, minute: 30),
      end: TimeOfDay(hour: 15, minute: 45),
      date: DateTime(2021, 01, 25),
    ),
    Event(
      title: 'Biologia',
      start: TimeOfDay(hour: 08, minute: 30),
      end: TimeOfDay(hour: 09, minute: 45),
      date: DateTime(2021, 01, 26),
    ),
  ];

  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return platform.kIsWeb && MediaQuery.of(context).size.width > 1320
        ? desktopEvents()
        : mobileEvents();
  }

  mobileEvents() => Container(
        height: constraint.maxHeight * 0.2,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                eventsList.map<Widget>((e) => event(e, constraint)).toList(),
          ),
        ),
      );
  desktopEvents() => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: eventsList.length,
      itemBuilder: (_, index) => event(eventsList[index], constraint));
  event(Event e, BoxConstraints constraints) => Container(
        margin: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.03,
            horizontal: constraints.maxWidth * 0.05),
        child: Column(
          children: [
            Text(
              DateConvert().dayWeek(e.date.value).toString().toUpperCase(),
              style: style.copyWith(
                  color: Colors.grey, fontWeight: FontWeight.w100),
            ),
            Text(
              e.date.value.day.toString(),
              style: style.copyWith(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w100),
            ),
            Text(
              e.title.value,
              style: style.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w100,
                  fontSize: 10),
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
}
