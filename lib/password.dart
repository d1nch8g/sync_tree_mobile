import 'dart:async';

import 'package:flutter/material.dart';

import 'storage.dart';

void passwordCheck(context, Function onSucess) async {
  var pwd = await loadValue(StorageKey.password);
  if (pwd == '') {
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
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late String currentPassword;
  late Widget animatedWidget;
  TextEditingController textController = TextEditingController();

  void checkInputPassword() async {
    var pwd = await loadValue(StorageKey.password);
    if (pwd != textController.text) {
      setState(() {
        animatedWidget = WronPinIcon();
        textController.text = '';
        Future.delayed(
          Duration(
            milliseconds: 610,
          ),
          () {
            setState(() {
              animatedWidget = PinTextField(textController);
            });
          },
        );
      });
    } else {
      setState(() {
        animatedWidget = CorrectPinIcon();
      });
      Future.delayed(Duration(milliseconds: 377), () {
        Navigator.of(context).pop();
      });
      Future.delayed(Duration(milliseconds: 610), () {
        this.widget.onSucess();
      });
    }
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
    animatedWidget = PinTextField(textController);
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
              padding: const EdgeInsets.fromLTRB(42, 22, 42, 14),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'enter pin',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 12),
                    AnimatedSwitcher(
                      child: animatedWidget,
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

class PinTextField extends StatelessWidget {
  final TextEditingController controller;
  PinTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: TextField(
        controller: controller,
        obscureText: true,
        autofocus: true,
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
        ),
        cursorColor: Theme.of(context).focusColor,
      ),
    );
  }
}

class WronPinIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Icon(
        Icons.do_disturb,
        color: Theme.of(context).focusColor,
        size: 61,
      ),
    );
  }
}

class CorrectPinIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Icon(
        Icons.check_circle_outline_rounded,
        color: Theme.of(context).focusColor,
        size: 61,
      ),
    );
  }
}
