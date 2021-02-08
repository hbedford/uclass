import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/popup_user_controller.dart';
import 'package:uclass/app/user/user_controller.dart';
import 'package:uclass/infra/moka/moka_classes.dart';
import 'package:uclass/infra/moka/moka_conversations.dart';
import 'package:uclass/infra/moka/moka_notifications.dart';
import 'package:uclass/infra/moka/moka_users.dart';

import 'app/chat/chat_controller.dart';
import 'app/notification/notification_controller.dart';
import 'app/pages/classe/classe_controller.dart';
import 'app/pages/home/home_controller.dart';
import 'app/pages/login/login_controller.dart';
import 'domain/entities/class.dart';
import 'src/app.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<PopUpUserController>(PopUpUserController());
  getIt.registerSingleton<NotificationController>(
      NotificationController(notifications: MokaNotifications().notifications));
  getIt.registerSingleton<UserController>(
      UserController(user: MokaUsers().userLogin));
  getIt.registerSingleton<ClasseController>(
    ClasseController(classe: Class(), classes: MokaClasses().list),
  );
  getIt.registerSingleton<ChatController>(ChatController(
      conversations: MokaConversations().conversations,
      conversation: MokaConversations().conversations[0]));
  runApp(App());
}
