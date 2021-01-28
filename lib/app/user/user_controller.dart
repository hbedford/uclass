import 'package:flutter/cupertino.dart';
import 'package:uclass/domain/entities/user.dart';

class UserController {
  final ValueNotifier<User> user;
  UserController({User user}) : user = ValueNotifier<User>(user);
  changeUser(User value) => user.value = value;
}
