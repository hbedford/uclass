import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/type_activity.dart';

class Activity {
  final id;
  final name;
  final type;
  final ValueNotifier<TimeOfDay> time;
  Activity({int id, String name, TypeActivity type, TimeOfDay time})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.type = ValueNotifier<TypeActivity>(type),
        this.time =
            ValueNotifier<TimeOfDay>(time ?? TimeOfDay(hour: 0, minute: 0));
}
