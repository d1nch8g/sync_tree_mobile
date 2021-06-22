import 'dart:async';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';

import '../security/pin.dart';

class CopyKeyTile extends StatelessWidget {
  Future<String> getPrivKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('persPriv');
    return key ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      onTap: () {
        checkPwd(
          context,
          () {
            getPrivKey().then((privateKeyPem) {
              FlutterClipboard.copy(privateKeyPem);
              var _timer = Timer(Duration(milliseconds: 1597), () {
                Navigator.of(context).pop();
              });
              showDialog(
                context: context,
                builder: (_) => KeyCopyOverlay(),
              ).then(
                (value) => {
                  if (_timer.isActive) {_timer.cancel()}
                },
              );
            });
          },
          PinEnum.copyPrivate,
        );
      },
      leading: Icon(
        Icons.vpn_key_outlined,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Copy private key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Get copy of your private key saved on your device and copy it to clipboard.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class KeyCopyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KeyCopyOverlayState();
}

class KeyCopyOverlayState extends State<KeyCopyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  double keyOpacity = 0;
  double arrowOpacity = 0;
  double copyOpacity = 0;

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
    Future.delayed(Duration(milliseconds: 233), () {
      setState(() {
        keyOpacity = 1;
      });
      Future.delayed(Duration(milliseconds: 233), () {
        setState(() {
          arrowOpacity = 1;
        });
        Future.delayed(Duration(milliseconds: 233), () {
          setState(() {
            copyOpacity = 1;
          });
        });
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
              padding: const EdgeInsets.fromLTRB(50, 32, 50, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'key copied\n'
                    'to clipboard',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedOpacity(
                        opacity: keyOpacity,
                        duration: Duration(milliseconds: 233),
                        child: Icon(
                          Icons.vpn_key_rounded,
                          size: 42,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: arrowOpacity,
                        duration: Duration(milliseconds: 233),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 42,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: copyOpacity,
                        duration: Duration(milliseconds: 233),
                        child: Icon(
                          Icons.copy,
                          size: 42,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                    ],
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
