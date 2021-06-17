import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'copyKey.dart';
import 'changeKey.dart';
import 'generateKey.dart';
import 'changePin.dart';
import 'licenses.dart';
import 'pubName.dart';
import 'sendChanges.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _currentName = 'loading';

  setStartName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.get('pubName');
    setState(() {
      _currentName = name;
    });
  }

  @override
  void initState() {
    super.initState();
    setStartName();
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
            duration: Duration(milliseconds: 720),
            child: Text(
              _currentName,
              style: Theme.of(context).textTheme.headline3,
            ),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
            ) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              shrinkWrap: true,
              children: [
                CopyKeyTile(),
                Divider(),
                ChangeKeyTile(),
                Divider(),
                GenerateKeyTile(),
                Divider(),
                ChangePinTile(),
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
