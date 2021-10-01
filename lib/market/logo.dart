import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';

class SearchLogo extends StatefulWidget {
  final List<String> marketAdresses;
  SearchLogo({required this.marketAdresses});
  @override
  _SearchLogoState createState() => _SearchLogoState();
}

class _SearchLogoState extends State<SearchLogo> {
  int owned = 0;
  int connected = 0;

  updateAdresses() {
    widget.marketAdresses.forEach((adress) async {
      var isConnected = await Storage.checkIfMarketConnected(adress);
      var loadedBalance = await Storage.loadMarketBalance(adress);
      if (isConnected) {
        setState(() {
          connected += 1;
        });
      }
      if (loadedBalance != 0) {
        setState(() {
          owned += 1;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateAdresses();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.stacked_line_chart_rounded,
          size: MediaQuery.of(context).size.height * 0.125,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Market search',
              style: Theme.of(context).textTheme.headline4,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Found: ${widget.marketAdresses.length}',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Connected: $connected',
                key: UniqueKey(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 377),
              child: Text(
                'Owned: $owned',
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
                        ' This is market search page. Here you can find new '
                        'markets, connect them (attach as a wallet), place '
                        'buy or sell orders and cancel active orders. '
                        'Be carefull, buy only trusted assets, on markets '
                        'which are verified.\n'
                        ' Sync tree system provides conditions for all markets '
                        'equally, without any fee and blocking policy, but '
                        'the resposibility for traded assets is laying on '
                        'users.\n'
                        ' Be sure to double check your markets.',
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
