import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

import '/widgets/all.dart';
import '/crypt.dart';

class GenerateNewKeys extends StatelessWidget {
  var crypt = Crypt();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => ButtonOverlay(
                  () {
                    var futKeys = crypt.generateKeys();
                    futKeys.then((keys) => {
                      
                    });
                  },
                  mainText: 'Sure?\n'
                      'current key will\n'
                      'be replaced with\n'
                      'generated',
                  buttonText: 'continue',
                ));
      },
      leading: Icon(
        Icons.handyman_sharp,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Generate new keys',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'If you generate new keys, current keys will be deleted. Save them in safe place.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
