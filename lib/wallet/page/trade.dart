import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/trade/trades.dart';

class TradePage extends StatelessWidget {
  final MarketInfo info;
  TradePage({required this.info});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Expanded(
            child: TradeView(info: info),
          ),
        ),
        Divider(color: Theme.of(context).focusColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(
                'You can place buy and sell orders on this page.'
                '',
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
