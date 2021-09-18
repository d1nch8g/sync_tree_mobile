import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/market/buyOverlay.dart';
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
  late Widget tradeBarsWidget;

  bool tradeBarsAreOpen = true;

  int marketBalance = 0;
  int mainBalance = 0;

  void loadBalancesFromStorage() async {
    marketBalance = await Storage.loadMarketBalance(this.widget.info.adress);
    mainBalance = await Storage.loadMainBalance();
    setState(() {});
  }

  checkIfWalletIsNotConnected() async {
    var currentWallets = await Storage.loadConnectedWallets();
    if (!currentWallets.contains(this.widget.info.adress)) {
      currentButtons = ConnectButton(connect: () async {
        var currentWallets = await Storage.loadConnectedWallets();
        currentWallets.add(this.widget.info.adress);
        Storage.saveConnectedWalletsAdressesList(currentWallets);
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Wallet connected',
            backgroundColor: Theme.of(context).hoverColor,
            textStyle: Theme.of(context).textTheme.headline2!,
          ),
        );
      });
      tradeBarsWidget = Container();
      setState(() {});
    }
  }

  void closeOpenTradeBars() async {
    if (tradeBarsAreOpen) {
      tradeBarsAreOpen = false;
      tradeBarsWidget = Container();
    } else {
      tradeBarsAreOpen = true;
      tradeBarsWidget = TradeBars();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentButtons = BuySellButtons(
      buy: () {
        showDialog(
          context: context,
          builder: (_) => BuyOverlay(
            info: widget.info,
            mainBalance: mainBalance,
          ),
        );
      },
      sell: () {
        showDialog(
          context: context,
          builder: (_) => SellOverlay(
            info: widget.info,
            marketBalance: marketBalance,
          ),
        );
      },
      info: widget.info,
      unfoldTradeBar: () {
        closeOpenTradeBars();
      },
    );
    tradeBarsWidget = TradeBars();
    loadBalancesFromStorage();
    Storage.createTriggerSubscription(
      trigger: Trigger.marketBalanceUpdate,
      onTriggerEvent: () {
        loadBalancesFromStorage();
      },
    );
    checkIfWalletIsNotConnected();
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 377),
          child: Column(
            key: UniqueKey(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallVerticalBar(),
              tradeBarsWidget,
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
              Text(
                'Operation count: ${widget.info.operationCount.toString()}\n'
                'Active buys: ${widget.info.getAllBuys().length.toString()}\n'
                'Active sells: ${widget.info.getAllSells().length.toString()}\n'
                'Max buy: ${mainBalance.toString()}\n'
                'Max sell: ${marketBalance.toString()}\n'
                'Input fee: ${widget.info.inputFee.toString()}%\n'
                'Output fee: ${widget.info.outputFee.toString()}%\n'
                'Working time: ${widget.info.workTime}\n',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Divider(
                color: Theme.of(context).focusColor,
              ),
              Expanded(
                child: Text(
                  widget.info.description,
                  style: Theme.of(context).textTheme.subtitle2,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(
                  milliseconds: 144,
                ),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: currentButtons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectButton extends StatelessWidget {
  final Function connect;
  ConnectButton({required this.connect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 28),
          child: TextButton(
            onPressed: () {
              connect();
            },
            child: Text('connect'),
          ),
        ),
      ],
    );
  }
}

class BuySellButtons extends StatefulWidget {
  final Function buy;
  final Function sell;
  final MarketInfo info;
  final Function unfoldTradeBar;
  BuySellButtons({
    required this.buy,
    required this.sell,
    required this.info,
    required this.unfoldTradeBar,
  });
  @override
  State<BuySellButtons> createState() => _BuySellButtonsState();
}

class _BuySellButtonsState extends State<BuySellButtons> {
  @override
  IconData icon = Icons.text_snippet_rounded;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              widget.buy();
            },
            child: Text(' buy '),
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).focusColor,
            radius: 28,
            child: IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).backgroundColor,
              ),
              iconSize: 42,
              onPressed: () {
                widget.unfoldTradeBar();
                if (icon == Icons.text_snippet_rounded) {
                  icon = Icons.text_snippet_outlined;
                } else {
                  icon = Icons.text_snippet_rounded;
                }
                setState(() {});
              },
            ),
          ),
          TextButton(
            onPressed: () {
              widget.sell();
            },
            child: Text('sell'),
          ),
        ],
      ),
    );
  }
}

class SmallVerticalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class TradeBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
    );
  }
}
