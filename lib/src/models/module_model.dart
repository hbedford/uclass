import 'package:flutter/cupertino.dart';

class ModuleModel {
  final ValueNotifier<int> id;
  final ValueNotifier<String> name;
  ModuleModel({int id, String name})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name);
}
