import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sync_tree_mobile/wallet/balance.dart';
import 'package:sync_tree_mobile/wallet/local.dart';

import 'send.dart';
import 'get.dart';

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
            'Wallets around',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),
          LocalWallets(),
        ],
      ),
    );
  }
}
