import 'package:flutter/material.dart';

import '/widgets/all.dart';

class ChangePinTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.shield,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => PasswordOverlay(() {}),
        );
      },
      title: Text(
        'Set app password',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'When you set a password, it will be required for some operations.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
