import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'activity.dart';

class TypeActivity {
  final id;
  final ValueNotifier<String> name;
  final ValueNotifier<Color> color;
  final ValueNotifier<List<Activity>> activities;
  final ValueNotifier<String> image;
  TypeActivity(
      {int id,
      String name,
      Color color,
      List<Activity> activities,
      String image})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.color = ValueNotifier<Color>(color),
        this.activities = ValueNotifier<List<Activity>>(activities),
        this.image = ValueNotifier<String>(image);
  int get totalTime {
    int t = 0;
    activities.value.forEach((Activity e) {
      t = t + ((e.time.value.hour * 60) + e.time.value.minute);
    });
    return t;
  }
}
