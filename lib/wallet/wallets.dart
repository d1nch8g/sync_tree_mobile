import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/wallet/markets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ConnectedWallets extends StatefulWidget {
  @override
  State<ConnectedWallets> createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  late Widget currentMarketWidget;
  List<MarketInfo> markets = [];

  void checkIfHasConnections() async {
    var adresses = await Storage.loadConnectedWallets();
    setState(() {
      if (adresses.length == 0) {
        currentMarketWidget = FindAndConnectButton();
      } else {
        adresses.forEach((adress) async {
          var info = await InfoCalls.marketInfo(base64.decode(adress));
          this.markets.add(info);
        });
        currentMarketWidget = ConnectedMarketList(
          markets: this.markets,
        );
      }
    });
  }

  @override
  void initState() {
    currentMarketWidget = ConnectedMarketList(
      markets: markets,
    );
    checkIfHasConnections();
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
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: 'Here you can find markets and connect them',
              backgroundColor: Theme.of(context).hoverColor,
              textStyle: Theme.of(context).textTheme.headline2!,
            ),
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
