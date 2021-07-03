import 'package:flutter/material.dart';
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
  late Widget currentContent = Text('yo');

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
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 18),
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
