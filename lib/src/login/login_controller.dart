import 'package:flutter/cupertino.dart';

class LoginController {
  final type = ValueNotifier<bool>(false);
  final email = ValueNotifier<TextEditingController>(TextEditingController());
  final password =
      ValueNotifier<TextEditingController>(TextEditingController());
  final repeatPassword =
      ValueNotifier<TextEditingController>(TextEditingController());
  changeType(bool t) => type.value = t;
  get emailIsValid => email.value.text.contains('@');
  get passwordIsValid => password.value.text.length >= 4;
  get repeatPasswordIsValid => password.value.text == repeatPassword.value.text;
}
