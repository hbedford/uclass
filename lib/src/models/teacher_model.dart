import 'package:flutter/cupertino.dart';

class TeacherModel {
  final id = ValueNotifier<int>(null);
  final name = ValueNotifier<String>(null);
  final doc = ValueNotifier<String>(null);
  final phone = ValueNotifier<String>(null);
  final dateBirth = ValueNotifier<DateTime>(null);
  final password = ValueNotifier<String>(null);
  final email = ValueNotifier<String>(null);
  final pin = ValueNotifier<String>(null);
  TeacherModel({
    int id,
    String name,
    String doc,
    String phone,
    DateTime birth,
  }) {
    changeId(id);
    changeName(name);
    changeDoc(doc);
    changePhone(phone);
    changeBirth(birth);
  }
  changeId(int i) => id.value = i;
  changeName(String n) => name.value = n;
  changeDoc(String d) => doc.value = d;
  changePhone(String p) => phone.value = p;
  changeBirth(DateTime d) => dateBirth.value = d;
  changePassword(String p) => password.value = p;
  changeEmail(String e) => email.value = e;
  changePin(String p) => pin.value = p;
}
