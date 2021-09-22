import 'dart:async';

import 'package:flutter/material.dart';
import '../src/src.dart';
import '../password.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
        passwordCheck(
          context,
          () {
            showDialog(
              context: context,
              builder: (_) => SetPinOverlay(),
              barrierDismissible: false,
            );
          },
        );
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

class SetPinOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SetPinOverlayState();
}

class SetPinOverlayState extends State<SetPinOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentWidget;
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
      removePassword,
      textController,
    );
  }

  void setPassword() async {
    Storage.savePassword(textController.text);
    if (textController.text == '') {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'Enter or remove pin!',
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
      return;
    }
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
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: 'Pin has been set!',
        backgroundColor: Theme.of(context).backgroundColor,
        icon: Icon(
          Icons.lock_outline_rounded,
          color: const Color(0x15000000),
          size: 120,
        ),
        textStyle: Theme.of(context).textTheme.headline2!,
      ),
    );
  }

  void removePassword() async {
    Storage.savePassword('');
    setState(() {
      currentWidget = Icon(
        Icons.lock_open_rounded,
        color: Theme.of(context).focusColor,
        size: 89,
      );
      Future.delayed(Duration(milliseconds: 610 + 233), () {
        Navigator.pop(context);
      });
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'Pin has been removed!',
          backgroundColor: Theme.of(context).backgroundColor,
          icon: Icon(
            Icons.lock_open_rounded,
            color: const Color(0x15000000),
            size: 120,
          ),
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
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
                      'set or remove pin',
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
                      child: Text('set'),
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
  final Function removePassword;
  final TextEditingController controller;
  PasswordTextField(
    this.setPassword,
    this.removePassword,
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
        suffixIcon: IconButton(
          icon: Icon(Icons.do_not_disturb),
          color: Theme.of(context).focusColor,
          onPressed: () {
            removePassword();
          },
        ),
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}
