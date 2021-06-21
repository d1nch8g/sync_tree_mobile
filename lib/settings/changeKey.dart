import 'dart:async';
import 'package:flutter/material.dart';

import 'package:clipboard/clipboard.dart';

import '/security/pin.dart';
import '/crypt.dart';

class ChangeKeyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        checkPwd(
          context,
          () {
            showDialog(
              context: context,
              builder: (_) => ChangeKeyOverlay(),
            );
          },
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

class ChangeKeyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeKeyOverlayState();
}

class ChangeKeyOverlayState extends State<ChangeKeyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentContent;

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
    currentContent = QuestionContent(() {
      setState(() {
        currentContent = KeyCopyContent();
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
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 377),
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

class QuestionContent extends StatelessWidget {
  final Function onPressed;
  QuestionContent(this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Are you sure?\n'
          'if you paste\n'
          'new key, old one\n'
          'will be deleted',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: Text(
              'continue',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              onPressed();
            },
          ),
        ),
      ],
    );
  }
}

class KeyCopyContent extends StatefulWidget {
  @override
  _KeyCopyContentState createState() => _KeyCopyContentState();
}

class _KeyCopyContentState extends State<KeyCopyContent> {
  late Widget buttonToAnimate;
  final crypt = Crypt();

  onPressAction(context) async {
    var allKeys = await FlutterClipboard.paste();
    var firstKey = allKeys.split('|');
    if (crypt.checkPrivateKey(firstKey[0])) {
      setState(() {
        crypt.saveSingleStringKeys(allKeys);
        buttonToAnimate = SucessButton();
        Future.delayed(Duration(milliseconds: 377), () {
          Navigator.pop(context);
        });
      });
    } else {
      setState(() {
        buttonToAnimate = ErrorButton();
        Future.delayed(Duration(milliseconds: 377), () {
          setState(() {
            buttonToAnimate = PasteButton(() {
              onPressAction(context);
            });
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    buttonToAnimate = PasteButton(() {
      onPressAction(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        onPressed: () {
          onPressed();
        },
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

class ErrorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Icon(
        Icons.do_disturb,
        size: 52,
        color: Theme.of(context).focusColor,
      ),
    );
  }
}
