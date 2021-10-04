import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/tile.dart';

class WalletsList extends StatefulWidget {
  const WalletsList({Key? key}) : super(key: key);
  @override
  State<WalletsList> createState() => _WalletsListState();
}

class _WalletsListState extends State<WalletsList> {
  late List<MarketInfo> markets = [];

  void loadCachedMarketInfo() async {
    var marketAdresses = await Storage.loadConnectedWallets();
    for (var i = 0; i < marketAdresses.length; i++) {
      markets.add(
        await Storage.loadMarketInfoCache(marketAdresses[i]),
      );
    }
    setState(() {});
  }

  void updateMarketInfo() async {
    var marketAdresses = await Storage.loadConnectedWallets();
    for (var i = 0; i < marketAdresses.length; i++) {
      markets[i] = await InfoCalls.marketInfo(marketAdresses[i]);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadCachedMarketInfo();
    updateMarketInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        key: UniqueKey(),
        itemCount: markets.length,
        itemBuilder: (context, index) {
          var info = markets[index];
          return WalletTile(info: info);
        },
      ),
    );
  }
}
