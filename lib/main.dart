import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/home/home_controller.dart';

import 'src/app.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  runApp(App());
}
