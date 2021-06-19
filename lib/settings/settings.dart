import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'copyKey.dart';
import 'changeKey.dart';
import 'generateKey.dart';
import 'pinSetting.dart';
import 'licenses.dart';
import 'pubName.dart';
import 'sendChanges.dart';

import '../navigator.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Widget dynamicName;

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pubName') ?? 'name error';
  }

  void startNameChecking() {
    mainStream.listen((stringEvent) {
      if (stringEvent == 'nameChange') {
        getName().then(
          (value) => {
            setState(() {
              dynamicName = DynamicName(
                value,
                UniqueKey(),
              );
            })
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    dynamicName = DynamicName(
      'loading',
      UniqueKey(),
    );
    getName().then((value) => {
          setState(() {
            dynamicName = DynamicName(
              value,
              UniqueKey(),
            );
          })
        });
    startNameChecking();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.settings_applications,
            size: 129,
            color: Theme.of(context).hintColor,
          ),
          AnimatedSwitcher(
            child: dynamicName,
            duration: Duration(milliseconds: 377),
          ),
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
                SendChangesTile(),
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

class DynamicName extends StatelessWidget {
  final String name;
  final Key key;
  DynamicName(this.name, this.key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
