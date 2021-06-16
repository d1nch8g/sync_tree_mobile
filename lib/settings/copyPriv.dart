import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';
import '/widgets/all.dart';

copyPrivateKey(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var key = prefs.getString('persPriv');
  FlutterClipboard.copy(key);
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
