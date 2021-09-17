import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/connection.dart';
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
            width: MediaQuery.of(context).size.width * 0.29,
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
      sendWidget = Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('cancel'),
        ),
      );
    });
  }

  void onAdressTypingEnd() async {
    try {
      var userInfo = await InfoCalls.userInfo(adressTextController.text);
      setState(() {
        adressWidget = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sending to',
              style: Theme.of(context).textTheme.headline2,
            ),
            Divider(
              color: Theme.of(context).focusColor,
            ),
            Text(
              userInfo.name,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        );
      });
      adressReady = true;
      if (adressReady && amountReady) {
        spawnSendButton();
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ConnectionErrorOverlay(
          errorMessage: 'Unable to find user',
          icon: Icon(
            Icons.account_circle_rounded,
            size: 144,
            color: Color.fromRGBO(234, 246, 255, 1.0),
          ),
        ),
      );
    }
  }

  void onAmountTypingEnd() async {
    var curBalance = await Storage.loadMainBalance();
    try {
      var balance = int.parse(amountTextController.text);
      if (curBalance >= balance) {
        setState(() {
          amountWidget = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Sending amount',
                style: Theme.of(context).textTheme.headline2,
              ),
              Divider(
                color: Theme.of(context).focusColor,
              ),
              Text(
                amountTextController.text,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
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

  void onSendButtonPress() async {
    try {
      var succeded = await UserCalls.sendMain(
        int.parse(amountTextController.text),
        adressTextController.text,
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
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ConnectionErrorOverlay(
          errorMessage: 'Unbale to send. Check connection.',
        ),
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
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SEND',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You can paste reciever adress from clipboard or type it.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 22),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                send();
              },
              child: Text('send'),
            ),
          ],
        ),
      ],
    );
  }
}
