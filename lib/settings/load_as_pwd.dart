import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/navigator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../src/src.dart';

class LoadAsPwd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      onTap: () async {
        showDialog(
          context: context,
          builder: (_) => LoadKeyFromPasswordsOverlay(),
        );
      },
      leading: Icon(
        Icons.save_alt_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Load private key from passwords',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'If you have exported your private key to passwords, you can now export it.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class LoadKeyFromPasswordsOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoadKeyFromPasswordsOverlayState();
}

class LoadKeyFromPasswordsOverlayState
    extends State<LoadKeyFromPasswordsOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentContent;

  @override
  void initState() {
    currentContent = QuestionContent(() {
      setState(() {
        currentContent = KeyCopyContent();
      });
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36, 32, 36, 14),
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
          'WARNING',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
        Divider(color: Theme.of(context).focusColor),
        Text(
          'Are you sure?\nIf you paste new key, old one will be removed and lost',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Text(
                  'cancel',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  'ok ',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  onPressed();
                },
              ),
            ],
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
  final TextEditingController controller = TextEditingController();

  onPressAttemtToChangeKeys(context, String clipboardKeys) async {
    try {
      var keysChecked = Keys.fromSingleString(
        multiKeyStirng: clipboardKeys.replaceAll('*^', '\n'),
      );
      Storage.saveKeys(keysChecked.allKeysString);
      setState(() {
        buttonToAnimate = SucessButton();
      });
      Storage.removeAllWallets();
      Future.delayed(Duration(milliseconds: 377), () {
        // TODO do something with that stuff
        Navigator.pop(context);
        UserCalls.updateSelfInformation();
      });
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: 'New key saved!',
          backgroundColor: Theme.of(context).hoverColor,
          icon: Icon(
            Icons.sd_storage_rounded,
            size: 120,
            color: const Color(0x15000000),
          ),
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
      return;
    } catch (e) {
      setState(() {
        buttonToAnimate = ErrorButton();
        Future.delayed(Duration(milliseconds: 377), () {
          setState(() {
            buttonToAnimate = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 1,
                      width: 1,
                      child: TextField(
                        controller: controller,
                        obscureText: false,
                        autofocus: true,
                        onEditingComplete: () {
                          onPressAttemtToChangeKeys(context, controller.text);
                        },
                      ),
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      color: Color.fromRGBO(42, 42, 114, 1.0),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close'),
                ),
              ],
            );
          });
        });
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: 'Wrong key format! Check input.',
            textStyle: Theme.of(context).textTheme.headline2!,
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    buttonToAnimate = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: 1,
              width: 1,
              child: TextField(
                controller: controller,
                obscureText: true,
                autofocus: true,
                onEditingComplete: () {
                  onPressAttemtToChangeKeys(context, controller.text);
                },
              ),
            ),
            Container(
              height: 6,
              width: 6,
              color: Color.fromRGBO(42, 42, 114, 1.0),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'NEW KEY',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
        Divider(color: Theme.of(context).focusColor),
        Text(
          'Export private key from passwords',
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
