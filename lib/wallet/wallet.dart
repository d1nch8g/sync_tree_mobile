import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/wallet/balance.dart';

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
          ListTile(
            leading: Icon(Icons.list_alt_rounded),
            title: Text('Get transaction history'),
            subtitle: Text(
              'You can get history of all your operations loaded directly from distributed network.',
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Get message history'),
            subtitle: Text(
              'Here you can get all messages occured that been.',
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
