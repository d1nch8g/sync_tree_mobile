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
              'Change private key',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              'When you use another private key current one will be lost.',
              style: Theme.of(context).textTheme.headline6,
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
              'Generate new keys',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              'If you generate new keys, current keys will be deleted. Save them in safe place.',
              style: Theme.of(context).textTheme.headline6,
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
              'Set pin code',
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              'When you set a pin, it will be required for each wallet action.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
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
        ],
      ),
    );
  }
}
