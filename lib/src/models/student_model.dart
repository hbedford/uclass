import 'package:flutter/cupertino.dart';

class StudentModel {
  final id;
  final name;
  final image;
  StudentModel({int id, String name, String image})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.image = ValueNotifier<String>(image);
}
