import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/src/net/user_calls.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CancelButton extends StatefulWidget {
  final String adress;
  CancelButton({required this.adress});
  @override
  _CancelButtonState createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> {
  Widget button = Container();

  cancelTrades() async {
    Navigator.pop(context);
    var cancelled = await UserCalls.cancelTrade(widget.adress);
    if (cancelled) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: 'Trade has been canceled!',
          backgroundColor: Theme.of(context).hoverColor,
          textStyle: Theme.of(context).textTheme.headline2!,
          icon: const Icon(
            Icons.task_rounded,
            color: const Color(0x15000000),
            size: 100,
          ),
          iconRotationAngle: 18,
        ),
      );
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'Unable to cancel trade!',
          textStyle: Theme.of(context).textTheme.headline2!,
          icon: const Icon(
            Icons.signal_cellular_connected_no_internet_0_bar_rounded,
            color: const Color(0x15000000),
            size: 100,
          ),
          iconRotationAngle: 18,
        ),
      );
    }
  }

  checkIfUserHasTrades() async {
    var has = await InfoCalls.hasTrades(widget.adress);
    if (has) {
      setState(() {
        button = TextButton(
          child: Text('cancel'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CancelTradeOverlay(cancelTrades: () {
                cancelTrades();
              }),
            );
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfUserHasTrades();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 377),
      child: button,
    );
  }
}

class CancelTradeOverlay extends StatefulWidget {
  final Function cancelTrades;
  CancelTradeOverlay({required this.cancelTrades});
  @override
  State<StatefulWidget> createState() => CancelTradeOverlayState();
}

class CancelTradeOverlayState extends State<CancelTradeOverlay>
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
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'CANCEL TRADE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  SizedBox(height: 6),
                  Text(
                    'If you want to cancel active order, and get the offer '
                    'back press the button below.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        child: Text('close'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          widget.cancelTrades();
                        },
                        child: Text('cancel trade'),
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
