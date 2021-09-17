import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  State<ConnectedWallets> createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  Widget currentMarketWidget = Container();
  List<MarketInfo> markets = [];

  void checkIfHasConnections() async {
    var adresses = await Storage.loadConnectedWallets();

    setState(() {
      if (adresses.length == 0) {
        this.currentMarketWidget = FindAndConnectButton();
      } else {
        adresses.forEach((adress) async {
          var info = await InfoCalls.marketInfo(base64.decode(adress));
          this.markets.add(info);
        });
        this.currentMarketWidget = ConnectedMarketList(
          markets: this.markets,
        );
      }
    });
  }

  void updateConnectedMarkets() async {
    var adresses = await Storage.loadConnectedWallets();
  }

  @override
  void initState() {
    checkIfHasConnections();
    updateConnectedMarkets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 377),
        child: currentMarketWidget,
      ),
    );
  }
}

class FindAndConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
        onPressed: () {
          Storage.triggerStorageEvent(
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
    );
  }
}

class ConnectedMarketList extends StatelessWidget {
  final List<MarketInfo> markets;
  ConnectedMarketList({required this.markets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: markets.length,
      itemBuilder: (context, index) {
        var info = markets[index];
        return Padding(
          padding: EdgeInsets.all(8),
          child: Container(),
        );
      },
    );
  }
}
