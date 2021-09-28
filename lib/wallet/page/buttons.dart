import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/wallet/page/deposit.dart';

class WalletOperations extends StatelessWidget {
  final Function closeWallet;
  WalletOperations({required this.closeWallet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Center(
            child: DepositButton(),
          ),
        ),
        IconButton(
          onPressed: () {
            closeWallet();
          },
          iconSize: 52,
          color: Theme.of(context).focusColor,
          splashRadius: 38,
          icon: Icon(Icons.arrow_drop_down_circle_rounded),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {},
              child: Text('withdrawal'),
            ),
          ),
        ),
      ],
    );
  }
}
