import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:clipboard/clipboard.dart';
import 'package:sync_tree_mobile/_local/stream.dart';
import 'package:sync_tree_mobile/_net/unified_calls.dart';

import '../_local/password.dart';
import '../_local/crypto.dart';
import '../_local/keys.dart';

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
            width: MediaQuery.of(context).size.width * 0.8,
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
          'Are you sure?\nIf you paste new key, old one will be removed and lost',
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

  nameUpdateEvent() async {
    triggerEvent(Trigger.publicNameUpdate);
  }

  onPressAttemtToChangeKeys(context) async {
    var clipboardKeys = await FlutterClipboard.paste();
    var keysCheckedSuccess = await importKeysFromString(clipboardKeys);
    if (keysCheckedSuccess) {
      loadNameFromNet();
      setState(() {
        buttonToAnimate = SucessButton();
      });
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.pop(context);
      });
      return;
    }
    setState(() {
      buttonToAnimate = ErrorButton();
      Future.delayed(Duration(milliseconds: 377), () {
        setState(() {
          buttonToAnimate = PasteButton(() {
            onPressAttemtToChangeKeys(context);
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    buttonToAnimate = PasteButton(() {
      onPressAttemtToChangeKeys(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Press this button to paste a key from clipboard',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
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
        SizedBox(height: 15),
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
        Icons.do_not_disturb,
        size: 52,
        color: Theme.of(context).focusColor,
      ),
    );
  }
}
