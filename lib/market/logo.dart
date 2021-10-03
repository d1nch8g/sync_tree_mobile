import 'package:flutter/material.dart';

class MarketLogo extends StatelessWidget {
  final List<String> marketAdresses;
  final int connected;
  final int owned;
  MarketLogo({
    required this.marketAdresses,
    required this.connected,
    required this.owned,
  });

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
                'Found: ${marketAdresses.length}',
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
            width: MediaQuery.of(context).size.width * 0.895,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 32, 22, 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'INFO',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: SingleChildScrollView(
                      child: Text(
                        '   This is market search page. Here you can find new markets and connect connect them as a wallet. After connection you will find them on wallet page, then you will be able to process different operations with connected assets.\n   All markets have equal rights to be traded inside this system, you should check twice wether asset you are buying is trusted enough.\n   Due to unavailability of any data modification inside distributed data storage, users have to decide wether they trust any market on their own risk!\n  Please, attentively check markets you are trading on.',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Divider(color: Theme.of(context).focusColor),
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
