import 'package:flutter/material.dart';

class ButtonOverlay extends StatefulWidget {
  final String mainText;
  final String buttonText;
  final Function onPressed;
  ButtonOverlay(
    this.onPressed, {
    this.mainText = 'error',
    this.buttonText = 'continue',
  });
  @override
  State<StatefulWidget> createState() => ButtonOverlayState();
}

class ButtonOverlayState extends State<ButtonOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 233));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

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
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.widget.mainText,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text(
                        this.widget.buttonText,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: this.widget.onPressed,
                    ),
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
