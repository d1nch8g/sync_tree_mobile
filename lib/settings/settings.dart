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
            size: 134,
            color: Theme.of(context).hoverColor,
          ),
          ListView(
            children: [
              
            ],
          ),
        ],
      ),
    );
  }
}
