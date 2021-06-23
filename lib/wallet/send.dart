import 'package:clipboard/clipboard.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userInfo.dart';
import 'package:sync_tree_mobile/api/userSend.dart';
import 'package:sync_tree_mobile/navigator.dart';
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
  late Widget adressWidget;
  final TextEditingController adressTextController = TextEditingController();
  late Widget amountWidget;
  final TextEditingController amountTextController = TextEditingController();
  late Widget sendWidget;
  var adressReady = false;
  var amountReady = false;

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
    setState(() {
      adressWidget = RecieverTextField(adressTextController, () {
        onNameTypingEnd();
      });
      amountWidget = AmountTextField(amountTextController, () {
        onBalanceTyprintEnd();
      });
      sendWidget = Text('');
    });
  }

  void onNameTypingEnd() async {
    var name = await userName(adressTextController.text);
    if (name != '====') {
      setState(() {
        adressWidget = Text(
          name,
          style: Theme.of(context).textTheme.headline2,
        );
      });
      adressReady = true;
      if (adressReady && amountReady) {
        spawnSendButton();
      }
    }
  }

  void onBalanceTyprintEnd() async {
    var prefs = await SharedPreferences.getInstance();
    var curBalance = prefs.getInt('balance')!;
    if (curBalance >= int.parse(amountTextController.text)) {
      setState(() {
        amountWidget = Text(
          amountTextController.text,
          style: Theme.of(context).textTheme.headline2,
        );
      });
      amountReady = true;
      if (adressReady && amountReady) {
        spawnSendButton();
      }
    }
  }

  void spawnSendButton() {
    setState(() {
      sendWidget = SendButtonInOverlay(() {
        onSendButtonPress();
      });
    });
  }

  void onSendButtonPress() async {
    var succeded = await userSend(
      adressTextController.text,
      Int64.parseInt(amountTextController.text),
    );
    if (succeded) {
      setState(() {
        sendWidget = Icon(
          Icons.check_circle_outline_rounded,
          color: Theme.of(context).focusColor,
          size: 46,
        );
      });
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.pop(context);
        Future.delayed(Duration(milliseconds: 144), () {
          mainStreamController.add('balanceChange');
        });
      });
    } else {
      setState(() {
        sendWidget = Icon(
          Icons.do_disturb_alt_rounded,
          color: Theme.of(context).focusColor,
          size: 46,
        );
      });
      Future.delayed(
        Duration(milliseconds: 610),
        () {
          setState(() {
            sendWidget = SendButtonInOverlay(() {
              onSendButtonPress();
            });
          });
        },
      );
    }
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
              padding: const EdgeInsets.fromLTRB(18, 32, 18, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 233),
                    child: adressWidget,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) =>
                        ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  ),
                  SizedBox(height: 17),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 233),
                    child: amountWidget,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) =>
                        ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  ),
                  SizedBox(height: 17),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 233),
                    child: sendWidget,
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

class RecieverTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function onAdressEdit;
  RecieverTextField(
    this.controller,
    this.onAdressEdit,
  );
  @override
  _RecieverTextFieldState createState() => _RecieverTextFieldState();
}

class _RecieverTextFieldState extends State<RecieverTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.widget.controller,
      onEditingComplete: () {
        this.widget.onAdressEdit();
      },
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
        labelText: 'Reciever adress',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.copy,
          ),
          color: Theme.of(context).focusColor,
          onPressed: () async {
            var text = await FlutterClipboard.paste();
            this.widget.controller.text = text;
            this.widget.onAdressEdit();
          },
        ),
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}

class AmountTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function onAmountEdit;
  AmountTextField(
    this.controller,
    this.onAmountEdit,
  );
  @override
  _AmountTextFieldState createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.widget.controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
        labelText: 'Send amount',
        suffixIcon: IconButton(
          onPressed: () {
            this.widget.onAmountEdit();
          },
          icon: Icon(Icons.check_circle_rounded),
          color: Theme.of(context).focusColor,
        ),
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}

class SendButtonInOverlay extends StatelessWidget {
  final Function send;
  SendButtonInOverlay(this.send);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        send();
      },
      child: Text('send'),
    );
  }
}
