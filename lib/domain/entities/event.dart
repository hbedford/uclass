import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event {
  final id = ValueNotifier<int>(null);
  final title = ValueNotifier<String>(null);
  final start = ValueNotifier<TimeOfDay>(null);
  final end = ValueNotifier<TimeOfDay>(null);
  final date = ValueNotifier<DateTime>(null);
  Event({int id, String title, TimeOfDay start, TimeOfDay end, DateTime date}) {
    changeId(id);
    changeTitle(title);
    changeStart(start);
    changeEnd(end);
    changeDate(date);
  }
  changeId(int i) => id.value = i;
  changeTitle(String t) => title.value = t;
  changeStart(TimeOfDay s) => start.value = s;
  changeEnd(TimeOfDay e) => end.value = e;
  changeDate(DateTime d) => date.value = d;
}
