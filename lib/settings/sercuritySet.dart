import 'package:flutter/material.dart';


class SetPinTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.shield_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
      },
      title: Text(
        'Security settings',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Here you can configure which application actions will require pin settings',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}