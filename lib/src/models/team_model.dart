import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/teacher_model.dart';

class TeamModel {
  final id = ValueNotifier<int>(null);
  final name = ValueNotifier<String>(null);
  final image = ValueNotifier(null);
  final teacher = ValueNotifier<TeacherModel>(null);
  final teachers = ValueNotifier<List>([]);
  changeId(int i) => id.value = i;
  changeName(String n) => name.value = n;
  changeImage(String i) => image.value = i;
  changeTeacher(TeacherModel t) => teacher.value = t;
  changeTeachers(List<TeacherModel> t) => teachers.value = t;
  addTeacher(TeacherModel t) => teachers.value.add(t);
  removeTeacher(TeacherModel t) => teachers.value.remove(t);
}
