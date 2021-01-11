import 'package:flutter/cupertino.dart';

class LoginController {
  final type = ValueNotifier<bool>(false);
  final email = ValueNotifier<TextEditingController>(TextEditingController());
  final password =
      ValueNotifier<TextEditingController>(TextEditingController());
  final repeatPassword =
      ValueNotifier<TextEditingController>(TextEditingController());
  final code = ValueNotifier<TextEditingController>(TextEditingController());
  final step = ValueNotifier<int>(0);
  final name = ValueNotifier<TextEditingController>(TextEditingController());
  final function = ValueNotifier<String>(null);
  changeType(bool t) => type.value = t;
  changeStep(int s) => step.value = s;
  changeFunction(String f) => function.value = f;
  confirm(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  get emailIsValid => email.value.text.contains('@');
  get passwordIsValid => password.value.text.length >= 4;
  get repeatPasswordIsValid => password.value.text == repeatPassword.value.text;
}
