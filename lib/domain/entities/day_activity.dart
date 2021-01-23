import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/type_activity.dart';

class DayActivity {
  final id;
  final ValueNotifier<DateTime> date;
  final ValueNotifier<List<TypeActivity>> activities;
  DayActivity({int id, DateTime date, List<TypeActivity> activities})
      : this.id = ValueNotifier<int>(id),
        this.date = ValueNotifier<DateTime>(date),
        this.activities = ValueNotifier<List<TypeActivity>>(activities);
  List<TypeActivity> get list {
    List<TypeActivity> l = activities.value;
    l.sort((a, b) => a.totalTime.compareTo(b.totalTime));
    return l;
  }

  int get totalTime {
    int v = 0;
    activities.value.forEach((element) {
      v = v + element.totalTime;
    });
    return v;
  }
}
