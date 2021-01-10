import 'package:flutter/material.dart';
import 'package:uclass/src/home/home_screen.dart';
import 'package:uclass/src/loading/loading_screen.dart';
import 'package:uclass/src/login/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color def = Colors.white;
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Gotham',
          accentColor: Colors.white,

          /* primaryTextTheme: TextTheme(
              button: TextStyle(fontFamily: 'Gotham', color: Colors.white)), */
          /*  textTheme: TextTheme(
              button: TextStyle(fontFamily: 'Gotham', color: Colors.white)), */
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme(
                primary: Color(0xff20D261),
                primaryVariant: Color(0xff8a8a8a),
                secondary: Colors.white,
                secondaryVariant: Color(0xff8A8A8A),
                surface: def,
                background: def,
                error: def,
                onPrimary: def,
                onSecondary: def,
                onSurface: def,
                onBackground: def,
                onError: def,
                brightness: Brightness.light),
            textTheme: ButtonTextTheme.accent,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
          )),
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen()
      },
      initialRoute: '/loading',
    );
  }
}
