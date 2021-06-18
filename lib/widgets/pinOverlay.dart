import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'messageOverlay.dart';

void checkPwd(context, Function onSucess) async {
  var prefs = await SharedPreferences.getInstance();
  if (prefs.getString('pwd') == null) {
    onSucess();
  } else {
    showDialog(
      context: context,
      builder: (_) => PinOverlay(onSucess),
    );
  }
}

class PinOverlay extends StatefulWidget {
  final Function onSucess;
  PinOverlay(this.onSucess);
  @override
  State<StatefulWidget> createState() => PinOverlayState();
}

class PinOverlayState extends State<PinOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController textController = TextEditingController();
  String currentPassword;

  void checkInputPassword() async {
    var prefs = await SharedPreferences.getInstance();
    print(prefs.getString('pwd'));
    if (prefs.getString('pwd') != textController.text) {
      var _timer = Timer(Duration(milliseconds: 610), () {
        Navigator.of(context).pop();
      });
      showDialog(
        context: context,
        builder: (_) => MessageOverlay(
          mainText: 'wrong password',
        ),
      ).then(
        (value) => {
          if (_timer.isActive) {_timer.cancel()}
        },
      );
    } else {
      Navigator.of(context).pop();
      Future.delayed(Duration(milliseconds: 377), () {
        this.widget.onSucess();
      });
    }
  }

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
              padding: const EdgeInsets.fromLTRB(42, 22, 42, 14),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'enter pin',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: textController,
                      obscureText: true,
                      autofocus: true,
                      onEditingComplete: () {
                        checkInputPassword();
                      },
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Theme.of(context).focusColor),
                        ),
                        labelStyle: TextStyle(
                          color: Theme.of(context).focusColor,
                        ),
                        hoverColor: Theme.of(context).focusColor,
                        fillColor: Theme.of(context).focusColor,
                        focusColor: Theme.of(context).focusColor,
                      ),
                      cursorColor: Theme.of(context).focusColor,
                    ),
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        checkInputPassword();
                      },
                      child: Text('continue'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
