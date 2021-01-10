import 'package:flutter/material.dart';
import 'package:uclass/src/home/home_screen.dart';
import 'package:uclass/src/loading/loading_screen.dart';
import 'package:uclass/src/login/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen()
      },
      initialRoute: '/loading',
    );
  }
}
