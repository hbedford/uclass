import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

class ClassesController {
  final ValueNotifier<Class> classe;
  final ValueNotifier<int> step;
  final ValueNotifier<List<Class>> classes;
  ClassesController({Class classe, int step, List<Class> classes})
      : this.classe = ValueNotifier(classe),
        this.step = ValueNotifier<int>(step),
        this.classes = ValueNotifier<List<Class>>(classes);
  changeStep(int s) => step.value = s;
}
