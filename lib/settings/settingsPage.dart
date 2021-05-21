import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/text.dart';

import 'avatarSettings/avatarSettings.dart';
import 'nameSettings/nameSettings.dart';
import 'messagePublicKeySettings/messagePublicKeySettings.dart';
import 'pinSettings/pinSettings.dart';
import 'mainPrivateKeySettings/mainPrivateKeySettings.dart';
import 'messagePrivateKeySettings/messagePrivateKeySettings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  IconData lock = Icons.lock_open_rounded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Rtext(
              text: 'Public settings:',
              fontSize: 21,
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView(
              children: [
                AvatarSettings(),
                NameSettings(),
                MessagePublicKeySettings(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rtext(
                  text: 'Private settings:',
                  fontSize: 21,
                ),
                IconButton(
                  icon: Icon(lock),
                  iconSize: 32,
                  onPressed: () {
                    if (lock == Icons.lock_open_rounded) {
                      setState(() {
                        lock = Icons.lock_outline_rounded;
                      });
                    } else {
                      //request password
                      setState(() {
                        lock = Icons.lock_open_rounded;
                      });
                    }
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                PinSettings(),
                MessagePrivateKeySettings(),
                MainPrivateKeySettings(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
