import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/wallet/walletPage.dart';

class ConnectedMarketList extends StatefulWidget {
  @override
  State<ConnectedMarketList> createState() => _ConnectedMarketListState();
}

class _ConnectedMarketListState extends State<ConnectedMarketList> {
  late List<MarketInfo> markets = [];

  void updateMarketsInfo() async {
    var marketAdresses = await Storage.loadConnectedWallets();
    marketAdresses.forEach((adress) async {
      var info = await InfoCalls.marketInfo(base64.decode(adress));
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
    return ListView.builder(
      itemCount: markets.length,
      itemBuilder: (context, index) {
        var info = markets[index];
        return WalletTile(info: info);
      },
    );
  }
}

class WalletTile extends StatefulWidget {
  MarketInfo info;
  WalletTile({required this.info});
  @override
  _WalletTileState createState() => _WalletTileState();
}

class _WalletTileState extends State<WalletTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 110),
              OpenContainer(
                closedColor: Theme.of(context).backgroundColor,
                openColor: Theme.of(context).backgroundColor,
                transitionDuration: Duration(milliseconds: 610),
                closedBuilder: (context, action) {
                  return Container(
                    height: 126,
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.info.name),
                        Text(widget.info.workTime),
                        Text(
                          'Fee - in: ${widget.info.inputFee.toString()}% '
                          'out: ${widget.info.outputFee.toString()}%',
                        ),
                        DynamicMarketBalance(adress: widget.info.adress),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
                openBuilder: (context, action) {
                  return ConnectedWalletPage(closeContainer: () {
                    action();
                  });
                },
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 610),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 63,
                  backgroundColor: Theme.of(context).focusColor,
                  child: Container(
                    child: Image.network(widget.info.imageLink),
                    height: 102,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicMarketBalance extends StatefulWidget {
  final String adress;
  DynamicMarketBalance({required this.adress});
  @override
  _DynamicMarketBalanceState createState() => _DynamicMarketBalanceState();
}

class _DynamicMarketBalanceState extends State<DynamicMarketBalance> {
  String balance = '';
  void setBalance() async {
    balance = (await Storage.loadMarketBalance(widget.adress)).toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Balance: $balance');
  }
}
