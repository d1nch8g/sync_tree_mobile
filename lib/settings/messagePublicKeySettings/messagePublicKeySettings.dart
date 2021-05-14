import 'package:flutter/material.dart';

import 'package:wallet_app/_reusable/text.dart';
import 'package:wallet_app/_reusable/box.dart';
import 'package:wallet_app/_reusable/corneredIconButton.dart';

class MessagePublicKeySettings extends StatefulWidget {
  @override
  _MessagePublicKeySettingsState createState() =>
      _MessagePublicKeySettingsState();
}

class _MessagePublicKeySettingsState extends State<MessagePublicKeySettings> {
  //TODO сделать отгрузку имени из блокчейна или sharedpreferences

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
                children: [Rtext(text: 'Message public key:')],
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
