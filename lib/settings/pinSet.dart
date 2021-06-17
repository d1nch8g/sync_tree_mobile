import 'package:flutter/material.dart';


class SetPinCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.shield,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
      },
      title: Text(
        'Set local pin',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'When you set a pin, it will be required for each wallet action.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
