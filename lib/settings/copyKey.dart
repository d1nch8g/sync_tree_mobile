import 'dart:async';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';

import '/widgets/all.dart';
import '/pin/pin.dart';

class CopyKeyTile extends StatelessWidget {
  Future<String> getPrivKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('persPriv');
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      onTap: () {
        checkPwd(context, () {
          getPrivKey().then((privateKeyPem) {
            FlutterClipboard.copy(privateKeyPem);
            var _timer = Timer(Duration(milliseconds: 987), () {
              Navigator.of(context).pop();
            });
            showDialog(
              context: context,
              builder: (_) => MessageOverlay(
                mainText: 'key is copied\n'
                    'to clipboard',
              ),
            ).then(
              (value) => {
                if (_timer.isActive) {_timer.cancel()}
              },
            );
          });
        }, PinEnum.copyPrivate);
      },
      leading: Icon(
        Icons.vpn_key_outlined,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Copy private key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Get copy of your private key saved on your device and copy it to clipboard.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
