import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: currentMarketWidget,
            ),
          ),
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
