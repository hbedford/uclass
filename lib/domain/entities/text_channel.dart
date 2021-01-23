import 'package:flutter/cupertino.dart';

class TextChannel {
  final id = ValueNotifier<int>(null);
  final ValueNotifier<String> name;
  TextChannel({String name}) : this.name = ValueNotifier<String>(name);
}
