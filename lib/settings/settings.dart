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
            size: 129,
            color: Theme.of(context).hintColor,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.vpn_key,
              color: Theme.of(context).hoverColor,
              size: 29,
            ),
            title: Text(
              'Copy private key',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              'Get copy of your private key saved on your device and copy it to clipboard.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: Theme.of(context).hoverColor,
              size: 29,
            ),
            title: Text(
              'change private key',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.handyman_sharp,
              color: Theme.of(context).hoverColor,
              size: 29,
            ),
            title: Text(
              'generate new keys',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shield,
              color: Theme.of(context).hoverColor,
              size: 29,
            ),
            title: Text(
              'set pin',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
