import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/page/buy.dart';
import 'package:sync_tree_mobile_ui/market/page/connect.dart';
import 'package:sync_tree_mobile_ui/market/page/info.dart';
import 'package:sync_tree_mobile_ui/market/page/sell.dart';
import 'package:sync_tree_mobile_ui/market/page/trades.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketModalPage extends StatefulWidget {
  final MarketInfo info;
  MarketModalPage({required this.info});
  @override
  _MarketModalPageState createState() => _MarketModalPageState();
}

class _MarketModalPageState extends State<MarketModalPage> {
  double tradesHeight = 320;
  IconData icon = Icons.info_rounded;
  late Widget sellWidget;

  showHideTrades() {
    if (tradesHeight == 0) {
      tradesHeight = 320;
      icon = Icons.info_rounded;
      sellWidget = SellButton(info: this.widget.info);
      setState(() {});
    } else {
      tradesHeight = 0;
      icon = Icons.album_rounded;
      sellWidget = ConnectButton(marketAdress: widget.info.adress);
      setState(() {});
    }
  }

  @override
  void initState() {
    sellWidget = SellButton(info: this.widget.info);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 12),
            AnimatedContainer(
              curve: Curves.ease,
              duration: Duration(milliseconds: 377),
              height: tradesHeight,
              child: TradeBars(info: widget.info),
            ),
            Expanded(
              child: MarketInfoWidget(info: widget.info),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 144),
                    child: BuyButton(info: widget.info),
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 377),
                  child: IconButton(
                    onPressed: () {
                      showHideTrades();
                    },
                    key: UniqueKey(),
                    iconSize: 52,
                    color: Theme.of(context).focusColor,
                    icon: Icon(icon),
                  ),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) =>
                      ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 377),
                    child: sellWidget,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
