import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';
import 'package:uclass/infra/moka/moka_users.dart';

class MokaClasses {
  final List<Class> list = [
    Class(
        teacher: MokaUsers().teachers[0],
        percent: 7,
        title: 'Biologia Marinha',
        color: Colors.green),
    Class(
        teacher: MokaUsers().teachers[1],
        percent: 3,
        title: 'Filosofia',
        color: Colors.purple)
  ];
}
