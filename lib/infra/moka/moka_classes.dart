import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';
import 'package:uclass/infra/moka/moka_users.dart';

class MokaClasses {
  final List<Class> list = [
    Class(
        id: 1,
        teacher: MokaUsers().teachers[0],
        percent: 7,
        name: 'Biologia Marinha',
        color: Colors.green,
        lastAccess: DateTime(2021, 01, 27, 11, 20, 01)),
    Class(
        id: 2,
        teacher: MokaUsers().teachers[1],
        percent: 3,
        name: 'Filosofia',
        color: Colors.purple,
        lastAccess: DateTime(2021, 01, 27, 10, 30, 02))
  ];
}
