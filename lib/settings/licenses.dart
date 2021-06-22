import 'package:flutter/material.dart';

class LicensesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.article_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationName: 'name: sync tree mobile',
          applicationVersion: 'version: 0.0.1',
          applicationLegalese: 'made with love and flutter',
          applicationIcon: FlutterLogo(),
          useRootNavigator: false,
        );
      },
      title: Text(
        'Show licenses',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'This dialog shows all licenses used on application build.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
