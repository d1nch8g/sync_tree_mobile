import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/password.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          passwordCheck(
            context,
            () {
              showDialog(
                context: context,
                builder: (_) => GetAdressOverlay(),
              );
            },
          );
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
    setState(() {
      adressWidget = RecieverTextField(adressTextController, () {
        onAdressTypingEnd();
      });
      amountWidget = AmountTextField(amountTextController, () {
        onAmountTypingEnd();
      });
      sendWidget = Text('');
    });
  }

  void onAdressTypingEnd() async {
    try {
      var userInfo = await InfoCalls.userInfo(adressTextController.text);
      setState(() {
        adressWidget = Text(
          userInfo.name,
          style: Theme.of(context).textTheme.headline2,
        );
      });
      adressReady = true;
      if (adressReady && amountReady) {
        spawnSendButton();
      }
    } catch (e) {}
  }

  void onAmountTypingEnd() async {
    var curBalance = await Storage.loadMainBalance();
    try {
      var balance = int.parse(amountTextController.text);
      if (curBalance >= balance) {
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
      } else {
        setState(() {
          amountWidget = Icon(
            Icons.do_disturb_alt_rounded,
            color: Theme.of(context).focusColor,
            size: 54,
          );
          Future.delayed(Duration(milliseconds: 610), () {
            setState(() {
              amountWidget = AmountTextField(
                amountTextController,
                () {
                  onAmountTypingEnd();
                },
              );
            });
          });
        });
      }
    } catch (e) {
      setState(() {
        amountWidget = Icon(
          Icons.help_outline_rounded,
          color: Theme.of(context).focusColor,
          size: 54,
        );
        Future.delayed(Duration(milliseconds: 610), () {
          setState(() {
            amountWidget = AmountTextField(
              amountTextController,
              () {
                onAmountTypingEnd();
              },
            );
          });
        });
      });
    }
  }

  void spawnSendButton() {
    setState(() {
      sendWidget = SendButtonInOverlay(() {
        onSendButtonPress();
      });
    });
  }

  void substractFromCurrentBalance(int amount) async {
    var balance = await Storage.loadMainBalance();
    var newBalance = balance - amount;
    Storage.saveMainBalance(newBalance);
  }

  void onSendButtonPress() async {
    var succeded = await UserCalls.sendMain(
      int.parse(amountTextController.text),
      adressTextController.text,
    );
    if (succeded) {
      var sendAmount = int.parse(amountTextController.text);
      substractFromCurrentBalance(sendAmount);
      setState(() {
        sendWidget = Icon(
          Icons.check_circle_outline_rounded,
          color: Theme.of(context).focusColor,
          size: 46,
        );
      });
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.pop(context);
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
            width: MediaQuery.of(context).size.width * 0.8,
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
                    duration: Duration(milliseconds: 377),
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
                    duration: Duration(milliseconds: 377),
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
  final Function onAdressTypingEnd;
  RecieverTextField(
    this.controller,
    this.onAdressTypingEnd,
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
        this.widget.onAdressTypingEnd();
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
            this.widget.onAdressTypingEnd();
          },
        ),
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}

class AmountTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function onAmountTypingEnd;
  AmountTextField(
    this.controller,
    this.onAmountTypingEnd,
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
            this.widget.onAmountTypingEnd();
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
