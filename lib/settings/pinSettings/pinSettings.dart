import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/text.dart';
import 'package:sync_tree_mobile/_reusable/box.dart';
import 'package:sync_tree_mobile/_reusable/iconTextButton.dart';

class PinSettings extends StatefulWidget {
  @override
  _PinSettingsState createState() => _PinSettingsState();
}

class _PinSettingsState extends State<PinSettings> {
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
                children: [Rtext(text: 'Pin settings:')],
              ),
              Row(
                children: [
                  SizedBox(width: 7),
                  RbuttonIconText(
                    text: 'change pin',
                    icon: Icons.lock_outlined,
                    onPressed: () {},
                    borderWidth: 1.2,
                    buttonColor: Colors.grey.shade900,
                    borderColor: Colors.grey.shade400,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
