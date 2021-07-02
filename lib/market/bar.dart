import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';
import 'package:sync_tree_mobile/market/buy.dart';
import 'package:sync_tree_mobile/market/sell.dart';
import 'package:sync_tree_mobile/market/trades.dart';

class BottomBar extends StatefulWidget {
  final Market market;
  BottomBar(this.market);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late Widget currentButtons;

  void connect() async {
    var prefs = await SharedPreferences.getInstance();
    var wallets = prefs.getStringList('wallets') ?? [];
    var adr = base64.encode(this.widget.market.adress);
    wallets.add(adr);
    prefs.setStringList('wallets', wallets);
    setState(() {
      currentButtons = BuyAndSellButtons();
    });
  }

  void checkIfConnected() async {
    var prefs = await SharedPreferences.getInstance();
    var wallets = prefs.getStringList('wallets') ?? [];
    var adr = base64.encode(this.widget.market.adress);
    if (wallets.contains(adr)) {
      setState(() {
        currentButtons = BuyAndSellButtons();
      });
    } else {
      setState(() {
        currentButtons = Connection(() {
          connect();
        });
      });
    }
  }

  @override
  void initState() {
    checkIfConnected();
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
          ElemDivider(),
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
          ElemDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 10, 32, 42),
            child: AnimatedSwitcher(
              child: currentButtons,
              duration: Duration(milliseconds: 377),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) =>
                  ScaleTransition(
                scale: animation,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  final Function connect;
  Connection(this.connect);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            connect();
          },
          child: Text('connect'),
        ),
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

class ElemDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).focusColor,
      indent: 16,
      endIndent: 16,
    );
  }
}
