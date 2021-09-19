import 'package:flutter/material.dart';

class ConnectedWalletPage extends StatelessWidget {
  Function closeContainer;
  ConnectedWalletPage({required this.closeContainer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: TextButton(
          child: Text('close'),
          onPressed: () {
            closeContainer();
          },
        ),
      ),
    );
  }
}
