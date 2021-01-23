import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/teacher.dart';

class Team {
  final id = ValueNotifier<int>(null);
  final name = ValueNotifier<String>(null);
  final image = ValueNotifier(null);
  final teacher = ValueNotifier<Teacher>(null);
  final teachers = ValueNotifier<List>([]);
  changeId(int i) => id.value = i;
  changeName(String n) => name.value = n;
  changeImage(String i) => image.value = i;
  changeTeacher(Teacher t) => teacher.value = t;
  changeTeachers(List<Teacher> t) => teachers.value = t;
  addTeacher(Teacher t) => teachers.value.add(t);
  removeTeacher(Teacher t) => teachers.value.remove(t);
}
