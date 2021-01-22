import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/chat/chat_controller.dart';
import 'package:uclass/src/classes/classes_controller.dart';
import 'package:uclass/src/home/home_controller.dart';
import 'package:uclass/src/login/login_controller.dart';
import 'package:uclass/src/models/class_model.dart';
import 'package:uclass/src/models/conversation_model.dart';
import 'package:uclass/src/models/user_chat_model.dart';

import 'src/app.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<ClassesController>(
      ClassesController(classe: ClassModel(), step: 2));
  getIt.registerSingleton<ChatController>(ChatController(conversations: [
    ConversationModel(
        color: Colors.blue,
        isOpened: true,
        user: UserChatModel(name: 'Corona Virus'))
  ]));
  runApp(App());
}
