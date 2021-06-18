import 'dart:async';
import 'package:flutter/material.dart';

import 'package:clipboard/clipboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/widgets/all.dart';
import '/crypt.dart';

class ChangeKeyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ButtonOverlay(
            () {
              Navigator.pop(context);
              Future.delayed(Duration(milliseconds: 233), () {
                showDialog(
                  context: context,
                  builder: (_) => KeyInputOverlay(),
                );
              });
            },
            mainText: 'Are you sure?\n'
                'current key will\n'
                'be forever lost',
            buttonText: 'continue',
          ),
        );
      },
      leading: Icon(
        Icons.vpn_key,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Change private key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'When you use another private key current one will be lost.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class KeyInputOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KeyInputOverlayState();
}

class KeyInputOverlayState extends State<KeyInputOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  Widget buttonToAnimate;

  onPressAction(context) async {
    final crypt = Crypt();
    var key = await FlutterClipboard.paste();
    if (crypt.checkPrivateKey(key)) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('persPriv', key);
      setState(() {
        buttonToAnimate = SucessButton();
        Future.delayed(Duration(milliseconds: 377), () {
          Navigator.pop(context);
        });
      });
    } else {
      var _timer = Timer(Duration(milliseconds: 987), () {
        Navigator.pop(context);
      });
      showDialog(
        context: context,
        builder: (_) => MessageOverlay(
          mainText: 'invalid key',
        ),
      ).then(
        (value) => {
          if (_timer.isActive) {_timer.cancel()},
        },
      );
    }
  }

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
    buttonToAnimate = PasteButton(() {
      onPressAction(context);
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
                    'Press this button\n'
                    'to paste a key\n'
                    'from clipboard',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  AnimatedSwitcher(
                    child: buttonToAnimate,
                    duration: Duration(milliseconds: 144),
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

class PasteButton extends StatelessWidget {
  final Function onPressed;
  PasteButton(this.onPressed);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: IconButton(
        splashRadius: 52,
        color: Theme.of(context).focusColor,
        iconSize: 48,
        icon: Icon(Icons.copy),
        onPressed: onPressed,
      ),
    );
  }
}

class SucessButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Icon(
        Icons.check_circle_outline,
        size: 52,
        color: Theme.of(context).focusColor,
      ),
    );
  }
}
