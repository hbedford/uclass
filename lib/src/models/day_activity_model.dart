import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/activity_model.dart';
import 'package:uclass/src/models/type_activity_model.dart';

class DayActivityModel {
  final id;
  final date;
  final ValueNotifier<List<TypeActivityModel>> activities;
  DayActivityModel({int id, DateTime date, List<TypeActivityModel> activities})
      : this.id = ValueNotifier<int>(id),
        this.date = ValueNotifier<DateTime>(null),
        this.activities = ValueNotifier<List<TypeActivityModel>>(activities);
  List<TypeActivityModel> get list {
    List<TypeActivityModel> l = activities.value;
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
