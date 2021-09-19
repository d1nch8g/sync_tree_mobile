import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class TradeBars extends StatefulWidget {
  final MarketInfo info;
  TradeBars({
    required this.info,
  });

  @override
  State<TradeBars> createState() => _TradeBarsState();
}

class _TradeBarsState extends State<TradeBars> {
  late MarketInfo info = widget.info;

  startUpdatingMarketInfo() async {
    info = await InfoCalls.marketInfo(base64.decode(widget.info.adress));
    if (mounted) {
      setState(() {});
    } else {
      return;
    }
    Future.delayed(Duration(milliseconds: 1597), () {
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
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 89),
      child: Container(
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
      width: MediaQuery.of(context).size.width * 0.35,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 3.2, 0, 3.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('o:$offer/ r:$recieve'),
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
