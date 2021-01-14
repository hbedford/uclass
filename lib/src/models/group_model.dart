import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/user_chat_model.dart';

class GroupModel {
  final id = ValueNotifier<int>(null);
  final ValueNotifier<List<UserChatModel>> groupList =
      ValueNotifier<List<UserChatModel>>(null);
}
