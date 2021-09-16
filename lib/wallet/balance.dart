import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void updateSelfInformation() async {
    var firstLaunch = await Storage.checkIfFirstLaunch();
    if (!firstLaunch) {
      var keys = await Storage.loadKeys();
      try {
        var selfInfo = await InfoCalls.userInfo(
          keys.personal.public.getAdressBase64(),
        );
        Storage.saveMainBalance(selfInfo.balance);
        Storage.savePublicName(selfInfo.name);
        selfInfo.marketBalances.forEach((marketBalance) {
          Storage.saveMarketBalanceByAdress(
            base64.encode(marketBalance.adress),
            marketBalance.balance,
          );
        });
      } catch (e) {}
    }
  }

  void updateBalance() async {
    var memoryBalance = await Storage.loadMainBalance();
    if (mounted) {
      setState(() {
        if (memoryBalance == 0) {
          this.balance = 'Balance - 0';
        } else {
          this.balance = memoryBalance.toString();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateSelfInformation();
    updateBalance();
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: () {
        updateBalance();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: Text(
        balance,
        style: Theme.of(context).textTheme.headline3,
        key: UniqueKey(),
      ),
      duration: Duration(milliseconds: 377),
    );
  }
}
