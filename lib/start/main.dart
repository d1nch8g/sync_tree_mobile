import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  Future<bool> firstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstLaunch = prefs.getBool('firstLaunch');
    prefs.setBool('firstLaunch', false);
    print(firstLaunch);
    return firstLaunch ?? true;
  }

  @override
  Widget build(BuildContext context) {
    firstLaunch().then(
      (firstLaunch) => {
        if (firstLaunch) {Navigator.pushNamed(context, '/app')},
      },
    );
    return Center(
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: Text('hello'),
            onPressed: () {
              Navigator.pushNamed(context, '/app');
            },
          ),
        ),
      ),
    );
  }
}
