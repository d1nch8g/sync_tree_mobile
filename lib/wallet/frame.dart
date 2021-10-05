import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/src/net/user_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/list.dart';
import 'package:sync_tree_mobile_ui/wallet/logo.dart';
import 'package:sync_tree_mobile_ui/wallet/norez.dart';
import 'package:sync_tree_mobile_ui/wallet/recieve.dart';
import 'package:sync_tree_mobile_ui/wallet/send.dart';

class WalletPage extends StatefulWidget {
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late Widget currentMarketWidget;

  void checkIfHasNoConnections() async {
    var adresses = await Storage.loadConnectedWallets();
    if (adresses.length == 0) {
      currentMarketWidget = NoConnectedWallets();
      setState(() {});
    }
  }

  void startUpdatingMarketBalances() async {
    Timer.periodic(Duration(milliseconds: 987), (timer) {
      var selfInfo = InfoCalls.selfInfo();
    });
  }

  @override
  void initState() {
    currentMarketWidget = WalletsList();
    super.initState();
    checkIfHasNoConnections();
    Storage.createTriggerSubscription(
      trigger: Trigger.walletDetached,
      onTriggerEvent: () {
        print('triggered');
        if (mounted) {
          checkIfHasNoConnections();
          currentMarketWidget = WalletsList(
            key: UniqueKey(),
          );
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          WalletLogo(),
          Divider(color: Theme.of(context).primaryColorDark),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 987),
              child: currentMarketWidget,
            ),
          ),
          Divider(color: Theme.of(context).primaryColorDark),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SendButton(),
              RecieveButton(),
            ],
          ),
        ],
      ),
    );
  }
}
