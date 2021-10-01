import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';

class WalletLogo extends StatefulWidget {
  @override
  State<WalletLogo> createState() => _WalletLogoState();
}

class _WalletLogoState extends State<WalletLogo> {
  String mainBalance = '0';
  int attachedWallets = 0;
  int ownedTOkens = 0;

  updateInformation() async {
    var bal = await Storage.loadMainBalance();
    mainBalance = Balance.fromInt(balance: bal, delimiter: 2);
    var connectedWallets = await Storage.loadConnectedWallets();
    attachedWallets = connectedWallets.length;
    connectedWallets.forEach((adress) async {
      if ((await Storage.loadMarketBalance(adress)) != 0) {
        ownedTOkens += 1;
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_balance_wallet,
          size: MediaQuery.of(context).size.height * 0.125,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallets',
              style: Theme.of(context).textTheme.headline4,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'SyncTree balance: $mainBalance',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Attached wallets: $attachedWallets',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Owned tokens: $ownedTOkens',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => MarketHelpOverlay(),
            );
          },
          icon: Icon(
            Icons.help_rounded,
          ),
        ),
      ],
    );
  }
}

class MarketHelpOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketHelpOverlayState();
}

class MarketHelpOverlayState extends State<MarketHelpOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MARKET INFO',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: SingleChildScrollView(
                      child: Text(
                        ' This is wallet page. Here you can find all of your connected wallets and ',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    child: Text('close'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
