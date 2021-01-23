import 'package:flutter/cupertino.dart';

class User {
  final id;
  final ValueNotifier<String> name;
  User({int id, String name})
      : this.id = ValueNotifier<int>(null),
        this.name = ValueNotifier<String>(null);
}
