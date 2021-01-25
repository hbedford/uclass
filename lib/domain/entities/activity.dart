import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/type_activity.dart';

class Activity {
  final id;
  final name;
  final ValueNotifier<TypeActivity> type;
  final ValueNotifier<TimeOfDay> time;
  final types = [
    TypeActivity(id: 1, name: 'Aula ao vivo', image: 'assets/live.png'),
    TypeActivity(id: 2, name: 'Video aula', image: 'assets/callvideo.png'),
    TypeActivity(id: 3, name: 'Material', image: 'assets/folders.png'),
    TypeActivity(id: 4, name: 'Correção', image: 'assets/corrections.png'),
    TypeActivity(id: 5, name: 'Avisos', image: 'assets/warning.png')
  ];
  Activity({int id, String name, TypeActivity type, TimeOfDay time})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.type = ValueNotifier<TypeActivity>(type),
        this.time =
            ValueNotifier<TimeOfDay>(time ?? TimeOfDay(hour: 0, minute: 0));
  setType(TypeActivity value) => type.value = value;
}