import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/box.dart';
import 'package:sync_tree_mobile/_reusable/text.dart';

class AvatarSettings extends StatefulWidget {
  @override
  _AvatarSettingsState createState() => _AvatarSettingsState();
}

class _AvatarSettingsState extends State<AvatarSettings> {
  //TODO Дописать отгрузку аватарки из блокчейна/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Rbox(
        color: Colors.grey.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Rtext(text: 'Public avatar:'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade700,
                child: ClipOval(
                  child: Image.network(
                    "https://i5.stat01.com/2/126/101258584/afacdb/milyj-vo-frankse-darling-in-the-franxx-nendoroid-zero-two.jpg",
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
