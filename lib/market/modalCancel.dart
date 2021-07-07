import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sync_tree_mobile/api/cancelTrade.dart';
import 'package:sync_tree_mobile/api/infoMarket.dart';

class CancelTradesButton extends StatelessWidget {
  final Market market;
  CancelTradesButton(this.market);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => CancelTradesOverlay(market),
        );
      },
      child: Text('cancel'),
    );
  }
}

class CancelTradesOverlay extends StatefulWidget {
  final Market market;
  CancelTradesOverlay(this.market);

  @override
  State<StatefulWidget> createState() => CancelTradesOverlayState();
}

class CancelTradesOverlayState extends State<CancelTradesOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentContent;

  void cancelTrade() async {
    var canceled = await userCancelTrade(this.widget.market.adress);
    if (canceled) {
      setState(() {
        currentContent = CanceledIcon();
      });
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  void initState() {
    currentContent = AskIfSureToCancelTrades(() {
      cancelTrade();
    });
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
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 18),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 144),
                child: currentContent,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                ) =>
                    ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AskIfSureToCancelTrades extends StatelessWidget {
  final Function cancel;
  AskIfSureToCancelTrades(this.cancel);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Are you sure? This button will stop all currently active trades',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        TextButton(
          onPressed: () {
            cancel();
          },
          child: Text('cancel trade'),
        ),
      ],
    );
  }
}

class CanceledIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline_rounded,
      color: Theme.of(context).focusColor,
      size: 120,
    );
  }
}
