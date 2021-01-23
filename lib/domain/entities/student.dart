import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/user.dart';

class Student extends User {
  final id;
  final name;
  final image;
  Student({int id, String name, String image})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.image = ValueNotifier<String>(image);
}
