import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/user.dart';

class Student extends User {
  final id;
  final image;
  Student({int id, String image})
      : this.id = ValueNotifier<int>(id),
        this.image = ValueNotifier<String>(image);
}
