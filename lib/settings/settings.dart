import 'dart:async';

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

class SettingsPage extends StatelessWidget {
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
            child: PublicName(),
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

class PublicName extends StatefulWidget {
  @override
  _PublicNameState createState() => _PublicNameState();
}

class _PublicNameState extends State<PublicName> {
  String _currentName = 'loading';

  setName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('pubName');
    setState(() {
      _currentName = name ?? '';
    });
  }

  void startNameChecking() async {
    mainStream.listen((stringEvent) {
      if (stringEvent == 'nameChange') {
        setName();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setName();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 233),
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
    );
  }
}
