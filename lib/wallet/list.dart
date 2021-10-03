import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/tile.dart';

class WalletsList extends StatefulWidget {
  @override
  State<WalletsList> createState() => _WalletsListState();
}

class _WalletsListState extends State<WalletsList> {
  late List<MarketInfo> markets = [];

  void updateMarketsInfo() async {
    // TODO remake that stuff
    var marketAdresses = await Storage.loadConnectedWallets();
    marketAdresses.forEach((adress) async {
      var info = await InfoCalls.marketInfo(adress);
      markets.add(info);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    updateMarketsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: markets.length,
        key: UniqueKey(),
        itemBuilder: (context, index) {
          var info = markets[index];
          return WalletTile(info: info);
        },
      ),
    );
  }
}
