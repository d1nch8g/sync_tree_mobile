import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/market/buyOverlay.dart';
import 'package:sync_tree_modile_ui/market/infoOverlay.dart';

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

  void activateSellOverlay() {}

  void setBuySellButtons() {
    setState(() {
      currentButtons = BuySellButtons(
        buy: () {
          activateBuyOverlay();
        },
        sell: () {
          activateSellOverlay();
        },
      );
    });
  }

  void connectWallet() async {
    var currentWallets = await Storage.loadConnectedWallets();
    currentWallets.add(this.widget.info.adress);
    Storage.saveConnectedWalletsAdressesList(currentWallets);
    setBuySellButtons();
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
    setState(() {
      mainBalance = newBalance;
    });
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.38),
          Row(
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
                ),
              ),
              SizedBox(width: 22),
            ],
          ),
          Divider(
            color: Theme.of(context).focusColor,
            indent: 12,
            endIndent: 12,
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    this.widget.info.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 4),
                    child: IconButton(
                      icon: Icon(
                        Icons.text_snippet_rounded,
                        color: Theme.of(context).focusColor,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => MarketInfoOverlay(
                            info: this.widget.info,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 377,
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
  BuySellButtons({
    required this.buy,
    required this.sell,
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
