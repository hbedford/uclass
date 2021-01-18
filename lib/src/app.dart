import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uclass/src/home/home_screen.dart';
import 'package:uclass/src/loading/loading_screen.dart';
import 'package:uclass/src/login/login_screen.dart';
import 'package:flutter/foundation.dart' as platform;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color def = Colors.white;
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('pt', 'BR'),
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          scaffoldBackgroundColor: Color(0xff050D10),
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
              borderRadius:
                  new BorderRadius.circular(platform.kIsWeb ? 30 : 18.0),
            ),
          )),
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      initialRoute: '/loading',
    );
  }
}
