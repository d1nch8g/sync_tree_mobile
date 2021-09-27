import 'package:flutter/material.dart';

class WalletOperations extends StatelessWidget {
  final Function closeWallet;
  WalletOperations({required this.closeWallet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('deposit'),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).focusColor,
          radius: 26,
          child: IconButton(
            onPressed: () {
              closeWallet();
            },
            iconSize: 36,
            color: Theme.of(context).backgroundColor,
            splashRadius: 56,
            icon: Icon(Icons.account_balance_wallet_rounded),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('withdrawal'),
        ),
      ],
    );
  }
}
