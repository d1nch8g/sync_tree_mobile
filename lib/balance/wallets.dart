import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/balance/noWallets.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  _ConnectedWalletsState createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  late Widget buildwidget = Container();

  void setAllWallets() async {
    var prefs = await SharedPreferences.getInstance();
    var allConnectedWalletsBase64 = prefs.getStringList('wallets') ?? [];
    List<Uint8List> recievedWallets = [];
    for (var i = 0; i < allConnectedWalletsBase64.length; i++) {
      recievedWallets.add(base64.decode(allConnectedWalletsBase64[i]));
    }
    if (recievedWallets.isEmpty) {
      setState(() {
        buildwidget = NoWallets();
      });
    }
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
