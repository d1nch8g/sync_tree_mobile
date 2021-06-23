import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';

import '../api/userCreate.dart';

class KeySave extends StatefulWidget {
  @override
  _KeySaveState createState() => _KeySaveState();
}

class _KeySaveState extends State<KeySave> {
  Widget currentWidget = KeysNotReady();

  checkingKeysToBeReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('persPriv');
    if (key == null) {
      Future.delayed(
        const Duration(seconds: 4),
        () => {
          checkingKeysToBeReady(),
        },
      );
    } else {
      setState(() {
        currentWidget = CopyKeysSection();
      });
      FlutterClipboard.copy(key);
    }
  }

  @override
  void initState() {
    super.initState();
    checkingKeysToBeReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'save your key',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'Button below will copy your private key. Keep it in secret place. All assets in this app are related to this key. You can change it later in settings.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 12),
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
          ],
        ),
      ),
    );
  }
}

class KeysNotReady extends StatefulWidget {
  @override
  _KeysNotReadyState createState() => _KeysNotReadyState();
}

class _KeysNotReadyState extends State<KeysNotReady> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: SizedBox(
        height: 200,
        child: Center(
          child: SpinKitCubeGrid(
            color: Theme.of(context).focusColor,
            size: 142.0,
            duration: const Duration(milliseconds: 1124),
          ),
        ),
      ),
    );
  }
}

class CopyKeysSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: IconButton(
          icon: Icon(Icons.copy),
          splashRadius: 52,
          color: Theme.of(context).focusColor,
          iconSize: 48,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => ButtonOverlay(
                () async {
                  var succsessfullyCreated = await userCreate();
                  if (succsessfullyCreated) {
                    Navigator.pushNamed(context, '/main');
                  } else {
                    Navigator.pop(context);
                    var _timer = Timer(Duration(milliseconds: 1597), () {
                      Navigator.of(context).pop();
                    });
                    showDialog(
                      context: context,
                      builder: (_) => UserNotCreatedOverlay(),
                    ).then(
                      (value) => {
                        if (_timer.isActive) {_timer.cancel()}
                      },
                    );
                  }
                },
                mainText:
                    'Key is copied to\nclipboard. Save it\n in safe place!',
                buttonText: 'continue',
              ),
              barrierDismissible: false,
            );
          },
        ),
      ),
    );
  }
}

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
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 233),
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
                      onPressed: () {
                        this.widget.onPressed();
                      },
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

class UserNotCreatedOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserNotCreatedOverlayState();
}

class UserNotCreatedOverlayState extends State<UserNotCreatedOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 233),
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
            width: MediaQuery.of(context).size.width * 0.72,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'User is not created, check connection',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Icon(
                    Icons.wifi_off_rounded,
                    size: 144,
                    color: Theme.of(context).focusColor,
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
