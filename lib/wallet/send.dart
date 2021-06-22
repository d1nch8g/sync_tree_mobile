import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userInfo.dart';
import 'package:sync_tree_mobile/security/pin.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          checkPwd(context, () {
            showDialog(
              context: context,
              builder: (_) => GetAdressOverlay(),
            );
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Column(
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: Theme.of(context).focusColor,
                  size: 32,
                ),
                SizedBox(height: 5),
                Text(
                  'SEND',
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
    currentWidget = UserSendContent(() {
      getRecieverPublicName();
    });
  }

  void getRecieverPublicName() async {
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.71,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 32, 50, 22),
              child: AnimatedSwitcher(
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
            ),
          ),
        ),
      ),
    );
  }
}

class UserSendContent extends StatefulWidget {
  final Function() goToNextStep;
  UserSendContent(this.goToNextStep);
  @override
  _UserSendContentState createState() => _UserSendContentState();
}

class _UserSendContentState extends State<UserSendContent> {
  late Widget currentButton;

  void onPressed() async {
    var adress = await FlutterClipboard.paste();
    var name = await userName(adress);
    if (name == '====') {
      setState(() {
        currentButton = BadAdressButton();
      });
      Future.delayed(Duration(milliseconds: 377), () {
        setState(() {
          currentButton = PasteButton(() {
            onPressed();
          });
        });
      });
      return;
    }
    this.widget.goToNextStep();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      currentButton = PasteButton(() {
        onPressed();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Press this button to paste reciever adress',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 4),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 233),
          child: currentButton,
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
    );
  }
}

class PasteButton extends StatelessWidget {
  final Function onPressed;
  PasteButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(Icons.copy),
      iconSize: 42,
      color: Theme.of(context).focusColor,
    );
  }
}

class BadAdressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.do_disturb,
      ),
      iconSize: 42,
      color: Theme.of(context).focusColor,
    );
  }
}

class CheckNameContent extends StatelessWidget {
  final String name;
  CheckNameContent(this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Is that correct reciever adress?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 4),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.copy),
          iconSize: 42,
          color: Theme.of(context).focusColor,
        ),
      ],
    );
  }
}

class OperationPassedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OperationFailedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
