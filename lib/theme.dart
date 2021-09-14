import 'package:flutter/material.dart';
import 'navigator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
        backgroundColor: Color.fromRGBO(42, 42, 114, 1.0), // purple
        focusColor: Color.fromRGBO(234, 246, 255, 1.0), // white
        hintColor: Color.fromRGBO(255, 164, 0, 1.0), // yellow
        hoverColor: Color.fromRGBO(0, 159, 253, 1.0), // blue
        cardColor: Color.fromRGBO(35, 37, 40, 1.0), // black
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
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
          headline3: TextStyle(
            color: Color.fromRGBO(35, 37, 40, 1.0),
            fontSize: 44,
            fontFamily: 'Hind',
          ),
          headline4: TextStyle(
            color: Color.fromRGBO(35, 37, 40, 1.0),
            fontSize: 26.2,
            fontFamily: 'Hind',
            fontWeight: FontWeight.w200,
          ),
          headline5: TextStyle(
            color: Color.fromRGBO(35, 37, 40, 1.0),
            fontSize: 16.2,
            fontFamily: 'Hind',
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            color: Color.fromRGBO(35, 37, 40, 1.0),
            fontSize: 14.2,
            fontFamily: 'Hind',
            fontWeight: FontWeight.w400,
          ),
          overline: TextStyle(
            color: Color.fromRGBO(234, 246, 255, 1.0),
            fontSize: 15.4,
          ),
          button: TextStyle(
            color: Color.fromRGBO(234, 246, 255, 1.0),
            fontSize: 26.2,
            fontFamily: 'Hind',
            fontWeight: FontWeight.w400,
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
      routes: routeMap,
    );
  }
}
