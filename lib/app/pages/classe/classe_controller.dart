import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/user/user_controller.dart';
import 'package:uclass/domain/entities/class.dart';

class ClasseController {
  final ValueNotifier<Class> classe;
  final ValueNotifier<List<Class>> classes;
  final ValueNotifier<int> step;
  ClasseController({Class classe, List<Class> classes, int step})
      : this.classe = ValueNotifier<Class>(classe),
        this.step = ValueNotifier<int>(step),
        this.classes = ValueNotifier<List<Class>>(classes);
  List<Class> get teacherClasses {
    List<Class> list = [];
    classes.value.forEach((e) {
      final controller = GetIt.I.get<UserController>();
      if (e.teacher.value.id.value == controller.user.value.id.value)
        list.add(e);
    });
    return list;
  }

  List<Class> get studentClasses {
    List<Class> list = [];
    classes.value.forEach((e) {
      final controller = GetIt.I.get<UserController>();
      if (e.teacher.value.id.value != controller.user.value.id.value)
        list.add(e);
    });
    return list;
  }

  changeStep(int s) => step.value = s;
}
