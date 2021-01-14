import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/type_user_model.dart';

class UserChatModel {
  final id;
  final ValueNotifier<String> name;
  final ValueNotifier<TypeUserModel> type;
  UserChatModel({int id, String name, TypeUserModel type})
      : this.id = ValueNotifier<int>(null),
        this.name = ValueNotifier<String>(null),
        this.type = ValueNotifier<TypeUserModel>(null);
}
