import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/market/buyOverlay.dart';
import 'package:sync_tree_modile_ui/market/infoContent.dart';
import 'package:sync_tree_modile_ui/market/sellOverlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MarketModalSheet extends StatefulWidget {
  final MarketInfo info;
  MarketModalSheet({required this.info});

  @override
  State<MarketModalSheet> createState() => _MarketModalSheetState();
}

class _MarketModalSheetState extends State<MarketModalSheet> {
  late Widget currentButtons;
  int marketBalance = 0;
  int mainBalance = 0;

  void loadBalances() async {
    marketBalance = await Storage.loadMarketBalance(this.widget.info.adress);
    mainBalance = await Storage.loadMainBalance();
    setState(() {});
  }

  void activateBuyOverlay() async {
    showDialog(
      context: context,
      builder: (_) => BuyOverlay(
        info: widget.info,
        mainBalance: mainBalance,
      ),
    );
  }

  void activateSellOverlay() async {
    showDialog(
      context: context,
      builder: (_) => SellOverlay(
        info: widget.info,
        marketBalance: marketBalance,
      ),
    );
  }

  void setBuySellButtons() {
    setState(() {
      currentButtons = BuySellButtons(
        buy: () {
          activateBuyOverlay();
        },
        sell: () {
          activateSellOverlay();
        },
        info: widget.info,
      );
    });
  }

  void connectWallet() async {
    var currentWallets = await Storage.loadConnectedWallets();
    currentWallets.add(this.widget.info.adress);
    Storage.saveConnectedWalletsAdressesList(currentWallets);
    setBuySellButtons();
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: 'Wallet connected',
        backgroundColor: Theme.of(context).hoverColor,
        textStyle: Theme.of(context).textTheme.headline2!,
      ),
    );
  }

  void checkIfWalletIsConnected() async {
    var currentWallets = await Storage.loadConnectedWallets();
    if (currentWallets.contains(this.widget.info.adress)) {
      setBuySellButtons();
    }
  }

  // TODO
  // void checkIfHaveActiveTrades() async {
  //   try {
  //     var hasTrades = await InfoCalls.selfActiveTradesByAdress(
  //       this.widget.info.adress,
  //     );
  //   } catch (e) {}
  // }

  loadNewBalance() async {
    var newBalance = await Storage.loadMarketBalance(widget.info.adress);
    if (mounted) {
      setState(() {
        mainBalance = newBalance;
      });
    }
  }

  @override
  void initState() {
    currentButtons = ConnectButton(connect: () {
      connectWallet();
    });
    checkIfWalletIsConnected();
    loadBalances();
    super.initState();
    Storage.createTriggerSubscription(
      trigger: Trigger.marketBalanceUpdate,
      onTriggerEvent: () {
        loadNewBalance();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 5,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
            ],
          ),
          // TODO here should be widget with bars
          // SizedBox(height: MediaQuery.of(context).size.height * 0.38),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
            child: Row(
              children: [
                SizedBox(width: 22),
                Container(
                  height: 26,
                  child: Image.network(this.widget.info.imageLink),
                ),
                SizedBox(width: 12),
                Text(
                  this.widget.info.name,
                  style: TextStyle(
                    color: Color.fromRGBO(234, 246, 255, 1.0),
                    fontSize: 26,
                    fontFamily: 'Hind',
                  ),
                ),
                Spacer(),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 377),
                  child: Text(
                    marketBalance.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(234, 246, 255, 1.0),
                      fontSize: 24,
                      fontFamily: 'Hind',
                    ),
                    key: UniqueKey(),
                  ),
                ),
                SizedBox(width: 22),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).focusColor,
            indent: 12,
            endIndent: 12,
          ),
          Expanded(
            child: InfoContent(
              info: widget.info,
              mainBalance: mainBalance,
              marketBalance: marketBalance,
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 144,
            ),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: currentButtons,
          ),
        ],
      ),
    );
  }
}

class ConnectButton extends StatelessWidget {
  final Function connect;
  ConnectButton({required this.connect});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 28),
      child: TextButton(
        onPressed: () {
          connect();
        },
        child: Text('connect'),
      ),
    );
  }
}

class BuySellButtons extends StatelessWidget {
  final Function buy;
  final Function sell;
  final MarketInfo info;
  BuySellButtons({
    required this.buy,
    required this.sell,
    required this.info,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              buy();
            },
            child: Text(' buy '),
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).focusColor,
            radius: 28,
            child: IconButton(
              icon: Icon(
                Icons.text_snippet_rounded,
                color: Theme.of(context).backgroundColor,
              ),
              iconSize: 42,
              onPressed: () {
                // TODO here should be function hiding trade bars content
              },
            ),
          ),
          TextButton(
            onPressed: () {
              sell();
            },
            child: Text('sell'),
          ),
        ],
      ),
    );
  }
}
