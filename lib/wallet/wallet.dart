import 'package:flutter/material.dart';

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
          Divider(),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
