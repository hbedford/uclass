import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/text_channel.dart';
import 'package:uclass/domain/entities/user.dart';
import 'package:uclass/domain/entities/video_channel.dart';

import 'module.dart';

class Class {
  final ValueNotifier<String> title;
  final ValueNotifier<User> teacher;
  final ValueNotifier<List<User>> members;
  final ValueNotifier<Color> color;
  final ValueNotifier<int> percent;
  final ValueNotifier<Module> module;
  final ValueNotifier<List<Module>> modules;
  final ValueNotifier<TextChannel> textChannel;
  final ValueNotifier<List<TextChannel>> textChannels;
  final ValueNotifier<VideoChannel> videoChannel;
  final ValueNotifier<List<VideoChannel>> videoChannels;
  Class(
      {String title,
      User teacher,
      List<User> members,
      Color color,
      int percent,
      Module module,
      List<Module> modules,
      TextChannel textChannel,
      List<TextChannel> textChannels,
      VideoChannel videoChannel,
      List<VideoChannel> videoChannels})
      : this.title = ValueNotifier<String>(title),
        this.teacher = ValueNotifier<User>(teacher),
        this.members = ValueNotifier<List<User>>(members ?? []),
        this.color = ValueNotifier<Color>(color ?? Colors.black),
        this.percent = ValueNotifier<int>(percent),
        this.module = ValueNotifier<Module>(module),
        this.modules = ValueNotifier<List<Module>>(modules ?? []),
        this.textChannel = ValueNotifier<TextChannel>(textChannel),
        this.textChannels =
            ValueNotifier<List<TextChannel>>(textChannels ?? []),
        this.videoChannel = ValueNotifier<VideoChannel>(videoChannel),
        this.videoChannels =
            ValueNotifier<List<VideoChannel>>(videoChannels ?? []);

  changeTitle(String t) => title.value = t;
  changeTeacher(User t) => teacher.value = t;
  changeColor(Color c) => color.value = c;
  changePercent(int p) => percent.value = p;
  addModule() {
    module.value = Module();
    /*  modules.value.add(Module(name: 'Teste'));
    modules.notifyListeners(); */
  }

  saveModule() {
    module.value.save();
  }

  cancelModule() {
    module.value = null;
  }

  addTextChannel() {
    textChannels.value.add(TextChannel(name: 'Teste'));
    textChannels.notifyListeners();
  }

  addVideoChannel() {
    videoChannels.value.add(VideoChannel(name: 'Teste'));
    videoChannels.notifyListeners();
  }

  List<Module> get modulesWithAdd {
    List<Module> l = List.of(modules.value);
    l.add(Module(name: null));
    return l;
  }

  List<TextChannel> get tChannelWithAdd {
    List<TextChannel> l = List.of(textChannels.value);
    l.add(TextChannel(name: null));
    return l;
  }

  List<VideoChannel> get vChannelsWithAdd {
    List<VideoChannel> v = List.of(videoChannels.value);
    v.add(VideoChannel(name: null));
    return v;
  }
}
