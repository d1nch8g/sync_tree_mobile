import 'package:flutter/material.dart';
import '../src/src.dart';

import 'change_key.dart';
import 'copy_key.dart';
import 'generate_key.dart';
import 'licenses.dart';
import 'pub_name.dart';

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

  displayNewName() async {
    var loadedName = await Storage.loadPublicName();
    if (mounted) {
      setState(() {
        name = loadedName;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    displayNewName();
    Storage.createTriggerSubscription(
      trigger: Trigger.publicNameUpdate,
      onTriggerEvent: displayNewName,
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
