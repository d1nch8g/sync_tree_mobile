import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/trade/trades.dart';

class TradePage extends StatelessWidget {
  final MarketInfo info;
  TradePage({required this.info});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Expanded(
            child: TradeView(info: info),
          ),
        ),
        Divider(color: Theme.of(context).focusColor),
      ],
    );
  }
}
