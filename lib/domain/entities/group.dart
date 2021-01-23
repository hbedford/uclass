import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/user.dart';

class Group {
  final id = ValueNotifier<int>(null);
  final ValueNotifier<List<User>> groupList = ValueNotifier<List<User>>(null);
}
