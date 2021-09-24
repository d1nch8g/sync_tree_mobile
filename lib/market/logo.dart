import 'package:flutter/material.dart';

class MarketLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.stacked_line_chart_rounded,
      size: MediaQuery.of(context).size.height * 0.15,
      color: Theme.of(context).hintColor,
    );
  }
}
