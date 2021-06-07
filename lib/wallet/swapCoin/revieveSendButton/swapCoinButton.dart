import 'package:flutter/material.dart';
import '../../../_reusable/colors.dart';

class SwapCoinButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() onPressed;
  SwapCoinButton({
    this.text,
    this.iconData,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: TextButton(
        child: SizedBox(
          width: 58,
          child: Column(
            children: [
              Icon(iconData),
              Text(text),
            ],
          ),
        ),
        style: TextButton.styleFrom(
          primary: palette.textColor,
          backgroundColor: palette.appBarColor,
          side: BorderSide(
            width: 2,
            color: palette.buttonBorderColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
