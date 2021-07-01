import 'package:flutter/material.dart';

class NoWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No connected wallets\n'
          'Find some on the market page',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Icon(
            Icons.credit_card_off_rounded,
            size: MediaQuery.of(context).size.width * 0.62,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}
