import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  Future<bool> navigateToMain(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstLaunch = prefs.getBool('notFirstLaunch');
    if (firstLaunch) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
