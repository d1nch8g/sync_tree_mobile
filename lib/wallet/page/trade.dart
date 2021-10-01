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
                'You can place buy and sell orders on this page. '
                'You need to set the offer and recieve amounts to '
                'place the order. If order is not operated instantly, '
                'you can cancel it any time you want. You can not place '
                'more then order lump sum.',
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
