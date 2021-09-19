import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class TradeBars extends StatelessWidget {
  final MarketInfo info;
  TradeBars({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Divider(color: Theme.of(context).focusColor),
          Divider(color: Theme.of(context).focusColor),
          Divider(color: Theme.of(context).focusColor),
          Divider(color: Theme.of(context).focusColor),
        ],
      ),
    );
  }
}
