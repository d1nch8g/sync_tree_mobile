import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/page/buy.dart';
import 'package:sync_tree_mobile_ui/market/page/info.dart';
import 'package:sync_tree_mobile_ui/market/page/sell.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketModalPage extends StatefulWidget {
  final MarketInfo info;
  MarketModalPage({required this.info});
  @override
  _MarketModalPageState createState() => _MarketModalPageState();
}

class _MarketModalPageState extends State<MarketModalPage> {
  late Widget buttons;
  double tradesHeight = 0;
  IconData icon = Icons.info_rounded;

  showHideTrades() {
    if (tradesHeight == 0) {
      tradesHeight = 320;
      icon = Icons.group_work_sharp;
      setState(() {});
    } else {
      tradesHeight = 0;
      icon = Icons.info_rounded;
      setState(() {});
    }
  }

  @override
  void initState() {
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
            SizedBox(height: 32),
            AnimatedContainer(
              curve: Curves.ease,
              duration: Duration(milliseconds: 377),
              height: tradesHeight,
              child: Container(),
            ),
            Expanded(
              child: MarketInfoWidget(info: widget.info),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuyButton(info: widget.info),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 377),
                  child: IconButton(
                    onPressed: () {
                      showHideTrades();
                    },
                    key: UniqueKey(),
                    iconSize: 52,
                    color: Color.fromRGBO(234, 246, 255, 1.0),
                    icon: Icon(icon),
                  ),
                ),
                SellButton(info: widget.info),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
