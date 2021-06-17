import 'package:flutter/material.dart';

class PasswordOverlay extends StatefulWidget {
  final String text;
  PasswordOverlay({this.text = 'enter pin'});
  @override
  State<StatefulWidget> createState() => PasswordOverlayState();
}

class PasswordOverlayState extends State<PasswordOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 233));
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
              padding: const EdgeInsets.fromLTRB(42, 14, 42, 14),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      this.widget.text,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 12),
                    TextField(
                      obscureText: true,
                      autofocus: true,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text('cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
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
