import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/src/models/type_activity_model.dart';

class ActivityModel {
  final id;
  final name;
  final type;
  final ValueNotifier<TimeOfDay> time;
  ActivityModel({int id, String name, TypeActivityModel type, TimeOfDay time})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.type = ValueNotifier<TypeActivityModel>(type),
        this.time =
            ValueNotifier<TimeOfDay>(time ?? TimeOfDay(hour: 0, minute: 0));
}
