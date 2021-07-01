import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/crypt.dart';

class GetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => GetAdressOverlay(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Column(
              children: [
                Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).focusColor,
                  size: 32,
                ),
                SizedBox(height: 5),
                Text(
                  'GET',
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              side: BorderSide(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GetAdressOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GetAdressOverlayState();
}

class GetAdressOverlayState extends State<GetAdressOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentWidget;

  void copyAdressToClipboard() async {
    var crypt = Crypt();
    var adress = await crypt.getPersonalAdress();
    FlutterClipboard.copy(adress);
    setState(() {
      currentWidget = KeyIsCopied();
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.pop(context);
      });
    });
  }

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
    currentWidget = KeyCopyWidget(() {
      copyAdressToClipboard();
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
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 32, 50, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Copy your public adress and give it to the sender.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 4),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 233),
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
          ),
        ),
      ),
    );
  }
}

class KeyCopyWidget extends StatelessWidget {
  final Function onPressed;
  KeyCopyWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        Icons.copy,
        color: Theme.of(context).focusColor,
        size: 42,
      ),
    );
  }
}

class KeyIsCopied extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline_rounded,
      color: Theme.of(context).focusColor,
      size: 42,
    );
  }
}
