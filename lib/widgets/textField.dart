import 'package:flutter/material.dart';

/*
Добавить следующие опции:
/ - Выделять контент при тапе на него


WIDGET WITH DISABLED KEYBOARD ON TAP:
controller.clear();
FocusScope.of(context).unfocus();
*/

class RtextField extends StatelessWidget {
  final TextEditingController controller;
  // final dynamic onItemChanged;
  final bool selectTextOnTap;
  final Widget suffixWidget;
  final String mainText;
  final String typeText;
  final EdgeInsets padding;

  RtextField({
    this.controller,
    // required this.onItemChanged,
    this.mainText,
    this.typeText,
    this.suffixWidget,
    this.selectTextOnTap = false,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    Function() onTapFunction;
    if (selectTextOnTap == true) {
      onTapFunction = () => controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.value.text.length,
          );
    } else {
      onTapFunction = () {};
    }
    return Padding(
      padding: padding,
      child: Container(
        child: TextField(
          controller: controller,
          onTap: onTapFunction,
          // onChanged: onItemChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            suffixIcon: suffixWidget,
            hintText: mainText,
            labelText: typeText,
          ),
        ),
      ),
    );
  }
}
