import 'package:flutter/cupertino.dart';
import 'package:uclass/src/models/student_model.dart';
import 'package:uclass/src/models/teacher_model.dart';
import 'package:uclass/src/models/text_channel_model.dart';
import 'package:uclass/src/models/video_channel_model.dart';

import 'module_model.dart';

class ClassModel {
  final title;
  final teacher;
  final ValueNotifier<List<StudentModel>> members;
  final color;
  final percent;
  final ValueNotifier<List<ModuleModel>> modules;
  final ValueNotifier<List<TextChannelModel>> textChannels;
  final ValueNotifier<List<VideoChannelModel>> videoChannels;
  ClassModel(
      {String title,
      TeacherModel teacher,
      List<StudentModel> members,
      Color color,
      int percent,
      List<ModuleModel> modules,
      List<TextChannelModel> textChannels,
      List<VideoChannelModel> videoChannels})
      : this.title = ValueNotifier<String>(title),
        this.modules = ValueNotifier<List<ModuleModel>>(modules ?? []),
        this.teacher = ValueNotifier<TeacherModel>(teacher),
        this.members = ValueNotifier<List<StudentModel>>(members ?? []),
        this.color = ValueNotifier<Color>(color),
        this.percent = ValueNotifier<int>(percent),
        this.textChannels =
            ValueNotifier<List<TextChannelModel>>(textChannels ?? []),
        this.videoChannels =
            ValueNotifier<List<VideoChannelModel>>(videoChannels ?? []);

  changeTitle(String t) => title.value = t;
  changeTeacher(TeacherModel t) => teacher.value = t;
  changeColor(Color c) => color.value = c;
  changePercent(int p) => percent.value = p;
  addModule() {
    modules.value.add(ModuleModel(name: 'Teste'));
    modules.notifyListeners();
  }

  addTextChannel() {
    textChannels.value.add(TextChannelModel(name: 'Teste'));
    textChannels.notifyListeners();
  }

  addVideoChannel() {
    videoChannels.value.add(VideoChannelModel(name: 'Teste'));
    videoChannels.notifyListeners();
  }

  List<ModuleModel> get modulesWithAdd {
    List<ModuleModel> l = List.of(modules.value);
    l.add(ModuleModel(name: null));
    return l;
  }

  List<TextChannelModel> get tChannelWithAdd {
    List<TextChannelModel> l = List.of(textChannels.value);
    l.add(TextChannelModel(name: null));
    return l;
  }

  List<VideoChannelModel> get vChannelsWithAdd {
    List<VideoChannelModel> v = List.of(videoChannels.value);
    v.add(VideoChannelModel(name: null));
    return v;
  }
}
