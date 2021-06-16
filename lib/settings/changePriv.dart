import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/widgets/all.dart';

class ChangeKeyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ButtonOverlay(
            () {
              var controller = TextEditingController();
              showDialog(
                context: context,
                builder: (_) => KeyInputOverlay(
                  () {},
                  controller,
                  textOnTop: 'put your key here',
                  textFieldText: '',
                ),
              );
            },
            mainText: 'Are you sure?\n'
                'current key will\n'
                'be deleted',
            buttonText: 'ok',
          ),
        );
      },
      leading: Icon(
        Icons.lock,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Change private key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'When you use another private key current one will be lost.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}



class KeyInputOverlay extends StatefulWidget {
  final String textOnTop;
  final String buttonText;
  final String textFieldText;
  final Function onPressed;
  final TextEditingController controller;
  KeyInputOverlay(
    this.onPressed,
    this.controller, {
    this.textFieldText = 'type',
    this.textOnTop = 'error',
    this.buttonText = 'continue',
  });
  @override
  State<StatefulWidget> createState() => KeyInputOverlayState();
}

class KeyInputOverlayState extends State<KeyInputOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 320));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

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
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.widget.textOnTop,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      controller: this.widget.controller,
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
                        labelText: this.widget.textFieldText,
                        hoverColor: Theme.of(context).focusColor,
                        fillColor: Theme.of(context).focusColor,
                        focusColor: Theme.of(context).focusColor,
                      ),
                      cursorColor: Theme.of(context).focusColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text(
                        this.widget.buttonText,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: this.widget.onPressed,
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