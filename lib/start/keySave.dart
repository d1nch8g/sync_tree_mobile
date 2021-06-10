import 'package:flutter/material.dart';

class KeySave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: TextButton(
          child: Text('continue'),
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
        ),
      ),
    );
  }
}
