import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ConnectionButton extends StatefulWidget {
  final String adress;
  ConnectionButton({required this.adress});
  @override
  State<ConnectionButton> createState() => _ConnectionButtonState();
}

class _ConnectionButtonState extends State<ConnectionButton> {
  String buttonText = '';
  Function currentFunction = () {};

  connectWallet() async {
    Storage.addConnectedMarket(widget.adress);
    setState(() {
      buttonText = 'detach';
      currentFunction = () {
        detachWallet();
      };
    });
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
  }

  detachWallet() async {
    Storage.removeConnectedMarket(widget.adress);
    setState(() {
      buttonText = 'attach';
      currentFunction = () {
        connectWallet();
      };
    });
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: 'Wallet detached!',
        textStyle: Theme.of(context).textTheme.headline2!,
        icon: const Icon(
          Icons.account_balance_wallet_rounded,
          color: const Color(0x15000000),
          size: 100,
        ),
        iconRotationAngle: 18,
      ),
    );
  }

  checkConnection() async {
    var connected = await Storage.checkIfMarketConnected(widget.adress);
    if (connected) {
      setState(() {
        buttonText = 'detach';
        currentFunction = () {
          detachWallet();
        };
      });
    } else {
      setState(() {
        buttonText = 'attach';
        currentFunction = () {
          connectWallet();
        };
      });
    }
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
          currentFunction();
        },
      ),
    );
  }
}
