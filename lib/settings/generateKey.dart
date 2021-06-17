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
            () {
              showDialog(
                context: context,
                builder: (_) => GenerateKeyOverlay(),
              );
            },
            mainText: 'Sure?\n'
                'current key will\n'
                'be replaced with\n'
                'generated',
            buttonText: 'continue',
          ),
        );
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

  buildKeys() async {
    var crypt = Crypt();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var futKeys = crypt.generateKeys();
    futKeys.then((keys) => {
          prefs.setString('persPriv', keys[0]),
          prefs.setString('persPub', keys[1]),
          changeWidget(),
        });
  }

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
    buildKeys();
  }

  Widget currentWidget = KeysNotReady();

  changeWidget() {
    setState(() {
      currentWidget = KeysAreReady();
    });
    Future.delayed(Duration(milliseconds: 610), () {
      Navigator.pop(context);
      Future.delayed(Duration(milliseconds: 144), () {
        Navigator.pop(context);
      });
    });
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
                    'Building new keys\n',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 377),
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
      width: 200,
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

class KeysAreReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Center(
        child: Icon(
          Icons.check_box_outlined,
          size: 180,
          color: Theme.of(context).focusColor,
        ),
      ),
    );
  }
}
