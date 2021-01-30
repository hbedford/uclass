import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/text_channel.dart';
import 'package:uclass/domain/entities/user.dart';
import 'package:uclass/domain/entities/video_channel.dart';

import 'module.dart';

class Class {
  final ValueNotifier<int> id;
  final ValueNotifier<String> name;
  final ValueNotifier<User> teacher;
  final ValueNotifier<List<User>> members;
  final ValueNotifier<Color> color;
  final ValueNotifier<int> percent;
  final ValueNotifier<Module> module;
  final ValueNotifier<String> limitMembers;
  final ValueNotifier<List<Module>> modules;
  final ValueNotifier<TextChannel> textChannel;
  final ValueNotifier<List<TextChannel>> textChannels;
  final ValueNotifier<VideoChannel> videoChannel;
  final ValueNotifier<List<VideoChannel>> videoChannels;
  final ValueNotifier<DateTime> lastAccess;
  final ValueNotifier<TextEditingController> limitEdit =
      ValueNotifier<TextEditingController>(TextEditingController());
  final ValueNotifier<List<User>> admins;
  Class(
      {int id,
      String name,
      User teacher,
      List<User> admins,
      List<User> members,
      String limitMembers = '',
      Color color,
      int percent,
      Module module,
      List<Module> modules,
      TextChannel textChannel,
      List<TextChannel> textChannels,
      VideoChannel videoChannel,
      List<VideoChannel> videoChannels,
      DateTime lastAccess})
      : this.id = ValueNotifier<int>(id),
        this.admins = ValueNotifier<List<User>>(admins ?? []),
        this.name = ValueNotifier<String>(name = ''),
        this.teacher = ValueNotifier<User>(teacher),
        this.members = ValueNotifier<List<User>>(members ?? []),
        this.limitMembers = ValueNotifier<String>(limitMembers),
        this.color = ValueNotifier<Color>(color ?? Colors.black),
        this.percent = ValueNotifier<int>(percent),
        this.module = ValueNotifier<Module>(module),
        this.modules = ValueNotifier<List<Module>>(modules ?? []),
        this.textChannel = ValueNotifier<TextChannel>(textChannel),
        this.textChannels =
            ValueNotifier<List<TextChannel>>(textChannels ?? []),
        this.videoChannel = ValueNotifier<VideoChannel>(videoChannel),
        this.videoChannels =
            ValueNotifier<List<VideoChannel>>(videoChannels ?? []),
        this.lastAccess = ValueNotifier<DateTime>(lastAccess);

  changeName(String value) => name.value = value;
  changeTeacher(User value) => teacher.value = value;
  changeLimitMembers(String value) {
    limitMembers.value = value;
    if (value.isEmpty) limitEdit.value.clear();
  }

  changeColor(Color value) => color.value = value;
  changePercent(int value) => percent.value = value;
  changeLastAccess(DateTime value) => lastAccess.value = value;
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

  bool get isValidName => name.value.isNotEmpty && name.value.length > 2;
  bool get isValidAdmins => admins.value != null;
}
