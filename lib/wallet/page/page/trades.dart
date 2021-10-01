import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class TradeView extends StatefulWidget {
  final MarketInfo info;
  TradeView({required this.info});
  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TradeBars(
          name: 'BUYS',
          trades: widget.info.buys,
          offerDelimiter: 2,
          recieveDelimiter: widget.info.delimiter,
        ),
        VerticalDivider(
          color: Theme.of(context).focusColor,
        ),
        TradeBars(
          name: 'SELLS',
          trades: widget.info.sells,
          offerDelimiter: widget.info.delimiter,
          recieveDelimiter: 2,
        ),
      ],
    );
  }
}

class TradeBars extends StatelessWidget {
  final List<Trade> trades;
  final int offerDelimiter;
  final int recieveDelimiter;
  final String name;
  TradeBars({
    required this.trades,
    required this.offerDelimiter,
    required this.recieveDelimiter,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Flexible(child: Text(name)),
          Flexible(
            child: Divider(
              color: Theme.of(context).focusColor,
            ),
          ),
          Flexible(
            flex: 14,
            child: ListView.separated(
              padding: EdgeInsets.all(0),
              itemCount: trades.length,
              separatorBuilder: (context, _) {
                return Divider(color: Theme.of(context).focusColor);
              },
              itemBuilder: (context, index) {
                var trade = trades[index];
                var offer = Balance.tooString(
                  balance: trade.offer,
                  delimiter: offerDelimiter,
                );
                var recieve = Balance.tooString(
                  balance: trade.recieve,
                  delimiter: recieveDelimiter,
                );
                var ratio = 0.0;
                if (name == 'BUYS') {
                  ratio = trade.offer / trade.recieve;
                } else {
                  ratio = trade.recieve / trade.offer;
                }
                var strRatio = ratio.toString();
                try {
                  strRatio = strRatio.substring(0, 9);
                } catch (e) {}
                return Center(
                  child: Text(
                    'O: $offer\n'
                    'D: $recieve\n'
                    'R: $strRatio',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
