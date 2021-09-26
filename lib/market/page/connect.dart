import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ConnectButton extends StatefulWidget {
  final String marketAdress;
  ConnectButton({required this.marketAdress});
  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  Widget connectButton = Container();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 377),
      child: TextButton(
        child: Text('connect'),
        onPressed: () {
          Storage.addConnectedMarket(widget.marketAdress);
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
      ),
    );
  }
}
