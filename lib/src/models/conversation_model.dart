import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/group_model.dart';
import 'package:uclass/src/models/user_chat_model.dart';

class ConversationModel {
  final id;
  final isGroup;
  final ValueNotifier<GroupModel> group;
  final ValueNotifier<Color> color;
  final ValueNotifier<UserChatModel> user;
  final ValueNotifier<bool> isOpened;
  ConversationModel(
      {int id,
      bool isGroup,
      GroupModel group,
      Color color,
      UserChatModel user,
      bool isOpened})
      : this.id = ValueNotifier<int>(id),
        this.isGroup = ValueNotifier<bool>(isGroup),
        this.group = ValueNotifier<GroupModel>(group),
        this.user = ValueNotifier<UserChatModel>(user),
        this.color = ValueNotifier<Color>(color),
        this.isOpened = ValueNotifier<bool>(isOpened);
  changeIsOpened() => isOpened.value = !isOpened.value;
}
