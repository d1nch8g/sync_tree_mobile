import 'package:flutter/material.dart';

class SettingsLogo extends StatelessWidget {
  final String pubName;
  final String balance;
  SettingsLogo({
    required this.pubName,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings_applications,
          size: MediaQuery.of(context).size.height * 0.125,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline4,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Public name: $pubName',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Main balance: $balance',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Security: true',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
