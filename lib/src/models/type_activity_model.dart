import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'activity_model.dart';

class TypeActivityModel {
  final id;
  final ValueNotifier<String> name;
  final ValueNotifier<Color> color;
  final ValueNotifier<List<ActivityModel>> activities;
  TypeActivityModel(
      {int id, String name, Color color, List<ActivityModel> activities})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.color = ValueNotifier<Color>(color),
        this.activities = ValueNotifier<List<ActivityModel>>(activities);
  int get totalTime {
    int t = 0;
    activities.value.forEach((ActivityModel e) {
      t = t + ((e.time.value.hour * 60) + e.time.value.minute);
    });
    return t;
  }
}
