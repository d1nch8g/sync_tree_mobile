import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/widgets/all.dart';
import '/crypt.dart';

class GenerateNewKeys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => ButtonOverlay(
                  () {},
                  mainText: 'Sure?\n'
                      'current key will\n'
                      'be replaced with\n'
                      'generated',
                  buttonText: 'continue',
                ));
      },
      leading: Icon(
        Icons.handyman_sharp,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Generate new keys',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'If you generate new keys, current keys will be deleted. Save them in safe place.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class GenerateKeyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateKeyOverlayState();
}

class GenerateKeyOverlayState extends State<GenerateKeyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 320));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  var crypt = Crypt();

  Widget currentWidget = KeysNotReady();

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
                    'Press this button\n'
                    'to paste a key\n'
                    'from clipboard',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 720),
                    child: currentWidget,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) =>
                        ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KeysNotReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: SpinKitCubeGrid(
          color: Theme.of(context).focusColor,
          size: 142.0,
          duration: const Duration(milliseconds: 1124),
        ),
      ),
    );
  }
}
