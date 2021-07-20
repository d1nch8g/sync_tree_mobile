import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:clipboard/clipboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_calls/infoUser.dart';
import '../_local/pin.dart';
import '../_local/crypt.dart';
import '../_local/keys.dart';

import 'package:sync_tree_mobile/navigator.dart';

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

  onPressAction(context) async {
    var allKeys = await FlutterClipboard.paste();
    if (checkAllKeys(allKeys)) {
      var persPub = keyToBytes(allKeys.split('|')[1]);
      var persAdress = hash(persPub);
      var newName = await userFindName(base64.encode(persAdress));
      if (newName != "====") {
        saveSingleStringKeys(allKeys);
        setState(() {
          buttonToAnimate = SucessButton();
        });
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('pubName', newName);
        mainStreamController.add('pubNameEvent');
        Future.delayed(Duration(milliseconds: 377), () {
          Navigator.pop(context);
        });
        return;
      }
    }
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
