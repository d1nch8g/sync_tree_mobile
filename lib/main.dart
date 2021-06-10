import 'package:flutter/material.dart';
import 'primary.dart';
import 'start/main.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(35, 37, 40, 1.0),
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
      ),
      home: PrimaryPage(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => PrimaryPage(),
        '/firstLaunch': (BuildContext context) => IntroPage(),
      },
    );
  }
}
