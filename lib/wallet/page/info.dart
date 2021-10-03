import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';

class InfoPage extends StatelessWidget {
  final MarketInfo info;
  final Function closeContainer;
  InfoPage({
    required this.info,
    required this.closeContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            'Output fee: ${info.outputFee / 100}%\n'
            'Input fee:    ${info.inputFee / 100}%\n'
            'Operations: ${info.operationCount}\n'
            'Buys count: ${info.activeBuys}\n'
            'Sells count: ${info.activeSells}\n'
            'Workday: ${info.workTime}',
            style: Theme.of(context).textTheme.bodyText2,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
        Divider(
          color: Theme.of(context).focusColor,
          indent: 8,
          endIndent: 8,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
              child: Text(
                info.description,
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).focusColor,
          indent: 8,
          endIndent: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DetachButton(
              closeContainer: closeContainer,
              adress: info.adress,
            ),
            FloatingButton(
              closeContainer: closeContainer,
            ),
          ],
        )
      ],
    );
  }
}

class DetachButton extends StatelessWidget {
  final String adress;
  final Function closeContainer;
  DetachButton({
    required this.adress,
    required this.closeContainer,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('detach'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => DetachOverlay(
            adress: adress,
            closeContainer: closeContainer,
          ),
        );
      },
    );
  }
}

class DetachOverlay extends StatefulWidget {
  final String adress;
  final Function closeContainer;
  DetachOverlay({
    required this.adress,
    required this.closeContainer,
  });
  @override
  State<StatefulWidget> createState() => DetachOverlayState();
}

class DetachOverlayState extends State<DetachOverlay>
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
            width: MediaQuery.of(context).size.width * 0.80,
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
                    'DETACH',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  Text(
                    'Are you sure you want to detach this wallet? It will be removed from your conncted wallets list.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        child: Text('cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('detach'),
                        onPressed: () {
                          Navigator.pop(context);
                          Storage.removeConnectedMarket(widget.adress);
                          widget.closeContainer();
                          mainStreamController.add(Trigger.walletDetached);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
