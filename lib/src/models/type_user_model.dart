import 'package:flutter/foundation.dart';

class TypeUserModel {
  final id;
  final ValueNotifier<String> name;
  TypeUserModel({int id, String name})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name);
}
