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
              showDialog(
                context: context,
                builder: (_) => KeyInputOverlay(),
              );
            },
            mainText: 'Sure?\n'
                'current key will\n'
                'be deleted',
            buttonText: 'ok',
          ),
        );
      },
      leading: Icon(
        Icons.lock,
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
                  IconButton(
                    splashRadius: 52,
                    color: Theme.of(context).focusColor,
                    iconSize: 48,
                    icon: Icon(
                      Icons.paste_sharp,
                    ),
                    onPressed: () async {
                      var key = await FlutterClipboard.paste();
                      if (crypt.checkPrivateKey(key)) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('persPriv', key);
                        var _timer = Timer(Duration(milliseconds: 610), () {
                          Navigator.of(context).pop();
                        });
                        showDialog(
                          context: context,
                          builder: (_) => MessageOverlay(
                            mainText: 'key changed',
                          ),
                        ).then((value) => {
                              if (_timer.isActive) {_timer.cancel()},
                              Future.delayed(Duration(milliseconds: 233), () {
                                Navigator.pop(context);
                                Future.delayed(Duration(milliseconds: 144), () {
                                  Navigator.pop(context);
                                });
                              }),
                            });
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => MessageOverlay(
                            mainText: 'invalid key',
                          ),
                        );
                      }
                    },
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
