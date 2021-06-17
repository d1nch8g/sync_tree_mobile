import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'copyKey.dart';
import 'changeKey.dart';
import 'generateKey.dart';
import 'pin.dart';

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
          ListView(
            padding: EdgeInsets.all(8.0),
            shrinkWrap: true,
            children: [
              CopyKeyTile(),
              Divider(),
              ChangeKeyTile(),
              Divider(),
              GenerateNewKeys(),
              Divider(),
              SetPinCode(),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.person_pin_sharp,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Change public name',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'You can simply change public name, using single request.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.save_rounded,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Save changes to server',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'This button is made to .',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
