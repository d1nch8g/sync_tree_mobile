import 'package:flutter/material.dart';

class LicensesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.ad_units,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        showAboutDialog(context: context);
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
