import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  _ConnectedWalletsState createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  late List<Uint8List> wallets;
  late Widget buildwidget;

  void setAllWallets() async {
    var prefs = await SharedPreferences.getInstance();
    var allConnectedWalletsBase64 = prefs.getStringList('wallets') ?? [];
    List<Uint8List> recievedWallets = [];
    for (var i = 0; i < allConnectedWalletsBase64.length; i++) {
      recievedWallets.add(base64.decode(allConnectedWalletsBase64[i]));
    }
    wallets = recievedWallets;
  }

  @override
  void initState() {
    setAllWallets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NoConnections());
  }
}

class NoConnections extends StatelessWidget {
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
