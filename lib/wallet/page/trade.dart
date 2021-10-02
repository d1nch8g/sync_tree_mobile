import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/buy.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';
import 'package:sync_tree_mobile_ui/wallet/page/sell.dart';
import 'package:sync_tree_mobile_ui/wallet/page/trades.dart';

class TradePage extends StatelessWidget {
  final MarketInfo info;
  final Function closeContainer;
  TradePage({
    required this.info,
    required this.closeContainer,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: TradeView(info: info),
        ),
        Divider(color: Theme.of(context).focusColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Text(
                '   You can place buy and sell orders on this page. '
                'You need to set the offer and recieve amounts to '
                'place the order. If order is not operated instantly, '
                'you can cancel it any time you want. You can not place '
                'more then order at the same time.',
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: BuyButton(info: info),
              ),
            ),
            FloatingButton(
              closeContainer: closeContainer,
            ),
            Expanded(
              child: Center(
                child: SellButton(info: info),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
