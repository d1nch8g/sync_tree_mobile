import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/tile.dart';

class ConnectedMarketList extends StatefulWidget {
  @override
  State<ConnectedMarketList> createState() => _ConnectedMarketListState();
}

class _ConnectedMarketListState extends State<ConnectedMarketList> {
  late List<MarketInfo> markets = [];

  void updateMarketsInfo() async {
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
    return AnimationLimiter(
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: markets.length,
        itemBuilder: (context, index) {
          var info = markets[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              verticalOffset: 100.0,
              child: FlipAnimation(
                child: WalletTile(info: info),
              ),
            ),
          );
        },
      ),
    );
  }
}
