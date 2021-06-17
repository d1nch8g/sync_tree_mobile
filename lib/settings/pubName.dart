import 'package:flutter/material.dart';

class PublicNameTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
