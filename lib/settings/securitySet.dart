import 'package:flutter/material.dart';

import '/widgets/all.dart';

class SecuritySetTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.shield_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        checkPwd(context, () {});
      },
      title: Text(
        'Security settings',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Here you can configure which application actions will require pin.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
