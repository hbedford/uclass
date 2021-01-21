import 'package:flutter/material.dart';
import 'package:uclass/src/models/class_model.dart';

class ClassesController {
  final ValueNotifier<ClassModel> classe =
      ValueNotifier<ClassModel>(ClassModel());
  final ValueNotifier<List<ClassModel>> classes =
      ValueNotifier<List<ClassModel>>([]);
}