import 'package:flutter/cupertino.dart';

class SchoolModel {
  final id = ValueNotifier<int>(null);
  final name = ValueNotifier<String>(null);
  final doc = ValueNotifier<String>(null);
  final address = ValueNotifier<String>(null);
  final district = ValueNotifier<String>(null);
  final city = ValueNotifier<String>(null);
  final state = ValueNotifier<String>(null);
  final phone = ValueNotifier<String>(null);
  final whatsapp = ValueNotifier<String>(null);
  final website = ValueNotifier<String>(null);
  changeId(int i) => id.value = i;
  changeName(String n) => name.value = n;
  changeAddress(String a) => address.value = a;
  changeDistrict(String d) => district.value = d;
  changeCity(String c) => city.value = c;
  changeState(String s) => state.value = s;
  changePhone(String p) => phone.value = p;
  changeWhatsapp(String w) => whatsapp.value = w;
  changeWebsite(String w) => website.value = w;
  changeDoc(String c) => doc.value = c;
}
