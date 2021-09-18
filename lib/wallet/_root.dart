import 'package:flutter/material.dart';
import 'package:sync_tree_modile_ui/wallet/wallets.dart';

import 'send.dart';
import 'recieve.dart';
import 'balance.dart';

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
              RecieveButton(),
            ],
          ),
          Divider(),
          Text(
            'connected wallets',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),
          ConnectedWallets(),
        ],
      ),
    );
  }
}
