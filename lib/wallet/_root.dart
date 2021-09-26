import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sync_tree_mobile_ui/navigator.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/wallet/walletTile.dart';
import '../src/src.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'send.dart';
import 'recieve.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          DynamicBalance(),
          Divider(),
          Text(
            'connected wallets',
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(),
          ConnectedWallets(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SendButton(),
              RecieveButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class ConnectedWallets extends StatefulWidget {
  @override
  State<ConnectedWallets> createState() => _ConnectedWalletsState();
}

class _ConnectedWalletsState extends State<ConnectedWallets> {
  late Widget currentMarketWidget;

  void checkIfHasNoConnections() async {
    var adresses = await Storage.loadConnectedWallets();
    if (adresses.length == 0) {
      currentMarketWidget = FindAndConnectButton();
      setState(() {});
    }
  }

  @override
  void initState() {
    currentMarketWidget = ConnectedMarketList();
    super.initState();
    checkIfHasNoConnections();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 377),
        child: currentMarketWidget,
      ),
    );
  }
}

class FindAndConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ' FIND AND CONNECT ',
                style: Theme.of(context).textTheme.headline2,
              ),
              Icon(
                Icons.manage_search_rounded,
                size: 36,
              ),
            ],
          ),
        ),
        onPressed: () {
          Storage.triggerStorageEvent(
            trigger: Trigger.moveToMarketPage,
          );
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: 'Find markets and connect them on this page.',
              backgroundColor: Theme.of(context).hoverColor,
              textStyle: Theme.of(context).textTheme.headline2!,
              icon: const Icon(
                Icons.list_alt_rounded,
                color: const Color(0x15000000),
                size: 120,
              ),
            ),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).focusColor,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).hoverColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}

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

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void updateBalance() async {
    var balance = await Balance.mainBalance();
    if (mounted) {
      setState(() {
        if (balance == '0') {
          this.balance = 'Balance - 0';
        } else {
          this.balance = balance;
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
