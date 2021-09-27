import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
      cursorColor: Theme.of(context).focusColor,
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
        labelText: 'type market name',
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          color: Theme.of(context).focusColor,
          onPressed: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
