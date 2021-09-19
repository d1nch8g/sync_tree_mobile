import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class TradeBars extends StatelessWidget {
  final MarketInfo info;
  TradeBars({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TradeView(
            name: 'SELLS',
            trades: info.getAllBuys(),
          ),
          VerticalDivider(
            color: Theme.of(context).focusColor,
          ),
          TradeView(
            name: 'BUYS',
            trades: info.getAllSells(),
          ),
        ],
      ),
    );
  }
}

class TradeView extends StatelessWidget {
  final List<SingleTrade> trades;
  final String name;
  late List<SingleTradeView> tradeList = [];
  TradeView({
    required this.trades,
    required this.name,
  }) {
    trades.forEach((trade) {
      tradeList.add(SingleTradeView(
        offer: trade.offer,
        recieve: trade.recieve,
        amount: trade.recieve / trade.offer,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        // Column(
        //   children: tradeList,
        // ),
      ],
    );
  }
}

class SingleTradeView extends StatelessWidget {
  final int offer;
  final int recieve;
  final double amount;
  SingleTradeView({
    required this.offer,
    required this.recieve,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$offer/$recieve'),
          Text('$amount'),
        ],
      ),
    );
  }
}
