import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_local/stream.dart';

import 'copyKey.dart';
import 'changeKey.dart';
import 'generateKey.dart';
import 'pinSetting.dart';
import 'licenses.dart';
import 'pubName.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.settings_applications,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          DynamicName(),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(3.0),
              children: [
                CopyKeyTile(),
                Divider(),
                ChangeKeyTile(),
                Divider(),
                GenerateKeyTile(),
                Divider(),
                SetPinTile(),
                Divider(),
                PublicNameTile(),
                Divider(),
                LicensesTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicName extends StatefulWidget {
  @override
  _DynamicNameState createState() => _DynamicNameState();
}

class _DynamicNameState extends State<DynamicName> {
  String name = '';

  void onNameChanged() async {
    setState(() {
      name = loadValueSync(StorageKey.publicName);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      name = loadValueSync(StorageKey.publicName);
    });
    triggerListener(
      Trigger.publicNameUpdate,
      onNameChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: Text(
        name,
        style: Theme.of(context).textTheme.headline3,
      ),
      duration: Duration(milliseconds: 377),
    );
  }
}
