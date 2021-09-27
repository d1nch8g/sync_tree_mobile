import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class TradeBars extends StatefulWidget {
  final MarketInfo info;
  TradeBars({required this.info});
  @override
  State<TradeBars> createState() => _TradeBarsState();
}

class _TradeBarsState extends State<TradeBars> {
  @override
  void initState() {
    super.initState();
    print(widget.info.buys.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
