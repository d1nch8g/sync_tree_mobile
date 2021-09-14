//TODO implemet user update info and preload keyboard

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/connection.dart';

class LoadingScreen extends StatelessWidget {
  void updateSelfInformation(context) async {
    var notFirstLaunch = !await Storage.checkIfFirstLaunch();
    if (notFirstLaunch) {
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
      } catch (e) {
        print('YOYOYO');
        showDialog(
          context: context,
          builder: (_) => ConnectionErrorOverlay(),
        );
      }
    }
  }

  void unfoucusWithDelay(context) {
    Future.delayed(Duration(milliseconds: 1), () {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    unfoucusWithDelay(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('yo'),
            SpinKitSpinningLines(
              color: Theme.of(context).focusColor,
              size: MediaQuery.of(context).size.width * 0.72,
            ),
            TextField(
              autofocus: true,
            ),
          ],
        ),
      ),
    );
  }
}
