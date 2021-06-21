import 'package:flutter/material.dart';

import 'send.dart';
import 'recieve.dart';

/// On this page all the user's connected wallets are gonna be displayed.
/// The second option is
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 129,
            color: Theme.of(context).hintColor,
          ),
          Text(
            'Your wallet',
            style: Theme.of(context).textTheme.headline3,
          ),
          Divider(),
          
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SendButton(),
              RecieveButton(),
            ],
          )
        ],
      ),
    );
  }
}
