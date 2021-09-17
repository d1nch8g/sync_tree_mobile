import 'package:flutter/material.dart';

class ConnectionErrorOverlay extends StatefulWidget {
  final String errorMessage;
  final Widget icon;
  ConnectionErrorOverlay({
    required this.errorMessage,
    this.icon = const Icon(
      Icons.wifi_off_rounded,
      size: 144,
      color: Color.fromRGBO(234, 246, 255, 1.0),
    ),
  });
  @override
  State<StatefulWidget> createState() => ConnectionErrorOverlayState();
}

class ConnectionErrorOverlayState extends State<ConnectionErrorOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.72,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(38, 38, 38, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.widget.errorMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  widget.icon,
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextButton(
                      child: Text('close'),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
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
