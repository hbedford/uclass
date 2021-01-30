import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/user/user_controller.dart';
import 'package:uclass/domain/entities/class.dart';

import 'dialogs/dialog_newclass_widget.dart';

class ClasseController {
  final ValueNotifier<Class> classe;
  final ValueNotifier<List<Class>> classes;
  final ValueNotifier<int> step;
  ClasseController({Class classe, List<Class> classes, int step = 0})
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

  List<Class> get recentsClasses {
    List<Class> list = [];
    classes.value.forEach((e) => list.add(e));
    list.sort((a, b) => b.lastAccess.value.compareTo(a.lastAccess.value));
    return list;
  }

  List<Class> get recentsClassesWithAdd {
    List<Class> list = [Class(id: null, lastAccess: DateTime.now())];
    classes.value.forEach((e) => list.add(e));
    list.sort((a, b) => b.lastAccess.value.compareTo(a.lastAccess.value));
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

  newClass(BuildContext context) {
    changeClass(Class());
    dialogNewClassModule(context);
  }

  addNameAndAdmins(BuildContext context) {
    if (classe.value.isValidName && classe.value.isValidAdmins) {
      changeStep(1);
      Navigator.pop(context);
    }
  }

  changeClass(Class value) => classe.value = value;
  changeStep(int s) => step.value = s;
  dialogNewClassModule(BuildContext context) => showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: Duration(milliseconds: 20),
        pageBuilder: (ctx, anim1, anim2) => AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 1),
          child: DialogNewClassWidget(),
        ),
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 8 * anim1.value, sigmaY: 8 * anim1.value),
          child: FadeTransition(
            child: Center(child: child),
            opacity: anim1,
          ),
        ),
        context: context,
      );
}
