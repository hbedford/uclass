import 'package:flutter/cupertino.dart';

class VideoChannelModel {
  final id;
  final ValueNotifier<String> name;
  VideoChannelModel({int id, String name})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name);
}
