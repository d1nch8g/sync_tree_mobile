import 'package:flutter/material.dart';

class BalanceConnectPage extends StatelessWidget {
  final Function goBack;
  BalanceConnectPage(this.goBack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor,
      body: SafeArea(
        child: Column(
          children: [
            // chat window
            // textfield
            // image and name of market
            // centered current balance
            // withdrawal button // fee info
            // deposit button // fee info
            // button for deposit request
            // button for withdrawal request
            // button for
            Expanded(
              child: Container(),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  goBack();
                },
                child: Text('close wallet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
