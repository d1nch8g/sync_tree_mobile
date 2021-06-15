import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('User settings', style: Theme.of(context).textTheme.headline1,),
    
        ],
      ),
    );
  }
}
