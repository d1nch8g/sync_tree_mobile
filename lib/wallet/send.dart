import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
