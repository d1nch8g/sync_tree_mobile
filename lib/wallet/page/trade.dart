import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/buy.dart';
import 'package:sync_tree_mobile_ui/wallet/page/cancel.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';
import 'package:sync_tree_mobile_ui/wallet/page/sell.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';

class TradePage extends StatefulWidget {
  final MarketInfo info;
  final Function closeContainer;
  TradePage({
    required this.info,
    required this.closeContainer,
  });

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  late MarketInfo info;
  late Widget buttons = Container();
  late StreamSubscription<Trigger> subscription;

  initButtons() async {
    var hasTrades = await InfoCalls.hasTrades(widget.info.adress);
    if (hasTrades) {
      buttons = CancelTradeCloseButtons(
        info: info,
        closeContainer: widget.closeContainer,
      );
    } else {
      buttons = buttons = BuySellButtons(
        info: info,
        closeContainer: widget.closeContainer,
      );
    }
    setState(() {});
  }

  updateTrades() async {
    var newInfo = await InfoCalls.marketInfo(widget.info.adress);
    if (newInfo.differsFrom(info)) {
      info = newInfo;
      setState(() {});
    }
  }

  startUpdating() {
    updateTrades();
    Timer.periodic(Duration(milliseconds: 987), (Timer t) {
      if (mounted) {
        print('trade info updating');
        updateTrades();
      } else {
        t.cancel();
      }
    });
  }

  @override
  void initState() {
    info = widget.info;
    initButtons();
    super.initState();
    startUpdating();
    subscription = mainStream.listen((event) {
      if (mounted) {
        
      } else {
        subscription.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: TradeView(
            info: info,
          ),
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
                style: Theme.of(context).textTheme.bodyText1,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Divider(color: Theme.of(context).focusColor),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 144),
          child: buttons,
        ),
      ],
    );
  }
}

class BuySellButtons extends StatelessWidget {
  const BuySellButtons({
    Key? key,
    required this.info,
    required this.closeContainer,
  }) : super(key: key);

  final MarketInfo info;
  final Function closeContainer;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class CancelTradeCloseButtons extends StatelessWidget {
  const CancelTradeCloseButtons({
    Key? key,
    required this.info,
    required this.closeContainer,
  }) : super(key: key);

  final MarketInfo info;
  final Function closeContainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Center(
            child: CancelButton(adress: info.adress),
          ),
        ),
        Expanded(
          child: Center(
            child: FloatingButton(
              closeContainer: closeContainer,
            ),
          ),
        ),
      ],
    );
  }
}

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
          name: 'BUYS ${widget.info.activeBuys}',
          trades: widget.info.buys,
          offerDelimiter: 2,
          recieveDelimiter: widget.info.delimiter,
        ),
        VerticalDivider(
          color: Theme.of(context).focusColor,
        ),
        TradeBars(
          name: 'SELLS ${widget.info.activeSells}',
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
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Divider(
            color: Theme.of(context).focusColor,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 144),
              child: ListView.separated(
                key: UniqueKey(),
                padding: EdgeInsets.all(0),
                itemCount: trades.length,
                separatorBuilder: (context, _) {
                  return Divider(color: Theme.of(context).focusColor);
                },
                itemBuilder: (context, index) {
                  var trade = trades[index];
                  var offer = Balance.fromInt(
                    balance: trade.offer,
                    delimiter: offerDelimiter,
                  );
                  var recieve = Balance.fromInt(
                    balance: trade.recieve,
                    delimiter: recieveDelimiter,
                  );
                  var strRatio = (trade.offer / trade.recieve).toString();
                  try {
                    strRatio = strRatio.substring(0, 9);
                  } catch (e) {}
                  return Center(
                    child: Text(
                      'O: $offer\n'
                      'D: $recieve\n'
                      'R: $strRatio',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
