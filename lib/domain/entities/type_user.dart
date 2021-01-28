import 'package:flutter/foundation.dart';

class TypeUser {
  final id;
  final ValueNotifier<String> name;
  TypeUser({int id})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(id == 0 ? 'Estudante' : 'Professor');
}
