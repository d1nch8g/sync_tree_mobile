import 'package:flutter/material.dart';

class SendChangesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.save_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Save changes to server',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Send all local changes to network. ',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
