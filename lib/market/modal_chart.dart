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
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: Center(
        child: Text('No active trades'),
      ),
    );
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
        mainAxisSize: MainAxisSize.min,
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
  final List<Trade> sellsList;
  Sells(this.sellsList);

  late List<ChartBar> bars;

  void buildBars() {
    var barsCount = 5;
    var maxOffer = 0;
    var ratios = [];
    var percentageHeight = [];
    if (sellsList.length < 5) {
      barsCount = sellsList.length;
    }
    for (var i = 0; i < barsCount; i++) {
      ratios.add(sellsList[i].offer / sellsList[i].recieve);
      if (sellsList[i].offer > maxOffer) {
        maxOffer = sellsList[i].offer;
      }
    }
    for (var i = 0; i < barsCount; i++) {
      percentageHeight.add(sellsList[i].offer / barsCount);
    }
    for (var i = 0; i < barsCount; i++) {
      bars.add(
        ChartBar(
          Colors.yellow,
          percentageHeight[i],
          ratios[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: bars,
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final Color color;
  final double percentageHeight;
  final double ratio;
  ChartBar(
    this.color,
    this.percentageHeight,
    this.ratio,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.10,
      height: MediaQuery.of(context).size.height * 0.32 * percentageHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
