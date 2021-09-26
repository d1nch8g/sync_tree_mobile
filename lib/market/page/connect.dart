import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ConnectButton extends StatefulWidget {
  final String adress;
  ConnectButton({required this.adress});
  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  Widget connectButton = Container();

  checkConnection() async {
    var connected = await Storage.checkIfMarketConnected(widget.adress);
    if (!connected) {
      connectButton = TextButton(
        child: Text('connect'),
        onPressed: () {
          Storage.addConnectedMarket(widget.adress);
          showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: 'Added to wallets!',
              backgroundColor: Theme.of(context).hoverColor,
              textStyle: Theme.of(context).textTheme.headline2!,
              icon: const Icon(
                Icons.account_balance_wallet_rounded,
                color: const Color(0x15000000),
                size: 100,
              ),
              iconRotationAngle: 18,
            ),
          );
        },
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 377),
      child: connectButton,
    );
  }
}
