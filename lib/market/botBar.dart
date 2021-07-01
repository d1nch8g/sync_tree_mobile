import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';
import 'package:sync_tree_mobile/market/buy.dart';
import 'package:sync_tree_mobile/market/sell.dart';
import 'package:sync_tree_mobile/market/trades.dart';

class BottomStuff extends StatefulWidget {
  final Market market;
  BottomStuff(this.market);
  @override
  _BottomStuffState createState() => _BottomStuffState();
}

class _BottomStuffState extends State<BottomStuff> {
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(2.5),
                color: Theme.of(context).focusColor,
              ),
            ),
          ),
          TradesBox(this.widget.market),
          ListTile(
            leading: Image.network(this.widget.market.img),
            title: Text(
              this.widget.market.name,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  this.widget.market.description,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 10, 32, 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuyButton(),
                SellButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
