import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void copyPrivateKey(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  var key = prefs.getString('persPriv');
  showDialog(
    context: context,
    builder: (_) => ButtonOverlay(
      () {
        Navigator.pushNamed(context, '/main');
      },
      messageText: 'Key is copied to\nclipboard. Save it\n in safe place!',
      buttonText: 'continue',
    ),
  );
}
