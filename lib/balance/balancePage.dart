import 'package:flutter/material.dart';

class BalancePage extends StatelessWidget {
  final Function goBack;
  BalancePage(this.goBack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor,
      body: Center(
        child: TextButton(
          onPressed: () {
            goBack();
          },
          child: Text('back'),
        ),
      ),
    );
  }
}
