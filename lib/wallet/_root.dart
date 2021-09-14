import 'package:flutter/material.dart';

import 'send.dart';
import 'get.dart';
import 'balance.dart';

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
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          DynamicBalance(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SendButton(),
              GetButton(),
            ],
          ),
          Divider(),
          Text(
            'connected wallets',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
