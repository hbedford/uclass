import 'package:flutter/cupertino.dart';

class TextChannelModel {
  final id = ValueNotifier<int>(null);
  final ValueNotifier<String> name;
  TextChannelModel({String name}) : this.name = ValueNotifier<String>(name);
}
