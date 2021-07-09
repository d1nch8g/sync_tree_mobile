import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/infoMarket.dart';

class TradesBox extends StatelessWidget {
  final Market market;
  TradesBox(this.market);

  @override
  Widget build(BuildContext context) {
    if (market.buys.isEmpty && market.sells.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        child: Center(
          child: Text(
            'No active trades',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
    } else {
      return ChartModule(market);
    }
  }
}

class ChartModule extends StatelessWidget {
  final Market market;
  ChartModule(this.market);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: Row(
        children: [
          Buys(market.buys),
          Sells(market.sells),
        ],
      ),
    );
  }
}

class Buys extends StatelessWidget {
  List<Trade> buysList;
  Buys(this.buysList);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,

    );
  }
}

class Sells extends StatelessWidget {
  List<Trade> sellsList;
  Sells(this.sellsList);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}

