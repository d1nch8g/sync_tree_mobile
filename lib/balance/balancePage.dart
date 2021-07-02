import 'package:flutter/material.dart';

class BalanceConnectPage extends StatelessWidget {
  final Function goBack;
  BalanceConnectPage(this.goBack);

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
