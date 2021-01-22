import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uclass/src/models/class_model.dart';

class ClassesController {
  final ValueNotifier<ClassModel> classe;
  final ValueNotifier<int> step;
  final ValueNotifier<List<ClassModel>> classes;
  ClassesController({ClassModel classe, int step, List<ClassModel> classes})
      : this.classe = ValueNotifier(classe),
        this.step = ValueNotifier<int>(step),
        this.classes = ValueNotifier<List<ClassModel>>(classes);
  changeStep(int s) => step.value = s;
}
