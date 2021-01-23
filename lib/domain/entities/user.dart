import 'package:flutter/cupertino.dart';

class User {
  final ValueNotifier<int> id;
  final ValueNotifier<String> name;

  final ValueNotifier<String> password;
  final ValueNotifier<String> email;
  final ValueNotifier<TextEditingController> editEmail;
  final ValueNotifier<TextEditingController> editPassword;
  final ValueNotifier<TextEditingController> editRepeatPassword;
  User({
    int id,
    String name,
    String password,
    String email,
  })  : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name),
        this.email = ValueNotifier<String>(email),
        this.password = ValueNotifier<String>(password),
        this.editEmail = ValueNotifier<TextEditingController>(
          TextEditingController(text: email ?? ''),
        ),
        this.editPassword =
            ValueNotifier<TextEditingController>(TextEditingController()),
        this.editRepeatPassword =
            ValueNotifier<TextEditingController>(TextEditingController());
}
