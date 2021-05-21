import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/text.dart';
import 'package:sync_tree_mobile/_reusable/box.dart';
import 'package:sync_tree_mobile/_reusable/corneredIconButton.dart';

class MessagePrivateKeySettings extends StatefulWidget {
  @override
  _MessagePrivateKeySettingsState createState() =>
      _MessagePrivateKeySettingsState();
}

class _MessagePrivateKeySettingsState extends State<MessagePrivateKeySettings> {
  //TODO сделать отгрузку из блокчейна или sharedpreferences

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Rbox(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Rtext(text: 'Message private key:')],
              ),
              RcorneredIconButton(
                icon: Icons.arrow_forward_ios,
                onPressed: () {},
                backGroundColor: Colors.grey.shade700,
                iconColor: Colors.grey.shade300,
                splashColor: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
