import 'package:flutter/cupertino.dart';

class AdminModel {
  final id = ValueNotifier<int>(null);
  final name = ValueNotifier<String>(null);
  final email = ValueNotifier<String>(null);
  final password = ValueNotifier<String>(null);
  final phone = ValueNotifier<String>(null);
  final doc = ValueNotifier<String>(null);
  final pin = ValueNotifier<String>(null);
  changeId(int i) => id.value = i;
  changeName(String n) => name.value = n;
  changeEmail(String e) => email.value = e;
  changePassword(String p) => password.value = p;
  changePhone(String p) => phone.value = p;
  changeDoc(String d) => doc.value = d;
  changePin(String p) => pin.value = p;
}
