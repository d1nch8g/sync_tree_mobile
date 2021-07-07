import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/infoUser.dart';
import 'package:sync_tree_mobile/api/infoMarket.dart';
import 'package:sync_tree_mobile/balance/box.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  _ConnectedWalletsState createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  late Widget buildwidget = NoWallets();

  void setAllWallets() async {
    var prefs = await SharedPreferences.getInstance();
    var allConnectedWalletsBase64 = prefs.getStringList('wallets') ?? [];
    List<Uint8List> recievedWallets = [];
    for (var i = 0; i < allConnectedWalletsBase64.length; i++) {
      recievedWallets.add(base64.decode(allConnectedWalletsBase64[i]));
    }
    setState(() {
      if (recievedWallets.length > 0) {
        buildwidget = Wallets();
      }
    });
  }

  @override
  void initState() {
    setAllWallets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: buildwidget,
    );
  }
}

class NoWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No connected wallets\n'
          'Find some on the market page',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Icon(
            Icons.credit_card_off_rounded,
            size: MediaQuery.of(context).size.width * 0.62,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}

class Wallets extends StatefulWidget {
  @override
  _WalletsState createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  List<Market> markets = [];


  void load_new_balances() async {
    var markets = await getSelfMarketBalances();
    
  }

  void load_balances_from_memory() async {
    
  }

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(itemExtent: 80, children: []);
  }
}
