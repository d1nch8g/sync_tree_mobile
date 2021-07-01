import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class TradesBox extends StatelessWidget {
  final Market market;
  TradesBox(this.market);

  @override
  Widget build(BuildContext context) {
    if (market.buys.isEmpty && market.sells.isEmpty) {
      return SizedBox(
        height: 320,
        child: Center(
          child: Text(
            'No active trades',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 320,
      );
    }
  }
}
