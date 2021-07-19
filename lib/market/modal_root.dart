import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/hasTrades.dart';

import 'package:sync_tree_mobile/api/infoMarket.dart';
import 'package:sync_tree_mobile/market/modal_buy.dart';
import 'package:sync_tree_mobile/market/modal_cancel.dart';
import 'package:sync_tree_mobile/market/modal_sell.dart';
import 'package:sync_tree_mobile/market/modal_chart.dart';
import 'package:sync_tree_mobile/navigator.dart';

class ModalMarketSheet extends StatefulWidget {
  final Market market;
  ModalMarketSheet(this.market);
  @override
  _ModalMarketSheetState createState() => _ModalMarketSheetState();
}

class _ModalMarketSheetState extends State<ModalMarketSheet> {
  late Widget currentButtons;
  String maxBuyOffer = '';
  String maxRecieveOffer = '';

  void updateMainBalance() async {
    var prefs = await SharedPreferences.getInstance();
    var mainBalance = prefs.getInt('balance') ?? 0;
    if (this.mounted) {
      setState(() {
        maxBuyOffer = mainBalance.toString();
      });
    }
  }

  void updateMarketBalance() async {
    var prefs = await SharedPreferences.getInstance();
    var marketBalance = prefs.getInt(
          base64.encode(this.widget.market.adress),
        ) ??
        0;
    if (this.mounted) {
      setState(() {
        maxRecieveOffer = marketBalance.toString();
      });
    }
  }

  void connect() async {
    var prefs = await SharedPreferences.getInstance();
    var wallets = prefs.getStringList('wallets') ?? [];
    var adr = base64.encode(this.widget.market.adress);
    wallets.add(adr);
    prefs.setStringList('wallets', wallets);
    setState(() {
      currentButtons = BuySellButtons(this.widget.market);
    });
  }

  void setButtons() async {
    var prefs = await SharedPreferences.getInstance();
    var wallets = prefs.getStringList('wallets') ?? [];
    var adr = base64.encode(this.widget.market.adress);
    setState(() {
      currentButtons = ConnectButton(() {
        connect();
      });
    });
    if (wallets.contains(adr)) {
      var hasSomeTrades = await hasTrades(this.widget.market.adress);
      if (hasSomeTrades) {
        setState(() {
          currentButtons = BuySellCancelButtons(this.widget.market);
        });
      } else {
        setState(() {
          currentButtons = BuySellButtons(this.widget.market);
        });
      }
    }
  }

  void startBalanceChecking() {
    mainStream.listen((event) {
      if (event == 'balanceEvent') {
        updateMainBalance();
      }
      if (event == base64.encode(this.widget.market.adress)) {
        updateMarketBalance();
      }
    });
  }

  @override
  void initState() {
    setButtons();
    updateMainBalance();
    updateMarketBalance();
    startBalanceChecking();
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
            subtitle: Text(
              'Max buy offer: $maxBuyOffer'
              '\nMax sell offer: $maxRecieveOffer',
              style: Theme.of(context).textTheme.overline,
            ),
            trailing: Text(
              this.widget.market.opCount.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          CustomDivider(),
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
          CustomDivider(),
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

class ConnectButton extends StatelessWidget {
  final Function connect;
  ConnectButton(this.connect);

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

class BuySellButtons extends StatelessWidget {
  final Market market;
  BuySellButtons(this.market);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuyButton(market),
        SellButton(market),
      ],
    );
  }
}

class BuySellCancelButtons extends StatelessWidget {
  final Market market;
  BuySellCancelButtons(this.market);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuyButton(market),
        SellButton(market),
        CancelTradesButton(market),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).focusColor,
      indent: 16,
      endIndent: 16,
    );
  }
}
