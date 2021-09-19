import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class TradeBars extends StatefulWidget {
  final String adress;
  TradeBars({required this.adress});

  @override
  State<TradeBars> createState() => _TradeBarsState();
}

class _TradeBarsState extends State<TradeBars> {
  late MarketInfo info;

  startUpdatingMarketInfo() async {
    info = await InfoCalls.marketInfo(base64.decode(widget.adress));
    setState(() {});
    Future.delayed(Duration(seconds: 1), () {
      startUpdatingMarketInfo();
    });
  }

  @override
  void initState() {
    startUpdatingMarketInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TradeView(
            name: 'BUYS',
            trades: info.getAllBuys(),
          ),
          VerticalDivider(
            color: Theme.of(context).focusColor,
          ),
          TradeView(
            name: 'SELLS',
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
  late List<Widget> tradeList = [];
  TradeView({
    required this.trades,
    required this.name,
  }) {
    tradeList.add(Text(name));
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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tradeList,
      ),
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 3.2, 12, 3.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('o:$offer/r:$recieve'),
            Text('ratio: $amount     '.substring(0, 12)),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).focusColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
