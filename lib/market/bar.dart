import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';
import 'package:sync_tree_mobile/market/buy.dart';
import 'package:sync_tree_mobile/market/connect.dart';
import 'package:sync_tree_mobile/market/sell.dart';
import 'package:sync_tree_mobile/market/trades.dart';

class BottomBar extends StatefulWidget {
  final Market market;
  BottomBar(this.market);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Widget currentButtons = Connection();

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
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  this.widget.market.description,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 10, 32, 42),
            child: AnimatedSwitcher(
              child: currentButtons,
              duration: Duration(milliseconds: 144),
            ),
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConnectButton(),
      ],
    );
  }
}

class BuyAndSellButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuyButton(),
        SellButton(),
      ],
    );
  }
}
