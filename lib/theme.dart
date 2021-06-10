import 'package:flutter/material.dart';
import 'navigator.dart';
import 'start/hello.dart';
import 'start/imageAndName.dart';
import 'start/keys.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(35, 37, 40, 1.0),
        focusColor: Color.fromRGBO(234, 246, 255, 1.0),
        hintColor: Color.fromRGBO(255, 164, 0, 1.0),
        hoverColor: Color.fromRGBO(0, 159, 253, 1.0),
        buttonColor: Color.fromRGBO(42, 42, 114, 1.0),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color.fromRGBO(234, 246, 255, 1.0),
            fontSize: 44,
            fontFamily: 'Hind',
          ),
          headline2: TextStyle(
            color: Color.fromRGBO(234, 246, 255, 1.0),
            fontSize: 26.2,
            fontFamily: 'Hind',
            fontWeight: FontWeight.w200,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Color.fromRGBO(234, 246, 255, 1.0),
            side: BorderSide(
              color: Color.fromRGBO(234, 246, 255, 1.0),
              width: 0.58,
            ),
            textStyle: TextStyle(
              fontSize: 24.4,
              fontFamily: 'Hind',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      home: PrimaryPage(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => PrimaryPage(),
        '/firstLaunch': (BuildContext context) => IntroPage(),
        '/googleSign': (BuildContext context) => GoogleAuth(),
        '/keySave': (BuildContext context) => KeySave(),
      },
    );
  }
}