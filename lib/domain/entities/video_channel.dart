import 'package:flutter/cupertino.dart';

class VideoChannel {
  final id;
  final ValueNotifier<String> name;
  VideoChannel({int id, String name})
      : this.id = ValueNotifier<int>(id),
        this.name = ValueNotifier<String>(name);
}
