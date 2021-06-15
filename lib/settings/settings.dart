import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.settings_applications,
            size: 134,
            color: Theme.of(context).hintColor,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.vpn_key,
              color: Theme.of(context).hoverColor,
              size: 42,
            ),
            title: Text(
              'Manage personal key',
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: Icon(
              Icons.lock,
              color: Theme.of(context).hoverColor,
              size: 42,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
