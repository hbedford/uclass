import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/classes/classes_controller.dart';

import 'app/chat/chat_controller.dart';
import 'app/pages/home/home_controller.dart';
import 'app/pages/login/login_controller.dart';
import 'domain/entities/class.dart';
import 'domain/entities/conversation.dart';
import 'domain/entities/user.dart';
import 'src/app.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<ClassesController>(
      ClassesController(classe: Class(), step: 2));
  getIt.registerSingleton<ChatController>(ChatController(conversations: [
    Conversation(
        color: Colors.blue, isOpened: true, user: User(name: 'Corona Virus'))
  ]));
  runApp(App());
}
