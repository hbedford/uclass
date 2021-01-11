import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/teacher_model.dart';

class ClassModel {
  final title = ValueNotifier<String>(null);
  final teacher = ValueNotifier<TeacherModel>(null);
  final students = ValueNotifier<int>(null);
  final color = ValueNotifier<Color>(null);
  final percent = ValueNotifier<int>(null);
  ClassModel(
      {String name,
      TeacherModel teacherModel,
      int studentsNumber,
      Color color,
      int percent}) {
    changeTitle(name);
    changePercent(percent);
    changeTeacher(teacherModel);
    changeStudents(studentsNumber);
    changeColor(color);
  }
  changeTitle(String t) => title.value = t;
  changeTeacher(TeacherModel t) => teacher.value = t;
  changeStudents(int s) => students.value = s;
  changeColor(Color c) => color.value = c;
  changePercent(int p) => percent.value = p;
}
