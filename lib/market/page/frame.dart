import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/page/trades.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketModalPage extends StatefulWidget {
  final MarketInfo info;
  MarketModalPage({required this.info});
  @override
  _MarketModalPageState createState() => _MarketModalPageState();
}

class _MarketModalPageState extends State<MarketModalPage> {
  Widget buttons = Center();
  double tradesHeight = 0;

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
      child: Column(
        children: [
          SizedBox(height: 32),
          AnimatedContainer(
            duration: Duration(milliseconds: 610),
            height: tradesHeight,
            child: TradeBars(info: widget.info),
          ),
          Expanded(
            child: Column(
              children: [
                Text('coca cola'),
              ],
            ),
          ),
          SafeArea(
            child: TextButton(
              onPressed: () {
                if (tradesHeight == 0) {
                  tradesHeight = 320;
                  setState(() {});
                } else {
                  tradesHeight = 0;
                  setState(() {});
                }
              },
              child: Text('fold'),
            ),
          ),
        ],
      ),
    );
  }
}
