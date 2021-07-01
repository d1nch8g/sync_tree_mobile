import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.credit_card_rounded,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          Text(
            'wallets',
            style: Theme.of(context).textTheme.headline3,
          ),
          Divider(),
          ConnectedWallets(),
        ],
      ),
    );
  }
}

class ConnectedWallets extends StatelessWidget {
  Future<List<Uint8List>> getAllWallets() async {
    var prefs = await SharedPreferences.getInstance();
    var allConnectedWalletsBase64 = prefs.getStringList('wallets') ?? [];
    List<Uint8List> allWallets = [];
    for (var i = 0; i < allConnectedWalletsBase64.length; i++) {
      allWallets.add(base64.decode(allConnectedWalletsBase64[i]));
    }
    return allWallets;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
