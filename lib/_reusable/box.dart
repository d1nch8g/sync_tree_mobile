import 'package:flutter/material.dart';

class Rbox extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  Rbox({
    Widget this.child,
    this.color = Colors.black,
    this.borderRadius = 12,
    this.padding = EdgeInsets.zero,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.grey.shade700,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
