import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/user.dart';

import 'group.dart';

class Conversation {
  final id;
  final isGroup;
  final ValueNotifier<Group> group;
  final ValueNotifier<Color> color;
  final ValueNotifier<User> user;
  final ValueNotifier<bool> isOpened;
  Conversation(
      {int id,
      bool isGroup,
      Group group,
      Color color,
      User user,
      bool isOpened})
      : this.id = ValueNotifier<int>(id),
        this.isGroup = ValueNotifier<bool>(isGroup),
        this.group = ValueNotifier<Group>(group),
        this.user = ValueNotifier<User>(user),
        this.color = ValueNotifier<Color>(color),
        this.isOpened = ValueNotifier<bool>(isOpened);
  changeIsOpened() => isOpened.value = !isOpened.value;
}
