import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/balance/wallets.dart';

class BalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.credit_card_rounded,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          Text(
            'wallets',
            style: Theme.of(context).textTheme.headline3,
          ),
          Divider(),
          ConnectedWallets(),
        ],
      ),
    );
  }
}
