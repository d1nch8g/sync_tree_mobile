import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  State<ConnectedWallets> createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  List<MarketInfo> connectedMarkets = [];

  updateConnectedMarkets() async {
    var adresses = await Storage.loadConnectedWallets();
    adresses.forEach((adress) async {
      var info = await InfoCalls.marketInfo(base64.decode(adress));
      setState(() {
        this.connectedMarkets.add(info);
      });
    });
  }

  @override
  void initState() {
    updateConnectedMarkets();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    if (connectedMarkets.length == 0) {
      return Expanded(
        child: Center(
          child: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' FIND AND CONNECT ',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Icon(
                    Icons.manage_search_rounded,
                    size: 36,
                  ),
                ],
              ),
            ),
            onPressed: () { Storage.triggerStorageEvent(
                trigger: Trigger.moveToMarketPage,
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).focusColor,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).hoverColor,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }
}
