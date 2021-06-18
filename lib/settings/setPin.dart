import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '/widgets/all.dart';

class SetPinTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.lock_outlined,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        checkPwd(context, () {
          showDialog(
            context: context,
            builder: (_) => SetPin(),
            barrierDismissible: false,
          );
        });
      },
      title: Text(
        'Set pin',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'When you set a pin, it will be required for some operations.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class SetPin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SetPinState();
}

class SetPinState extends State<SetPin>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  Widget currentWidget;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 610),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    currentWidget = PasswordTextField(
      setPassword,
      textController,
    );
  }

  void setPassword() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('pwd', textController.text);
    setState(() {
      currentWidget = Icon(
        Icons.lock_outline_rounded,
        color: Theme.of(context).focusColor,
        size: 89,
      );
      Future.delayed(Duration(milliseconds: 610 + 233), () {
        Navigator.pop(context);
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
              padding: const EdgeInsets.fromLTRB(42, 22, 42, 14),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'set pin',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 12),
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
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        setPassword();
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

class PasswordTextField extends StatelessWidget {
  final Function setPassword;
  final TextEditingController controller;
  PasswordTextField(
    this.setPassword,
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      autofocus: true,
      keyboardType: TextInputType.number,
      onEditingComplete: () {
        setPassword();
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
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}
