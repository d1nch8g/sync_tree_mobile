import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/page/buy.dart';
import 'package:sync_tree_mobile_ui/market/page/sell.dart';
import 'package:sync_tree_mobile_ui/market/page/trades.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
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
    if (mounted) {
      setState(() {});
    }
  }

  void checkIfWalletIsNotConnected() async {
    var currentWallets = await Storage.loadConnectedWallets();
    if (!currentWallets.contains(this.widget.info.adress)) {
      currentButtons = ConnectButton(connect: () async {
        setConnectedOverlay();
        setState(() {});
        var currentWallets = await Storage.loadConnectedWallets();
        currentWallets.add(this.widget.info.adress);
        Storage.saveConnectedWalletsAdressesList(currentWallets);
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Wallet connected!',
            backgroundColor: Theme.of(context).hoverColor,
            textStyle: Theme.of(context).textTheme.headline2!,
            icon: const Icon(
              Icons.fact_check_outlined,
              color: const Color(0x15000000),
              size: 120,
            ),
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
      tradeBarsWidget = TradeBars(
        info: widget.info,
      );
    }
    setState(() {});
  }

  void setConnectedOverlay() {
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
    tradeBarsWidget = TradeBars(
      info: widget.info,
    );
  }

  @override
  void initState() {
    super.initState();
    setConnectedOverlay();
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
        padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
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
                    Container(
                      child: CachedNetworkImage(
                        imageUrl: this.widget.info.imageLink,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 29,
                      ),
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
                'Active buys: ${widget.info.activeBuys.toString()}\n'
                'Active sells: ${widget.info.activeSells.toString()}\n'
                'Max buy: ${mainBalance.toString()}\n'
                'Max sell: ${marketBalance.toString()}\n'
                'Input fee: ${widget.info.inputFee.toString()}%\n'
                'Output fee: ${widget.info.outputFee.toString()}%\n'
                'Working time: ${widget.info.workTime}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Divider(
                color: Theme.of(context).focusColor,
                indent: 12,
                endIndent: 12,
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

class BuySellButtons extends StatelessWidget {
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
                unfoldTradeBar();
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
