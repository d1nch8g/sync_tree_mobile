import 'package:flutter/material.dart';

import 'package:wallet_app/_reusable/text.dart';
import 'package:wallet_app/_reusable/box.dart';
import 'package:wallet_app/_reusable/corneredIconButton.dart';

class MainPrivateKeySettings extends StatefulWidget {
  @override
  _MainPrivateKeySettingsState createState() => _MainPrivateKeySettingsState();
}

class _MainPrivateKeySettingsState extends State<MainPrivateKeySettings> {
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
                children: [Rtext(text: 'Main private key:')],
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
