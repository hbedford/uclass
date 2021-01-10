import 'package:flutter/cupertino.dart';

class LoginController {
  final type = ValueNotifier<bool>(false);
  changeType(bool t) => type.value = t;
}
