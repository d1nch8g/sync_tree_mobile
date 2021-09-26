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
  String buttonText = 'detach';
  Function connectFunction = () {};

  connectWallet() async {
    Storage.addConnectedMarket(widget.adress);
    buttonText = 'connect';
    connectFunction = () {
      detachWallet();
    };
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: 'Removed from wallets!',
        textStyle: Theme.of(context).textTheme.headline2!,
        icon: const Icon(
          Icons.account_balance_wallet_rounded,
          color: const Color(0x15000000),
          size: 100,
        ),
        iconRotationAngle: 18,
      ),
    );
    setState(() {});
  }

  detachWallet() async {
    Storage.removeConnectedMarket(widget.adress);
    buttonText = 'detach';
    connectFunction = () {
      connectWallet();
    };
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: 'Wallet connected!',
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
    setState(() {});
  }

  checkConnection() async {
    var connected = await Storage.checkIfMarketConnected(widget.adress);
    if (connected) {
      buttonText = 'detach';
      connectFunction = () {
        connectWallet();
      };
    } else {
      buttonText = 'connect';
      connectFunction = () {
        detachWallet();
      };
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 377),
      child: TextButton(
        key: UniqueKey(),
        child: Text(buttonText),
        onPressed: () {
          connectFunction();
        },
      ),
    );
  }
}
