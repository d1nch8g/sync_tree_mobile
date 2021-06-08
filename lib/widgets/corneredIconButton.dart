import 'package:flutter/material.dart';

class RcorneredIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color backGroundColor;
  final Color iconColor;
  final Color splashColor;
  final double size;

  RcorneredIconButton({
    this.icon,
    this.onPressed,
    this.backGroundColor = Colors.grey,
    this.iconColor = Colors.white,
    this.splashColor = Colors.white,
    this.size = 42,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backGroundColor,
        child: InkWell(
          splashColor: splashColor,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
