import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class MarketModalSheet extends StatefulWidget {
  final MarketInfo info;
  MarketModalSheet({required this.info});

  @override
  State<MarketModalSheet> createState() => _MarketModalSheetState();
}

class _MarketModalSheetState extends State<MarketModalSheet> {
  late Widget currentButtons;

  void activateBuyOverlay() {}

  void activateSellOverlay() {}

  void connectWallet() async {
    var currentWallets = await Storage.loadConnectedWallets();
    currentWallets.add(this.widget.info.adress);
    Storage.saveConnectedWalletsAdressesList(currentWallets);
    setState(() {
      currentButtons = BuySellButtons(
        buy: () {},
        sell: () {},
      );
    });
  }

  void checkIfWalletIsConnected() async {
    var currentWallets = await Storage.loadConnectedWallets();
    if (currentWallets.contains(this.widget.info.adress)) {
      setState(() {
        currentButtons = BuySellButtons(
          buy: () {},
          sell: () {},
        );
      });
    }
  }

  @override
  void initState() {
    currentButtons = ConnectButton(connect: () {
      connectWallet();
    });
    checkIfWalletIsConnected();
    super.initState();
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.42),
          Row(
            children: [
              SizedBox(width: 22),
              Container(
                height: 32,
                child: Image.network(this.widget.info.imageLink),
              ),
              SizedBox(width: 12),
              Text(
                this.widget.info.name,
                style: TextStyle(
                  color: Color.fromRGBO(234, 246, 255, 1.0),
                  fontSize: 32,
                  fontFamily: 'Hind',
                ),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).focusColor,
            indent: 12,
            endIndent: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  this.widget.info.description,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
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
