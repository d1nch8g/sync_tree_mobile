import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_calls/infoUser.dart';
import '../_calls/infoMarket.dart';
import '../balance/box.dart';

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
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Market> markets = [];
  void loadAllMarkets() async {
    var prefs = await SharedPreferences.getInstance();
    var adresses = prefs.getStringList('wallets') ?? [];
    for (var i = 0; i < adresses.length; i++) {
      var market = await getMarketInformation(base64.decode(adresses[i]));
      markets.add(market);
      listKey.currentState?.insertItem(
        i,
        duration: Duration(milliseconds: 610),
      );
      await sleep();
    }
  }

  Future sleep() {
    return new Future.delayed(const Duration(milliseconds: 144), () => "1");
  }

  @override
  void initState() {
    super.initState();
    updateSelfInformation();
    loadAllMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: markets.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 3),
            end: const Offset(0, 0),
          ).animate(animation),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: BalanceBox(markets[index]),
          ),
        );
      },
    );
  }
}
